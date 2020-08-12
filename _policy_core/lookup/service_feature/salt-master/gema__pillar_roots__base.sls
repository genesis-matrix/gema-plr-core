##
##
##



##_META:
##



## <JINJA>
## <JINJA>



#
salt:
  master:
    pillar_roots:
      base:
        - /srv/salt/pillar/base.personal
        - /srv/salt/pillar/base.orgint
        - /srv/salt/pillar/base.sitelocal
        - /srv/salt/pillar/base.core



## EOF
