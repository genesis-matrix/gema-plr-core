##
##
##



salt:
  # Set this to true to clean any non-salt-formula managed files out of
  # /etc/salt/{master,minion}.d ... You really don't want to do this on 2015.2
  # and up as it'll wipe out important files that Salt relies on.
  #+DEFAULT: clean_config_d_dir: False
  clean_config_d_dir: True

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

  # salt master config
  master:
    fileserver_backend:
      - roots
      - git
      # - s3fs
    gitfs_remotes:
      - https://github.com/genesis-matrix/genesis-sls-core
      - https://github.com/khaije1/salt-formula:
        - mountpoint: salt://formula/salt
        - root: salt
      - https://github.com/openstack/salt-formula-kubernetes:
        - mountpoint: salt://formula/kubernetes
        #- root: kubernetes
      #- https://github.com/openstack/openstack-salt
      # infratest components
      - https://github.com/ssplatt/saltstack-infratest-module:
        - mountpoint: salt://_modules
      # Hubblestack components
      - https://github.com/hubblestack/nova:
        - base: v2016.10.1
      - https://github.com/hubblestack/quasar:
        - base: v2016.10.1
      - https://github.com/hubblestack/pulsar:
        - base: v2016.10.1
      - https://github.com/hubblestack/nebula:
        - base: v2016.10.1

    # s3.keyid: GKTADJGHEIQSXMKKRBJ08H
    # s3.key: askdjghsdfjkghWupUjasdflkdfklgjsdfjajkghs
    # s3.buckets:
    #   - bucket1
    #   - bucket2
    #   - bucket3
    #   - bucket4

    file_roots:
      base:
        - /srv/salt
        - /srv/spm/salt
        - /vagrant/srv/roots/base
        


    file_ignore_regex:
       - '/\.svn($|/)'
       - '/\.git($|/)'
       - '/\.vagrant($|/|.d/)'
    file_ignore_glob:
      # version control tracking artifacts
      - '.gitignore'
      - '.gitkeep'
      # file browser metadata/artifacts
      - '.DS_Store'
      - '.directory'
      # alt/aux testing/tooling artifacts
      - '.vagrant'
      # ignore secret/personal stuffs
      - "'*.gpg'"
      - "'*.asc'"
      - "'*.pub'"
      - "'*.rsa'"
      - id_rsa
      - "'*_rsa.pub'"
      - "'*.dsa'"
      - id_dsa
      - "'*_dsa.pub'"
      - "'*.ed25519'"
      - id_ed25519
      - "'*_ed25519.pub'"
      # unnecesary autosaves/backups
      - "'*~'"
      - "'*#*'"
      - "'~$*'"
      - "'.swp'"
      - "'*.swp'"
      - "'*bkup'"
      # compiled ao binary
      - "'*.pyc'"
      - "'*.elc'"


    
    pillar_roots:
      base:
        - /srv/pillar/base
        - /vagrant/srv/salt/pillar/base

    ext_pillar_first: False
    ext_pillar:
      # - git:
      #   - master https://github.com/genesis-matrix/genesis-plr-core.git:
      #     - env: base
      #   - PRD https://github.com/genesis-matrix/genesis-plr-core.git:
      #     - name: genesis-plr-core__PRD
      #   - UAT https://github.com/genesis-matrix/genesis-plr-core.git:
      #     - name: genesis-plr-core__UAT 
      #   - STG https://github.com/genesis-matrix/genesis-plr-core.git:
      #     - name: genesis-plr-core__STG 
      #   - DEV https://github.com/genesis-matrix/genesis-plr-core.git:
      #     - name: genesis-plr-core__DEV 
      #   - LAB https://github.com/genesis-matrix/genesis-plr-core.git:
      #     - name: genesis-plr-core__LAB 
      - file_tree:
          root_dir: /srv/pillar/base/assets/static
          follow_dir_links: False
          keep_newline: True
      # - consul: consul-00-demo-loopback root=salt/pillar/shared
      # - consul: consul-00-demo-loopback root=salt/pillar/by_minion/%(minion_id)s
      - stack:
          pillar:environment:
            base: /srv/pillar/base/pillarstack.cfg
          # grains:custom:grain:
          #   value:
          #     - /path/to/stack1.cfg
          #     - /path/to/stack2.cfg
          # opts:custom:opt:
          #   value: /path/to/stack0.cfg



    # for salt-api with tornado rest interface
    rest_tornado:
      port: 8000
      ssl_crt: /etc/pki/api/certs/server.crt
      ssl_key: /etc/pki/api/certs/server.key
      debug: False
      disable_ssl: False


    # # for profile configuration as https://docs.saltstack.com/en/latest/topics/tutorials/lxc.html#tutorial-lxc-profiles
    # lxc.container_profile:
    #   debian:
    #     template: download
    #     options:
    #       dist: debian
    #       release: jessie
    #       arch: amd64
    #     backing: lvm
    #     vgname: kimsufi
    #     size: 10G
    # lxc.network_profile:
    #   basic:
    #     eth0:
    #       link: lxcbr0
    #       type: veth
    #       flags: up
    # ## for external auth - LDAP
    #   # filter to use for Active Directory LDAP
    # auth.ldap.filter: {% raw %}'sAMAccountName={{username}}'{% endraw %}
    #   # filter to use for Most other LDAP servers
    # auth.ldap.filter: {% raw %}'uid={{ username }}'{% endraw %}

    # # optional engine configuration
    # engines:
    #   slack:
    #     token: xoxp-XXXXX-XXXXXXX
    #     control: True
    #     valid_users:
    #       - someuser
    #       - otheruser
    #     valid_commands:
    #       - test.ping
    #       - list_jobs
    #     aliases:
    #       list_jobs:
    #         type: runner
    #         cmd: jobs.list_jobs


  # # salt minion config:
  # minion:

  #   # single master setup
  #   master: salt

  #   # multi master setup
  #   master:
  #     - salt_master_1
  #     - salt_master_2

  #    fileserver_backend:
  #      - git
  #      - roots
  #    gitfs_remotes:
  #      - git://github.com/saltstack-formulas/salt-formula.git:
  #        - base: develop
  #    file_roots:
  #      base:
  #        - /srv/salt
  #    pillar_roots:
  #      base:
  #        - /srv/pillar
  #    module_config:
  #      test: True
  #      test.foo: foo
  #      test.bar:
  #        - baz
  #        - quo
  #      test.baz:
  #        spam: sausage
  #        cheese: bread

  #    salt mine setup
  #   mine_interval: 60
  #   # mine_functions can be set at the top level of the pillar, and
  #   # that is preferable because it doesn't affect the conf file and
  #   # doesn't require a minion restart. However, you can configure it
  #   # here instead if you really want to.
  #   mine_functions:
  #     network.interface_ip: [eth0]



  # # salt cloud config
  # cloud:
  #   master: salt
    
  #   #  For non-templated custom cloud provider/profile/map files
  #    providers:
  #      provider-filename1.conf:
  #        vmware-prod:
  #          driver: vmware
  #          user: myusernameprod
  #          password: mypassword
  #        vmware-nonprod:
  #          driver: vmware
  #          user: myusernamenonprod
  #          password: mypassword
  #    profiles:
  #      profile-filename1.conf:
  #        server-non-prod:
  #          clonefrom: rhel6xtemplatenp
  #          grains:
  #            platform:
  #              name: salt
  #              realm: lab
  #            subscription_level: standard
  #          memory: 8GB
  #          num_cpus: 4
  #          password: sUpErsecretey
  #          provider: vmware-nonprod
  #    maps:
  #      map-filename1.map:
  #        server-non-prod:
  #          - host.mycompany.com:
  #              grains: 
  #                environment: dev1

    # # You can take profile and map templates from an alternate location
    # # if you want to write your own.
    # template_sources:
    #   providers: salt://salt/files/cloud.providers.d
    #   profiles: salt://salt/files/cloud.profiles.d
    #   maps: salt://salt/files/cloud.maps.d

    # # These settings are used by the default provider templates and
    # # only need to be set for the ones you're using.
    # aws_key: AWSKEYIJSHJAIJS6JSH
    # aws_secret: AWSSECRETYkkDY1iQf9zRtl9+pW+Nm+aZY95
    # gce_project: test
    # gce_service_account_email_address: 867543072364-orl4h2tpp8jcn1tr9ipj@developer.gserviceaccount.com
    # rsos_user: afeawofghob
    # rsos_tenant: tenant_id_number
    # rsos_apikey: WFJIOJEOIGHSOFHESO
    # rsos_regions:
    #   - ORD
    #   - DFW
    #   - IAD
    #   - SYD
    #   - HKG



  # reactor:
  #   - 'deploy':
  #     - /srv/salt/reactors/deploy.sls


    
  # ssh_roster:
    # prod1:
    #   host: host.example.com
    #   user: ubuntu
    #   sudo: True
    #   priv: /etc/salt/ssh_keys/sshkey.pem



  # gitfs:
    # keys:
    #   global:
    #     # key and pub end up being the extension used on the key file. values other than key and pub are possible
    #     key: |
    #       -----BEGIN RSA PRIVATE KEY-----
    #       ...........
    #       -----END RSA PRIVATE KEY-----
    #     pub: |
    #       ...........



# salt_cloud_certs:
  # aws:
  #   pem: |
  #     -----BEGIN RSA PRIVATE KEY-----
  #     ...........
  #     -----END RSA PRIVATE KEY-----

  # gce:
  #   pem: |
  #     -----BEGIN RSA PRIVATE KEY-----
  #     ...........
  #     -----END RSA PRIVATE KEY-----



salt_formulas:
  git_opts:
    # The Git options can be customized differently for each
    # environment, if an option is missing in a given environment, the
    # value from "default" is used instead.
    default:
      # Update the git repository to the latest version (False by default)
      update: True
      # Options passed directly to the git.latest state
      options:
        rev: master
    # dev:
    #   basedir: /srv/formulas/dev
    #   update: True
    #   options:
    #     rev: develop
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
      - consul-formula
      - openssh-formula
      - docker-formula
    PRD:
      - postfix-formula



