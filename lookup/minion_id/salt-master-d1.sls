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
      minion_beacon:
        diskusage:
          '/': '90%'
          '/var': '85%'
      # metadata
      _meta:
        secondary_labels: &secondary_labels
          minion_beacon:
            ? diskusage
          machine_role:
            ? salt-master
          service_preset:
            salt-master:
              ? gema__v01
          machine_requirement:
            any:
              ? example-etc-httpd-dir-exists
              ? example-etc-passwd
              ? example-infratest-demo
        secondary_lookups: &secondary_lookups
          sls_path:
            - state.machine._.minset-configs: []
  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
