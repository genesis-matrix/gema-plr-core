# -*- coding: utf-8 -*-
# vim: ft=yaml
##



##_META
##



## <JINJA>
## </JINJA>



# notes on Implementation Status
{#
---
Prerequisites:
  - A database (MariaDB/Mysql or Postgres) accessible to both your Salt master and Alcali.
  - The Salt-Api installed and accessible by Alcali.
---

#}



#
lookup:
  sls_path:
    - state._.pillar-splat:
        stanza_dct:
          "e9bd6795-8d66-4e48-b658-1074c5deff4b":
            pkg.installed:
              - pkgs:
                - python36-mysql
              - require_in:
                 - sls: mysql
    - mysql
    - mysql.remove_test_database
    - mysql.salt-user
    - mysql.database
    - mysql.user
    - salt.api
    - alcali



#
mysql:
  global:
    client-server:
      default_character_set: utf8

  clients:
    mysql:
      default_character_set: utf8
    mysqldump:
      default_character_set: utf8

  library:
    client:
      default_character_set: utf8

  pythonpkg: python36-mysql

  server:
    # Use this account for database admin (defaults to root)
    root_user: root
    #root_password: '' - to have root@localhost without password
    root_password: 'somepass'  # uses grains.server_id by default 631384581
    #root_password_hash: '*13883BDDBE566ECECC0501CDE9B293303116521A'
    user: mysql
    # my.cnf sections changes
    mysqld:
      # you can use either underscore or hyphen in param names
      bind-address: 0.0.0.0
      log_bin: /var/log/mysql/mysql-bin.log
      datadir: /var/lib/mysql
      binlog-ignore-db:
        - mysql
        - sys
        - information_schema
        - performance_schema
    mysql:
      # my.cnf param that not require value
      no-auto-rehash: noarg_present

  salt_user:
    salt_user_name: 'salt'
    salt_user_password: 'someotherpass'
    grants:
      - 'all privileges'

  # Manage databases
  database:
    # Simple definition using default charset and collate
    - foo
    # Detailed definition
    - name: bar
      character_set: utf8
      collate: utf8_general_ci
    # Delete DB
    - name: obsolete_db
      present: false
  schema:
    foo:
      load: true
      source: salt://{{ tpldir }}/files/foo.schema
    bar:
      load: false
    baz:
      load: true
      source: salt://{{ tpldir }}/files/baz.schema.tmpl
      template: jinja
    qux:
      load: true
      source: salt://{{ tpldir }}/files/qux.schema.tmpl
      template: jinja
      context:
        encabulator: Turbo
        girdlespring: differential
    quux:
      load: true
      source: salt://{{ tpldir }}/files/qux.schema.tmpl
      template: jinja
      context:
        encabulator: Retro
        girdlespring: integral

  # Manage users
  # you can get pillar for existing server using scripts/import_users.py script
  user:
    frank:
      password: 'somepass'
      host: localhost
      databases:
        - database: foo
          grants: ['select', 'insert', 'update']
          escape: true
        - database: bar
          grants: ['all privileges']
    bob:
      password_hash: '*6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4'
      host: '%'  # Any host
      ssl: true
      ssl-X509: true
      ssl-SUBJECT: Subject
      ssl-ISSUER: Name
      ssl-CIPHER: Cipher
      databases:
        # https://github.com/saltstack/salt/issues/41178
        # If you want to refer to databases using wildcards, turn off escape so
        # the renderer does not escape them, enclose the string in '`' and
        # use two '%'
        - database: '`foo\_%%`'
          grants: ['all privileges']
          grant_option: true
          escape: false
        - database: bar
          table: foobar
          grants: ['select', 'insert', 'update', 'delete']
    nopassuser:
      password: ~
      host: localhost
      databases: []
    application:
      password: 'somepass'
      mine_hosts:
        target: "G@role:database and *.example.com"
        function: "network.get_hostname"
        expr_form: compound
      databases:
        - database: foo
          grants: ['select', 'insert', 'update']

    # Remove a user
    obsoleteuser:
      host: localhost
      # defaults to true
      present: false

  # Install MySQL headers
  dev:
    # Install dev package - defaults to false
    install: false



#
salt:
  master:
    rest_cherrypy:
      port: 8080
      host: 0.0.0.0
      debug: True
      ssl_crt: /etc/pki/tls/certs/localhost.crt
      ssl_key: /etc/pki/tls/certs/localhost.key



#
alcali:
  deploy:
    repository: https://github.com/latenighttales/alcali.git
    branch: 3000.1
    user: alcali
    group: alcali
    directory: /opt/alcali
    service: alcali
    runtime: python3
  gunicorn:
    name: 'config.wsgi:application'
    host: '0.0.0.0'
    port: 5000
    workers: {{ __grains__['num_cpus'] }}
  # All the items under this section will be converted into an environment file.
  config:
    db_backend: mysql
    db_name: salt
    db_user: alcali
    db_password: alcali
    db_host: db
    db_port: 3306
    master_minion_id: master
    secret_key: 'thisisnotagoodsecret.orisit?'
    allowed_hosts: '*'
    salt_url: 'https://master:8080'
    salt_auth: alcali
