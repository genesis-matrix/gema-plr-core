##
##
##



##_META:
##



## <JINJA>
## </JINJA>



#
# salt:
#   # salt cloud config
#   cloud:
#     master: salt
#     #  For non-templated custom cloud provider/profile/map files
#      providers:
#        provider-filename1.conf:
#          vmware-prod:
#            driver: vmware
#            user: myusernameprod
#            password: mypassword
#          vmware-nonprod:
#            driver: vmware
#            user: myusernamenonprod
#            password: mypassword
#      profiles:
#        profile-filename1.conf:
#          server-non-prod:
#            clonefrom: rhel6xtemplatenp
#            grains:
#              platform:
#                name: salt
#                realm: lab
#              subscription_level: standard
#            memory: 8GB
#            num_cpus: 4
#            password: sUpErsecretey
#            provider: vmware-nonprod
#      maps:
#        map-filename1.map:
#          server-non-prod:
#            - host.mycompany.com:
#                grains: 
#                  environment: dev1



#     # You can take profile and map templates from an alternate location
#     # if you want to write your own.
#     template_sources:
#       providers: salt://salt/files/cloud.providers.d
#       profiles: salt://salt/files/cloud.profiles.d
#       maps: salt://salt/files/cloud.maps.d



#     # These settings are used by the default provider templates and
#     # only need to be set for the ones you're using.
#     aws_key: AWSKEYIJSHJAIJS6JSH
#     aws_secret: AWSSECRETYkkDY1iQf9zRtl9+pW+Nm+aZY95
#     gce_project: test
#     gce_service_account_email_address: 867543072364-orl4h2tpp8jcn1tr9ipj@developer.gserviceaccount.com
#     rsos_user: afeawofghob
#     rsos_tenant: tenant_id_number
#     rsos_apikey: WFJIOJEOIGHSOFHESO
#     rsos_regions:
#       - ORD
#       - DFW
#       - IAD
#       - SYD
#       - HKG



## EOF
