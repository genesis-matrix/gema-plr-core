fluentd:
  overrides:
  ssl:
    cert_params:
      CN: fluentd.example.com
      bits: 4096
  plugins:
    - fluent-plugin-elasticsearch
    - fluent-plugin-postgres
    - fluent-plugin-hipchat
  plugin_dependencies:
    {% if __grains__['os_family'] == 'Debian' %}
    - libpq-dev
    {% elif __grains__['os_family'] == 'RedHat' %}
    - libpqxx-devel
    {% endif %}
  configs:
    - name: elasticsearch
      settings:
        - directive: source
          attrs:
            - '@type': syslog
            - port: 514
            - tag: syslog
        - directive: match
          directive_arg: 'syslog.*'
          attrs:
            - type: copy
            - nested_directives:
                - directive: store
                  attrs:
                    - type: stdout
                - directive: store
                  attrs:
                    - type: elasticsearch
                    - logstash_format: true
                    - flush_interval: 10s
                    - host: localhost
                    - port: 9200
