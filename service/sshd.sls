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
    - source: salt://root/.ssh/authorized_keys
    - user: root
    - group: root
    - makedirs: True

Restrict permissions for authorized keys:
  cmd.run:
    - name: chmod 0600 /root/.ssh/authorized_keys
    - require:
      - Upload authorized keys

###########################################################################
# Restrict permission in /root/.ssh
###########################################################################
Restrict permissions in ssh folder:
  cmd.run:
    - name: chmod 0700 /root/.ssh
    - require:
      - Upload authorized keys

###########################################################################
# Sync sshd_config
###########################################################################
Sync /etc/ssh/sshd_config:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://files/etc/ssh/sshd_config
    - user: root
    - group: root
    - makedirs: True
    - require:
      - Upload authorized keys
  service.running:
    - name: ssh
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config
