##
##
##



##_META
##



## <JINJA>
## </JINJA>



# create ssl certs
lookup:
  sls_path:
    - state._.pillar-splat:
        stanza_dct:
          "f30e533e-2e4c-4ff0-a79c-fa07b3de654c":
            pkg.installed:
              - pkgs:
                - salt-api





# enable salt-api (tornado) via the salt-formula
salt:
  master:
    rest_tornado:
      # can be any port
      port: 8000
      # address to bind to (defaults to 0.0.0.0)
      address: 0.0.0.0
      # socket backlog
      backlog: 128
      ssl_crt: /etc/pki/api/certs/server.crt
      # no need to specify ssl_key if cert and key
      # are in one single file
      ssl_key: /etc/pki/api/certs/server.key
      debug: False
      disable_ssl: False
      webhook_disable_auth: False
      cors_origin: null



## EOF
