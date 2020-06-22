##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
label:
  service_feature:
    salt-master:
      ## sdb
      ? gema__sdb_sqlite__sdb_gema_exmpl__00a
      ## nodegroups
      ? gema__nodegroups__exmpl
      ## roots
      ? gema__fileserver_backend
      ? gema__file_roots__base
      #? gema__file_roots__vestibule
      ? gema__gitfs_opts__env_whitelist__base
      ? gema__gitfs_remotes__gema-sls-core
      #? gema__gitfs_remotes__gema-sls-contrib-vestibule
      ? gema__gitfs_remotes__salt_formula
      ? gema__gitfs_remotes__kubernetes_formula
      ? gema__gitfs_remotes__infratest-module
      ? gema__gitfs_remotes__hubblestack
      ? gema__gitfs_remotes__hubblestack_data
      ? gema__gitfs_remotes__pillarstack
      ? gema__gitfs_remotes__gitstack
      ## formulas
      ? gema__salt_formulas__git_opts__default
      ? gema__salt_formulas__list__base__rsyslog
      ## pillar
      ? gema__ext_pillar__config__ext_pillar_first
      ? gema__pillar_roots
      ? gema__ext_pillar__nodegroups
      ? gema__ext_pillar__file_tree
      ? gema__ext_pillar__git__gema-plr-core
      ? gema__ext_pillar__pillarstack
      #? gema__ext_pillar__consul
      ? gema__gitfs_keys__sdb_gema_exmpl__00a
      ## recursive meta-processing
      ? gema__ext_pillar__gitstack-pillar__gema-plr-core
      ? gema__highstate_append__sync-all-modules
    ## append states to the minions highstate
    salt-minion:
      ? gema__highstate_append__sync-all-modules
      ? gema__highstate_append__salt_DOT_master
      ? gema__highstate_append__salt_DOT_formulas



## EOF
