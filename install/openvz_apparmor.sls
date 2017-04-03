# AppArmor in OpenVZ is not functioning and it needs to be disabled in order to get a working GlobaLeaks
Disable AppArmor configuration for Globaleaks:
  file.managed:
    - name: /etc/default/globaleaks
    - source: salt://files/etc/default/globaleaks
    - user: root
    - group: root
    - makedirs: False
