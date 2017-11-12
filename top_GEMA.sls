##
##
##



# NOTES: on representing logic branches
#  - should be plainly visible in the right place
#  - should be abstracted everywhere else
#  - a top file is the right place
base:
  ## match all nodes
  '*':
    # testing/example
    #- lookup.minion_id.example-minion

    # GeMa Label Entrypoints
    - label.minion_nodegroup
    - label.minion_id



## EOF
