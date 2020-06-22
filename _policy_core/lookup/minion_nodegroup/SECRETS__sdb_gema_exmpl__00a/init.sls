##
##
##



##_META:
##  desc:
##    - per gema-paradigm, there shouldnt be more than one handle per SECRETS nodegroup
##    - nevertheless, by adding the handle name under the nodegroup name:
##      - we afford the designer non-perilous breaks from convention and,
##      - we state the relationship between the nodegroup name and the sdb handle more clear and explicit
##  todo:
##    - [_] for {%raw%} "SECRETS__{{ meta.name.handle }}:" {%endraw%} w/ something based on path, (like the tpldir variable)
##      - nb, this should use the template dirname to contextually operate correctly
##



## <JINJA>
{#- the 'meta' variable is useful for communicating to other humans about the secrets store #}
{%- set meta = {
   "name": {
      "handle": "sdb_gema_exmpl__00a",
      "human": "Salt-Master Trust Bootstrap w/ SDB/SQLite3 (gema-ctl demo)"
      },
    "doc": "A SQLite-backed local file SDB handle provided as an example of the GeMa paradigm for bootstrapping secrets.",
    "tags": ["uses sdb/sqlite3", "provides initial secrets for salt-master", "purpose gema paradigm demo", "purpose gema workstation usage demo"]
   }
%}
{%- set assoc_labels = [
  "label.machine_role.salt-master.secrets__" ~ meta.name.handle
  ]
%}
{%- set _discard = meta.update({"assoc_labels": assoc_labels}) %}
{#-#}
{% from "assets/jinja/macro_gema" import gema_lookup_sdb %}
{% set secrets_dct = gema_lookup_sdb(meta.name.handle) %}
## </JINJA>



#
lookup:
  minion_nodegroup:
    SECRETS__{{ meta.name.handle }}:
      {{ meta.name.handle }}:
        _meta: {{ meta }}
        entries: {{ secrets_dct }}



## EOF
