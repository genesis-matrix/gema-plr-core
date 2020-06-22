##
##
##



##_META:
##  todo:
##    - merge and nest the key-group names rather than conflicting as duplicate keys
##



## <JINJA>
{#
# unused jinja storage
{% for secrets_nodegroup in __stack__['traverse'](stack, 'lookup:minion_nodegroup').items() if secrets_nodegroup.startswith('SECRETS__') %}
{% set secrets_nodegroup_lst = [] %}
{% set _discard = secrets_nodegroup_lst.append(secrets_nodegroup) %}
{% endfor %}
{% sdb_handle_lst = [for secret_nodegroup
sdb_handle in __stack__['traverse'](stack, 'lookup:minion_nodegroup').items() if sdb_

      - {%- for entry in __stack__['traverse'](stack, 'lookup:minion_nodegroup:SECRETS__sdb_gema_exmpl__00a:sdb_gema_exmpl__00a:entries') if entry.startswith("%s_%s"|format("sshkey", "prv")) %}
      {{ entry }}
      {% endfor %}

{% set secrets_dct = __stack__['traverse'](stack, 'lookup:minion_nodegroup:SECRETS__') %}
#}
## </JINJA>



#
salt:
  gitfs:
    keys:
      {% for secret in __stack__['traverse'](stack, 'lookup:minion_nodegroup:SECRETS__sdb_gema_exmpl__00a:sdb_gema_exmpl__00a:entries', []) if secret.startswith('sshkey_') %}
      {{ secret.split('_')[2:-1]|join('_') }}:
      {% if secret.split('_')[-1] in ['b64'] %}
        #
        {{ secret.split('_')[1] }}: !!binary >-
          {{ __stack__['traverse'](stack, 'lookup:minion_nodegroup:SECRETS__sdb_gema_exmpl__00a:sdb_gema_exmpl__00a:entries:' ~ secret) }}
      {% else %}
        #
        {{ secret.split('_')[1] }}: |
          {{ __stack__['traverse'](stack, 'lookup:minion_nodegroup:SECRETS__sdb_gema_exmpl__00a:sdb_gema_exmpl__00a:entries:' ~ secret) }}
      {% endif %}
      {% endfor %}



## EOF
