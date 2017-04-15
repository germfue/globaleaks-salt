###########################################################################
# Install PGP Key to trusted keys
###########################################################################
{% if grains['os_family'] == 'Debian' %}

Add GlobaLeaks' PGP Key to APT keys:
  cmd.run:
    - name: curl https://deb.globaleaks.org/globaleaks.asc | apt-key add -

Install GlobaLeaks repository:
  pkgrepo.managed:
    - humanname: GlobaLeaks repository
    - name: deb http://deb.globaleaks.org xenial/

Install GlobaLeaks service:
  pkg.installed:
    - pkgs:
      - globaleaks

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
    - onfail:
      - pkg: Install GlobaLeaks service

Re-Install GlobaLeaks service:
  pkg.installed:
    - pkgs:
      - globaleaks
    - onfail:
      - pkg: Install GlobaLeaks service

{% endif %}
{% endif %}
