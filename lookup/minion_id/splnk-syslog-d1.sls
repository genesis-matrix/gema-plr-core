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
      dutyinfo: []
      credset: []
      # metadata
      _meta:
        secondary_labels: &secondary_labels
          service_feature:
            salt-master:
              hubblestack.pulsar
        secondary_lookups: &secondary_lookups
          sls_path:
            - state.machine._.minset-configs: []

  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
