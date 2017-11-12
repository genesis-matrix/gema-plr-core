##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
lookup:
  minion_id:
    splnk-syslog-d1:
      # node data
      dutyinfo:
        project_key: example
      credset:
        default:
          username: demo_username
          password: demo_password
      # metadata
      _meta:
        secondary_labels: &secondary_labels
          service_feature:
            salt-master:
              hubblestack.pulsar
        secondary_lookups: &secondary_lookups
          sls_path:
            - state.machine._spec.minset-configs: []
            - MISC.DEBUG.test-pillar-params:
                # per-sls data
                variable_injection: "thisvammunroo"
  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
