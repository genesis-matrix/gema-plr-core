##
##
##



##_META:
##



## <JINJA>
{% include './map.jinja' with context %}
## </JINJA>



# gitfs_remote
salt:
  master:
    gitfs_remotes:
      {% for gitfs_remote in gitfs_remotes_lst %}
      {% endfor %}



# ext_pillar:git
salt:
  master:
    pillar_roots:
      {% for pillar_root in ext_pillar__git_lst %}
      {% endfor %}



  #
  gitfs:
    keys:
      {% for sshkey in sshkeys %}
      {{ sshkey['sshkey_title'] }}:
        {{ sshkey['sshkey_title']['key_type']['suffix'] }}: |
          {{ sshkey['sshkey_title']['key_type']['contents'] | indent }}
      {% endfor %}



## EOF
