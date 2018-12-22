##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
salt:
  # Set this to true to clean any non-salt-formula managed files out of
  # /etc/salt/{master,minion}.d ... You really don't want to do this on 2015.2
  # and up as it'll wipe out important files that Salt relies on.
  clean_config_d_dir: False

  # This state will remove "/etc/salt/minion" when you set this to true.
  minion_remove_config: True

  # This state will remove "/etc/salt/master" when you set this to true.
  master_remove_config: True

  # Set this to False to not have the formula install packages (in the case you
  # install Salt via git/pip/etc.)
  install_packages: True

  # to overwrite map.jinja salt packages
  lookup:
    salt-master: 'salt-master'
    salt-minion: 'salt-minion'
    salt-syndic: 'salt-syndic'
    salt-cloud: 'salt-cloud'
    salt-ssh: 'salt-ssh'

  # Set which release of SaltStack to use, default to 'latest'
  # To get the available releases:
  # * http://repo.saltstack.com/yum/redhat/7/x86_64/
  # * http://repo.saltstack.com/apt/debian/8/amd64/
  release: 2016.11

  # salt master config
  master:
    fileserver_backend:
      - git
      #- roots
    gitfs_remotes:
      - git://github.com/genesis-matrix/gema-sls-core.git
      - git://github.com/saltstack-formulas/salt-formula.git:
        - base: develop
    file_roots:
      base:
        - /srv/salt/roots/base
    pillar_roots:
      base:
        - /srv/salt/pillar/base
    # for salt-api with tornado rest interface
    rest_tornado:
      port: 8000
      ssl_crt: /etc/pki/api/certs/server.crt
      ssl_key: /etc/pki/api/certs/server.key
      debug: False
      disable_ssl: False
    ## for external auth - LDAP
      # filter to use for Active Directory LDAP
    auth.ldap.filter: {% raw %}'sAMAccountName={{username}}'{% endraw %}


    # Define winrepo provider, by default support order is pygit2, gitpython
    # Set to gitpython for Debian & Ubuntu to get around saltstack/salt#35993
    # where pygit2 is not compiled with pygit2.GIT_FEATURE_HTTPS support
    winrepo_provider: gitpython

    # optional engine configuration
    engines:
      reactor: []

    # optional: these reactors will be configured on the master
    # They override reactors configured in
    # 'salt:reactors' or the old 'salt:reactor' parameters
    reactors:
      - 'master/deploy':
        - /srv/salt/reactors/deploy.sls

  # salt minion config:
  minion:

    # single master setup
    master: localhost

    # multi master setup
    #master:
      #- salt_master_1
      #- salt_master_2

    # salt mine setup
    mine_interval: 60
    # mine_functions can be set at the top level of the pillar, and
    # that is preferable because it doesn't affect the conf file and
    # doesn't require a minion restart. However, you can configure it
    # here instead if you really want to.
    mine_functions:
      network.interface_ip: [eth0]

    # other 'non-default' config
    # auth_keytab: /root/auth.keytab
    # auth_principal: kadmin/admin

    # Optional reactors: these reactors will be configured on the minion
    # They override reactors configured in
    # 'salt:reactors' or the old 'salt:reactor' parameters
    # reactors:
    #   - 'minion/deploy':
    #     - /srv/salt/reactors/deploy.sls

  # salt cloud config
  cloud:
    #master: salt.mydomain.tld

    # For non-templated custom cloud provider/profile/map files
    providers:
      provider-filename1.conf:
        vmware-prod:
          driver: vmware
          user: myusernameprod
          password: mypassword
        vmware-nonprod:
          driver: vmware
          user: myusernamenonprod
          password: mypassword
    profiles:
      profile-filename1.conf:
        server-non-prod:
          clonefrom: rhel6xtemplatenp
          grains:
            platform:
              name: salt
              realm: lab
            subscription_level: standard
          memory: 8GB
          num_cpus: 4
          password: sUpErsecretey
          provider: vmware-nonprod
    maps:
      map-filename1.map:
        server-non-prod:
          - host.mycompany.com:
              grains:
                environment: dev1

    # You can take profile and map templates from an alternate location
    # if you want to write your own.
    template_sources:
      providers: salt://salt/files/cloud.providers.d
      profiles: salt://salt/files/cloud.profiles.d
      maps: salt://salt/files/cloud.maps.d

  # ssh_roster:
  #   prod1:
  #     host: host.example.com
  #     user: ubuntu
  #     sudo: True
  #     priv: /etc/salt/ssh_keys/sshkey.pem
  # gitfs:
  #   keys:
  #     global:
  #       # key and pub end up being the extension used on the key file. values other than key and pub are possible
  #       key: |
  #         -----BEGIN RSA PRIVATE KEY-----
  #         ...........
  #         -----END RSA PRIVATE KEY-----
  #       pub: |
  #         ...........

  # These reactors will be configured both in the minion and the master
  # reactors:
  #   - 'deploy':
  #     - /srv/salt/reactors/deploy.sls

# salt_cloud_certs:
#   aws:
#     pem: |
#       -----BEGIN RSA PRIVATE KEY-----
#       ...........
#       -----END RSA PRIVATE KEY-----

#   gce:
#     pem: |
#       -----BEGIN RSA PRIVATE KEY-----
#       ...........
#       -----END RSA PRIVATE KEY-----

salt_formulas:
  git_opts:
    # The Git options can be customized differently for each
    # environment, if an option is missing in a given environment, the
    # value from "default" is used instead.
    default:
      # URL where the formulas git repositories are downloaded from
      # it will be suffixed with <formula-name>.git
      baseurl: https://github.com/saltstack-formulas
      # Directory where Git repositories are downloaded
      basedir: /srv/salt/formulas/base
      # Update the git repository to the latest version (False by default)
      update: False
      # Options passed directly to the git.latest state
      options:
        rev: master
    next:
      basedir: /srv/salt/formulas/dev
      update: True
      options:
        rev: develop
  # Options of the file.directory state that creates the directory where
  # the git repositories of the formulas are stored
  basedir_opts:
    makedirs: True
    user: root
    group: root
    mode: 755
  # List of formulas to enable in each environment
  list:
    base:
      - salt-formula
      - postfix-formula
    next:
      - salt-formula
      - postfix-formula
      - openssh-formula



## EOF
