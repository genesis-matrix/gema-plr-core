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
      # infratest components
      - https://github.com/ssplatt/saltstack-infratest-module:
        - mountpoint: salt://_modules
        - base: master



## EOF
