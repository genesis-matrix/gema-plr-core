##
##
##



##_META:
##  purpose:
##    - map the ext_pillar nodegroup info into the label:minion_nodegroups tree
##  todo:
##    - this pillar doesnt work, seems like 'nodegroups' isnt available until after this pillar sls is rendered
##    - maybe it should be added as a header stub to the lookup
##



## <JINJA>
## </JINJA>



# just add the named nodegroup dict w/o any subkeys
#  (theyre filled in later during initial lookup)
label:
  minion_nodegroup: []



## EOF
