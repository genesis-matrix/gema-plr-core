##
##
##



##_META:
##  advisement:
##    - potentially surprising implementation, please review all notes before making changes
##  purpose:
##    - add 'label:minion_nodegroup' to the pillar only if 'label:minion_nodegroup' is non-existent
##  todo:
##    - [ ] cleanup documentation, include references to concept glossary
##



## <JINJA>
## </JINJA>



# note
{#-
- while the 'in-memory' pillar data structure in the 'label' namespace will be be processed multiple times, this file will not, so doesnt require idempotency
- this implementation is imperfectly idiomatic in order to work-around a limitation in ext_pillar evaluation ordering
- the work-around causes minion_nodegroup to be evaluated after minion_id, but evalution order of minion_nodegroup, minion_id is the desired behavior
- a feature request to remove need for this work-around: https://github.com/saltstack/salt/issues/41371
- this file adds 'label:minion_nodegroup' in order to invoke the default handler for the corresponding 'lookup:minion_nodegroup' namespace
- it would be more favorable and clear to include data from the nodegroups pillar in this file, but that data isnt yet available
- normally this wouldnt be needed but because the limitation in ext_pillar ordering mentioned before
- the 'lookup:minion_nodegroup' invocation is needed to populate the list as 'label:minion_nodegroup' with nodegroups for subsequent processing
- the handler for 'lookup:minion_nodegroup' is evaluated later in the merge:
  - so will have access to nodegroup info provided by the nodegroup pillar
  - will copy the list of memeber nodegroups from 'nodegroups' to 'label:minion_nodegroup'
  - this additional step allows adherency with two design promises:
    - pillarstack will (only) examine the 'label' namespace for instruction
    - ...???...
#}



#
label:
  minion_nodegroup: {}



## EOF
