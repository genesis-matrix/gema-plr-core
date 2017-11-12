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
    {{ minion_id }}:
      # node data
      dutyinfo:
        project_key: vcs
      credset:
        default:
          username: demo_username
          password: demo_password
      # metadata
      _meta:
        secondary_labels: &secondary_labels
          machine_role:
            salt-master
          service_feature:
            salt-master:
              hubblestack.pulsar
        secondary_lookups: &secondary_lookups
          sls_path:
            - state.machine._spec.minset-configs
            #- MISC.VESTIBULE.wip-artifactory

  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
