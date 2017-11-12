##
##
##



##_META:
##  purpose:
##    - map the ext_pillar nodegroup info into the label:minion_nodegroups tree
##



## <JINJA>
{# copy the nodegroup/ext_pillar into gema labels #}
{% set nodegroups = pillar['nodegroups'] %}
## </JINJA>



#
{% if nodegroups is defined %}
label:
  minion_nodegroup:
    {% for nodegroup in nodegroups %}
    - {{ nodegroup }}
    {% endfor %}
{% else %}
label:
  minion_nodegroup: []
{% endif %}



## EOF
