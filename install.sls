###########################################################################
# Update system before performing any further setup
###########################################################################
Update system before installing GlobaLeaks:
  pkg.uptodate:
    - refresh: True

###########################################################################
# AppArmor in OpenVZ is not functioning and it needs to be disabled in
# order to get a working GlobaLeaks
###########################################################################
{% if grains['virtual'] == 'openvzve' %}
Disable AppArmor configuration for Globaleaks:
  file.managed:
    - name: /etc/default/globaleaks
    - source: salt://files/etc/default/globaleaks
    - user: root
    - group: root
    - makedirs: False
{% endif %}

{% if grains['os'] == 'Ubuntu' %}
###########################################################################
# Install Tor repository for Ubuntu
###########################################################################
Install Tor repository:
  pkgrepo.managed:
    - humanname: Tor Repository for Ubuntu 16.04 (Xenial Xerus)
    - name: deb http://deb.torproject.org/torproject.org xenial main
    - keyserver: keys.gnupg.net
    - keyid: A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
  pkg.latest:
    - pkgs:
      - tor
      - deb.torproject.org-keyring
    - refresh: True

###########################################################################
# There is a bug in the GlobaLeaks installer, that sets the wrong
# permissions in apparmor for the Tor server
###########################################################################
Include local system_tor apparmor profile:
  file.managed:
    - name: /etc/apparmor.d/system_tor
    - source: salt://files/etc/apparmor.d/system_tor
    - user: root
    - group: root
    - makedirs: False

Correct Tor permissions in apparmor:
  file.managed:
    - name: /etc/apparmor.d/local/system_tor
    - source: salt://files/etc/apparmor.d/local/system_tor
    - user: root
    - group: root
    - makedirs: False

apparmor:
  service.running:
    - watch:
      - file: /etc/apparmor.d/local/system_tor

tor:
  service.running:
    - watch:
      - file: /etc/apparmor.d/local/system_tor
    - require:
      - apparmor

###########################################################################
# Download and install GlobaLeaks application
###########################################################################
Download script from GlobaLeaks:
  cmd.run:
    - name: wget https://deb.globaleaks.org/install-globaleaks.sh -O /tmp/install-globaleaks.sh

Install globaleaks:
  cmd.run:
    - name: bash /tmp/install-globaleaks.sh

Remove installer:
  file.absent:
    - name: /tmp/install-globaleaks.sh
{% endif %}
