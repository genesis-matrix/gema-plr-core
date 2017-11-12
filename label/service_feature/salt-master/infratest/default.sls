##
##
##



# install and enable infratest
infratest:
  enabled: false
  run_all: false
  mockup:
    enabled: true
    deps:
      - git
      - python-pip
  install:
    git: true
    pkg: infratest # should a package be available in the future
    url: https://github.com/ssplatt/saltstack-infratest-module.git
    target: /srv/salt/_modules
    branch: master
    user: root
    deps:
      from_pip: true
      pkgs:
        - testinfra