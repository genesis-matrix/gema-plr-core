##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
"9E255E11-6B4B-4C0E-BDB4-A60D1DAAFDB7":
  file.managed:
    - contents: |
        sdb_gema_bootstrap:
          driver: sqlite3
          database: /var/run/salt/master/.sdb_gema.sqlite
          table: sdb_gema_bootstrap
          create_table: True



## EOF
