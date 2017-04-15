##
# if mode: 0700|0600 is set, these states fail. I could not find the reason
# and changed to add a chmod command
##

###########################################################################
# Upload authorized keys
###########################################################################
Upload authorized keys:
  file.managed:
    - name: /root/.ssh/authorized_keys
    - source: salt://files/root/.ssh/authorized_keys
    - user: root
    - group: root
    - makedirs: True
  cmd.run:
    - name: chmod 0600 /root/.ssh/authorized_keys

###########################################################################
# Restrict permission in /root/.ssh
###########################################################################
Restrict permissions in ssh folder:
  cmd.run:
    - name: chmod 0700 /root/.ssh
