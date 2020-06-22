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
        ipso_key: exmpl
        machine_role: web
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
            ? web
          machine_requirement:
            any:
              ? example-etc-httpd-dir-exists
              ? example-etc-passwd
              ? example-infratest-demo
        secondary_lookups: &secondary_lookups
          sls_path:
            - state.machine._spec.minset-configs: []
            - state.machine.software.pkgrepo.webmin: []
            - state.machine.software.webmin: []
            - state.machine.software.webmin.mod-add-virtualmin: []
            - state.machine.software.pkgrepo.remi.repo-add-remi: []
            - state.machine.software.pkgrepo.remi.repo-enable: []
            - state.machine.software.pkgrepo.remi.mod-enable-php70: []
            #- state.machine.software.php: []

  # extended lookups
  <<: *secondary_lookups



# extended labels
label:
  <<: *secondary_labels



## EOF
