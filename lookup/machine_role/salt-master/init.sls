##
##
##



# deploy genesis-paradigm salt-master
#  - Q: http://stackoverflow.com/questions/29081453/what-happens-if-orchestration-triggers-a-salt-master-service-restart
include:
  - state.machine.service.salt-minion
  - state.machine.service.salt-master
  #
  # - orch.refresh-salt-state-trees
  # - orch.refresh-salt-pillar-trees
  #
  #- formula.salt.pkgrepo
  #- formula.salt.gitfs.keys
  #- formula.salt.gitfs.pygit2
  #- formula.salt.minion
  - formula.salt.ssh
  - formula.salt.formulas
  - formula.salt.master
  #- formula.salt.api



