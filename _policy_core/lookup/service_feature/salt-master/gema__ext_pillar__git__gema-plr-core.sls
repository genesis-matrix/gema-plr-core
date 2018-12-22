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
      - git:
        - master https://github.com/genesis-matrix/gema-plr-core:
          - env: base



## EOF
