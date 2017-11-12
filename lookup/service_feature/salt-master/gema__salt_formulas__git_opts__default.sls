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
      basedir: /srv/formulas
      # Update the git repository to the latest version (False by default)
      update: False
      # Options passed directly to the git.latest state
      options:
        rev: master



## EOF
