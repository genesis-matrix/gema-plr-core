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
      - file_tree:
          root_dir: /srv/salt/pillar/base.personal/assets/static
          follow_dir_links: True
          keep_newline: True
      - file_tree:
          root_dir: /srv/salt/pillar/base.orgint/assets/static
          follow_dir_links: True
          keep_newline: True
      - file_tree:
          root_dir: /srv/salt/pillar/base.sitelocal/assets/static
          follow_dir_links: True
          keep_newline: True
      - file_tree:
          root_dir: /srv/salt/pillar/base.core/assets/static
          follow_dir_links: True
          keep_newline: True



## EOF
