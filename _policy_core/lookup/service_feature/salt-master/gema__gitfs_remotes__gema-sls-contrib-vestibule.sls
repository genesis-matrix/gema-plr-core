##
##
##



##_META:
##



## <JINJA>
## </JINAJ>



#
salt:
  master:
    gitfs_remotes:
      #- _: first
      - https://github.com/genesis-matrix/gema-sls-contrib-vestibule:
        - base: _EXPERIMENT
        - mountpoint: salt://MISC/VESTIBULE



## EOF
