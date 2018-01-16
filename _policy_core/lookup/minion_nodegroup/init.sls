##
##
##



##_META:
##



## <JINJA>
{#- copy the nodegroup/ext_pillar into gema labels #}
{%- set pillar_nodegroup_lst = __stack__['traverse'](pillar, 'nodegroups', []) %}
{%- set stack_nodegroup_lst = __stack__['traverse'](stack, 'label:minion_nodegroup', []) %}
## </JINJA>



#
{%- if pillar_nodegroup_lst|length() >= 1 %}
label:
  minion_nodegroup:
    {%- for nodegroup in pillar_nodegroup_lst %}
    ? {{ nodegroup }}
    {%- endfor %}
{%- endif %}



## EOF
