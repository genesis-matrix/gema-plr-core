fluent_bit:
  config:
    flush: 5
    http_monitor: on
    http_port: 2020
    inputs:
      - Name: cpu
        Tag: my_cpu
      - Name: tail
        Tag: syslog
        Path: /var/log/syslog
        Path_Key: filename
        DB: /var/run/fluentbit/syslog
    filters:
      - Name: grep
        Match: syslog
        Regex: Error
    outputs:
      - Name: forward
        Match: syslog
        Host: fluentd.example.com
        Port: 12345
      - Name: influxdb
        Match: my_cpu
        Host: influx.example.com
