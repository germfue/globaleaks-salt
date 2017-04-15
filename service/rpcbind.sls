###########################################################################
# rpcbind -> not clear what is it used for; disabling RPC services
###########################################################################
rpcbind:
  service.dead:
    - enable: False
