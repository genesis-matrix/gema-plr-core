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
    '{{ id }}':
      # node data
      dutyinfo:
        project_key: atlas
      credset:
        default:
          username: demo_username
          password: demo_password
      # metadata
      _meta:
        secondary_labels: &secondary_labels
          machine_role:
            docker-host
        secondary_lookups: &secondary_lookups
          sls_path:
            - MISC.DEBUG.wip-jira
            - MISC.DEBUG.test-pillar-params:
                variable_injection: "thisvammunroo"
  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
