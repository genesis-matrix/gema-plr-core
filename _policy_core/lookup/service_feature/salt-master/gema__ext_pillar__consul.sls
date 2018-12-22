##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
salt:
  master:
    ext_pillar:
      - consul: consul-00-demo-loopback root=salt/pillar/shared
      - consul: consul-00-demo-loopback root=salt/pillar/by_minion/%(minion_id)s



## EOF
