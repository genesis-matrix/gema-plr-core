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
          root_dir: /srv/salt/pillar/base/assets/static
          follow_dir_links: False
          keep_newline: True



## EOF
