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
      - __: merge-last
      - gitstack:
          branch: master
          repo: https://github.com/genesis-matrix/gema-plr-core
          stack:
            - pillarstack.cfg
            - pillarstack.cfg
            - pillarstack.cfg
            - pillarstack.cfg



## EOF
