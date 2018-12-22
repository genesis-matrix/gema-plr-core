##
##
##



##_META:
##



## <JINJA>
## </JINJA>



# salt-formula master config
salt:
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



## EOF
