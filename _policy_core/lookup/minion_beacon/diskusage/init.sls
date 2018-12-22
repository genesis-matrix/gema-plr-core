##
##
##



##_META:
##



## <JINJA>
{%- set defaults = {} %}
{%- set lookup_key = 'lookup:minion_id:' ~ minion_id ~ ':minion_beacon:diskusage' %}
{%- set diskusage_match_dct = __stack__['traverse'](stack, lookup_key, defaults['diskusage_match_dct']) %}
## </JINJA>



# note
{#-
 - The Salt Minion service needs to be restarted to receive beacon config updates from the pillar
 - This is fixed in https://github.com/saltstack/salt/pull/40892, which is merged but not yet included in a public release as of 20170511
#}



# 
{%- if diskusage_match_dct is mapping and diskusage_match_dct|length() >= 1 %}
beacons:
  diskusage:
    {% for k, v in diskusage_match_dct.items() %}
    {# {% if file.directory_exists(k) %} #}
    - "{{ k }}": "{{ v }}"
    {# {% endif %} #}
    {% endfor %}
{%- endif %}



## EOF
