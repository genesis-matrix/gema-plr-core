##
##
##



##_META:
##  desc:
##    example: |
##      ---
##      nodegroups:
##        group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com or bl*.domain.com'
##        group2: 'G@os:Debian and foo.domain.com'
##        group3: 'G@os:Debian and N@group1'
##        group4:
##          - 'G@foo:bar'
##          - 'or'
##          - 'G@foo:baz'
##



## <JINJA>
## </JINJA>



#
salt:
  nodegroups:
    #
    SECRETS__sdb_gema_exmpl__00a:
      - salt-master-d1

    # (testing)
    TARGETS__testing: '.*'
    CONFIGS__testing: '.*'
    #DEPLOYS__testing: 'N@TARGETS__testing'
    #
    CONFIGS__provision_target_vagrant: 'G@provision_target:vagrant'
    #   - label.machine_class.provision_target.vagrant

    # ROLE
    #SALTMASTERS: 'I@by_machine_role:salt-master'
    CONFIGS__machine_role__salt_master: 'salt-master-*'
    #   - label.machine_role.salt-master

    # PRODUCT
    TARGETS__any: '.*'
    # Hubblestack Master
    #ROLE_hubblestack_master: 'N@ROLE_saltmasters'
    #



    # ## services ##
    # #'I@machine_role:salt-master':
    # #'I@machine_class:provision_target:vagrant':
    #   - label.service_role.salt-master.gema-vagrant
    #   # - service_role.salt-master.gema
    #   # - label.service_feature.salt-master.infratest



## EOF
