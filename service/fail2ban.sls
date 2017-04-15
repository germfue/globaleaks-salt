###############################################################################
# We will monitor logs and temporarily ban IPs that fail to authenticate
# Website: https://www.fail2ban.org
# Manual: https://www.fail2ban.org/wiki/index.php/Manual
###############################################################################
Install fail2ban:
  pkg.installed:
    - pkgs:
      - fail2ban

###############################################################################
# Integrate fail2ban into logrotate
###############################################################################
Integrate fail2ban into logrotate:
  file.managed:
    - name: /etc/logrotate.d/fail2ban
    - source: salt://files/etc/logrotate.d/fail2ban
    - user: root
    - group: root
    - makedirs: False

###############################################################################
# setup fail2ban for SSHD
###############################################################################
Configure fail2ban for SSHD:
  file.managed:
    - name: /etc/fail2ban/jail.d/sshd.conf
    - source: salt://files/etc/fail2ban/jail.d/sshd.conf
    - user: root
    - group: root
    - makedirs: False

###############################################################################
# reload fail2ban rules if new configuration files are added
###############################################################################
Reload fail2ban:
  cmd.run:
    - name: fail2ban-client reload
    - onchanges:
      - file: /etc/fail2ban/jail.d/sshd.conf
