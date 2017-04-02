# Many unnecessary services are started by default. These are the
# ones I disable for now
apache2:
  service.dead:
    - enable: False

postfix:
  service.dead:
    - enable: False

quota:
  service.dead:
    - enable: False

quotarpc:
  service.dead:
    - enable: False

xinetd:
  service.dead:
    - enable: False

rpcbind:
  service.dead:
    - enable: False
