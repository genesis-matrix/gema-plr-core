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
    gitfs_remotes:
      - https://github.com/amendlik/gitstack-pillar:
        - base: master
        - root: _pillars
        - mountpoint: salt://_pillar



## EOF
