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
      - __: merge-first
      - nodegroups:
          pillar_name: "nodegroups"



## EOF
