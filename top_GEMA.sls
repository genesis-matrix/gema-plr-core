##
##
##



##_META:
##  Usage:
##    - to manipulate individual minions, add labels and variables to the minion_id entry point
##    - to manipulate minion groups, add labels and variables to the minion_nodegroup entry point
##    - it should not be necessary to change this file to manipulate any label or variable on any minion
##    - this file is should only be altered when specifically seeking to test the Tops system
##



## <JINJA>
## </JINJA>



#
base:
  ## match all nodes
  '*':
    # GeMa Label Entrypoints
    - label.minion_nodegroup
    - label.minion_id



## EOF
