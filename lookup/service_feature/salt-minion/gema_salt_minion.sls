##
##
##



##_META:
##



## <JINJA>
## <JINJA>



#
salt:
  # Set this to true to clean any non-salt-formula managed files out of
  # /etc/salt/{master,minion}.d ... You really don't want to do this on 2015.2
  # and up as it'll wipe out important files that Salt relies on.
  #+DEFAULT: clean_config_d_dir: False
  clean_config_d_dir: True
  # This state will remove "/etc/salt/minion" when you set this to true.
  minion_remove_config: True
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



  # salt minion config
  minion:



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



## EOF
