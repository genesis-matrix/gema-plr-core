##
##
##



##_META:
##  purpose:
##    - enable use of AD as an IdP (via eauth system)
##  prereqs:
##    - LDAP usage requires that you have installed python-ldap
##



## <JINJA>
{%- set ldap_query = {
  bind_account: {
    distinguishedname: "uid=ldap_saltstack,cn=users,cn=accounts,dc=saltstack,dc=com",
    password: "svp3r$ekrit"
    }
  }
%}
    

## </JINJA>



# 
salt:
  master:
    auth.ldap.activedirectory: True
    # filter to use for Active Directory LDAP
    auth.ldap.accountattributename: sAMAccountName
    auth.ldap.filter: {% raw %}'sAMAccountName={{username}}'{% endraw %}

    # Only for Active Directory. Default value: 'person'
    auth.ldap.persontype: person
    auth.ldap.groupclass: group

    # Server to auth against. Default value: 'localhost'
    #auth.ldap.server: ""

    # Port to connect via. Default value: '389'
    #auth.ldap.port: ""

    # Use TLS when connecting. Default value: False
    #auth.ldap.tls: ""

    # Server specified in URI format. Overrides .ldap.server, .ldap.port,
    # .ldap.tls. Default value: ''
    #auth.ldap.uri: ""
    auth.ldap.basedn: dc=saltstack,dc=com
    auth.ldap.binddn: {{ ldap_query.bind_account.distinguishedname }}
    auth.ldap.bindpw: {{ ldap_query.bind_account.password }}
    auth.ldap.minion_stripdomains: []


## EOF
