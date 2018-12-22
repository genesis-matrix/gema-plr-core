##
##
##



##_META:
##  - assumptions:
##    - the sqlite paths are accesible and writable
##



## <JINJA>
## </JINJA>



#
salt:
  master:
    sdb_gema_exmpl__00a:
      driver: sqlite3
      database: /vagrant/mnt/git/paradigm/media/sdb_gema_exmpl.sqlite3
      table: "18E57F0A-D011-482E-85D7-E872AA059294"
      create_table: True



## EOF
