##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
salt_formulas:
  git_opts:
    # The Git options can be customized differently for each
    # environment, if an option is missing in a given environment, the
    # value from "default" is used instead.
    default:
      # URL where the formulas git repositories are downloaded from
      # it will be suffixed with <formula-name>.git
      baseurl: https://github.com/saltstack-formulas
      # Directory where Git repositories are downloaded
      #default# basedir: /srv/formulas
      basedir: /srv/formulas/base
      # Update the git repository to the latest version (False by default)
      #default# update: False
      update: True
      # Options passed directly to the git.latest state
      options:
        rev: master
    next:
      basedir: /srv/formulas/NEXT
      update: True
      options:
        rev: next
  # Options of the file.directory state that creates the directory where
  # the git repositories of the formulas are stored
  basedir_opts:
    makedirs: True
    user: root
    group: root
    mode: 755
  # List of formulas to enable in each environment
  list:
    base:
      - salt-formula
      - consul-formula
      - openssh-formula
      - docker-formula
      - salt-formula-kubernetes
    NEXT:
      - salt-formula
      - postfix-formula
      - openssh-formula



## EOF
