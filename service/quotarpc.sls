###########################################################################
# Disabing quotarpc; no RPC calls should be enabled for any service
###########################################################################
quotarpc:
  service.dead:
    - enable: False
