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
      - https://github.com/salt-formulas/salt-formula-kubernetes:
        - mountpoint: salt://formula/kubernetes
        - root: kubernetes
        - base: master



## EOF
