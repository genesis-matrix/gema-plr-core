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
    "{{ minion_id }}":
      # node data
      dutyinfo:
        project_key: salt
        machine_role: master
        deployenv: dev
      credset:
        default:
          username: demo_username
          password: demo_password
      # metadata
      _meta:
        secondary_labels: &secondary_labels
          minion_beacon:
            ? diskusage
          machine_role:
            ? salt-master
          service_feature:
            salt-master:
              ? gema
        secondary_lookups: &secondary_lookups
          sls_path:
            - state._.pillar-splat:
                "A27BEC14-1075-4830-9631-E973BF5E922E":
                  "test.nop":
                    - name: this is a demo of a fully pillar-defined state file
            - state.machine._spec.minset-configs: []
            
  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
