##
##
##



##_META:
##  desc:
##    - macros dont return objects (such as dictrionaries), as work-around we'll serialize return data to json string
##    - the tojson filter automatically marks the expansion as safe
##  refs:
##    - https://stackoverflow.com/questions/21611988/return-a-dict-object-from-jinja2-macros
##



## <JINJA>
{%- set sdb_handle = 'sdb_gema_exmpl__00a' %}
  {%- set secrets_dct = {} %}
  {%- set cfg_dct = opts[sdb_handle] %}
  {%- if cfg_dct.driver == 'sqlite3'
      and salt['file.file_exists'](cfg_dct.database)
      and cfg_dct.table in salt['sqlite3.tables'](cfg_dct.database)|map('first')|list
      %}
  {% set keys = salt['sqlite3.fetch'](cfg_dct.database, "select key from '" + cfg_dct.table + "';") %}
{#
    {%- for key in salt['sqlite3.fetch'](cfg_dct.database, "select key from '" + cfg_dct.table + "';") %}
      {%- set value = salt['sdb.get']("sdb://" + sdb_handle + "/" + key) %}
      {%- set _discard = secrets_dct.__setitem__(key, value) %}
    {%- endfor %}
#}
  {%- endif %}
## </JINJA>



#

sdb_hackery:
  keys: {{ keys|map('first')|list|tojson }}

{#
  keys_dtype: {% if keys is mapping %}mapping{% elif keys is string %}string{% keys is sequence %}sequence{% elif keys is number %}number{% endif %}
#}


## EOF
