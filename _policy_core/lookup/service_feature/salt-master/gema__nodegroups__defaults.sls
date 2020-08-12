##
##
##



##_META:
##  purpose: here nodegroups are used to establish implicit attribute-group-based policy assignment where minion_id uses the CV1-convention. This may replace per-minion policy assignment or be used alongside it. 
##



## <JINJA>
## </JINJA>



# notes on Implementation Status
{#
## DESC
##  - example: |
##    ---
##    nodegroups:
##      group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com or bl*.domain.com'
##      group2: 'G@os:Debian and foo.domain.com'
##      group3: 'G@os:Debian and N@group1'
##      group4:
##        - 'G@foo:bar'
##        - 'or'
##        - 'G@foo:baz'
##    ...

## NB: This is a parser, not a validator.
##                          <-oi-------> <-role----> <-env---------><-iter->[<-desc---->][<-domain----->]
##                          <-1--------> <-2-------> <-3-----------><-4---->[<-5------->][<-6---------->]
## Reference regex: 'E@(?i)^([-a-z0-9]+)-([a-z0-9]+)-([a-z])([a-z]*)([0-9]+)([a-z][0-9]*)*\.?([.a-z0-9]*)$'

#}


#
salt:
  master:
    nodegroups:
      ## TARGETS ##

      # NB: This is a parser, not a validator.
      #                          <-oi-------> <-role----> <-env---------><-iter->[<-desc---->][<-domain----->]
      #                          <-1--------> <-2-------> <-3-----------><-4---->[<-5------->][<-6---------->]
      # Reference regex: 'E@(?i)^([-a-z0-9]+)-([a-z0-9]+)-([a-z])([a-z]*)([0-9]+)([a-z][0-9]*)*\.?([.a-z0-9]*)$'

      # Set DutyInfo (and other info) from cv1 minion name
      TARGETS__has_cv1_id: 'E@(?i)^([a-z0-9]+)-([a-z0-9]+)-([a-z])([a-z]*)([0-9]+)([a-z][0-9]*)*\.?([.a-z0-9]*)$'
      TARGETS__cv1set__ipso_key: 'N@TARGETS__has_cv1_id'
      TARGETS__cv1set__machine_role: 'N@TARGETS__has_cv1_id'
      TARGETS__cv1set__deployenv: 'N@TARGETS__has_cv1_id'
      TARGETS__cv1set__facility: 'N@TARGETS__has_cv1_id'




      # IPSO_KEY: LOGS
      TARGETS__cv1class__logs: 'logs-* and N@TARGETS__has_cv1_id'
      #
      TARGETS__cv1class__logs__dev: 'logs-*-d* and N@TARGETS__cv1class__logs'
      TARGETS__cv1class__logs__tst: 'logs-*-t* and N@TARGETS__cv1class__logs'
      TARGETS__cv1class__logs__prd: 'logs-*-p* and N@TARGETS__cv1class__logs'
      #
      TARGETS__cv1class__logs_es__dev: 'logs-es-* and N@TARGETS__cv1class__logs__dev'
      TARGETS__cv1class__logs_glus__dev: 'logs-glus-* and N@TARGETS__cv1class__logs__dev'
      TARGETS__cv1class__logs_routr__dev: 'logs-routr-* and N@TARGETS__cv1class__logs__dev'
      TARGETS__cv1class__logs_graylg__dev: 'logs-graylg-* and N@TARGETS__cv1class__logs__dev'
      #
      TARGETS__cv1class__logs_es__tst: 'logs-es-* and N@TARGETS__cv1class__logs__tst'
      TARGETS__cv1class__logs_glus__tst: 'logs-glus-* and N@TARGETS__cv1class__logs__tst'
      TARGETS__cv1class__logs_routr__tst: 'logs-routr-* and N@TARGETS__cv1class__logs__tst'
      TARGETS__cv1class__logs_graylg__tst: 'logs-graylg-* and N@TARGETS__cv1class__logs__tst'
      #
      TARGETS__cv1class__logs_es__prd: 'logs-es-* and N@TARGETS__cv1class__logs__prd'
      TARGETS__cv1class__logs_routr__prd: 'logs-routr-* and N@TARGETS__cv1class__logs__prd'
      TARGETS__cv1class__logs_graylg__prd: 'logs-graylg-* and N@TARGETS__cv1class__logs__prd'


      ## SECRETS ##

      #
      SECRETS__sdb_gema_devop__01a: 'L@salt-master-d1,salt-master-t1.agora.local'
      #
      SECRETS__cv1class__logs_es__prd: 'N@TARGETS__cv1class__logs_es__prd'



      ## CONFIGS ##

      #
      CONFIGS__provision_target_vagrant: 'G@provision_target:vagrant'
      #   - label.machine_class.provision_target.vagrant

      #
      CONFIGS__cv1class__salt_master__dev: 'salt-master-d*'
      #   - label.machine_role.salt-master

      #
      CONFIGS__cv1class__logs_es__dev: 'N@TARGETS__cv1class__logs_es__dev'
      CONFIGS__cv1class__logs_glus__dev: 'N@TARGETS__cv1class__logs_glus__dev'
      CONFIGS__cv1class__logs_routr__dev: 'N@TARGETS__cv1class__logs_routr__dev'
      CONFIGS__cv1class__logs_graylg__dev: 'N@TARGETS__cv1class__logs_graylg__dev'
      #
      CONFIGS__cv1class__logs_es__tst: 'N@TARGETS__cv1class__logs_es__tst'
      CONFIGS__cv1class__logs_glus__tst: 'N@TARGETS__cv1class__logs_glus__tst'
      CONFIGS__cv1class__logs_routr__tst: 'N@TARGETS__cv1class__logs_routr__tst'
      CONFIGS__cv1class__logs_graylg__tst: 'N@TARGETS__cv1class__logs_graylg__tst'
      #
      CONFIGS__cv1class__logs_es__prd: 'N@TARGETS__cv1class__logs_es__prd'
      CONFIGS__cv1class__logs_routr__prd: 'N@TARGETS__cv1class__logs_routr__prd'
      CONFIGS__cv1class__logs_graylg__prd: 'N@TARGETS__cv1class__logs_graylg__prd'



## EOF
