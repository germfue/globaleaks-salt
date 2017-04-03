{% if grains['os_family'] == 'Debian' %}
###########################################################################
# Without these packages, several commands fail when executed:
# - localectl
# - systemctl start systemd-localed.service
# There are 2 issues:
# - localectl depends on dbus
# - localectl, and systemd-localed depend on keyboard configuration:
#   - keyboard-configuration
#   - kbd
#   - console-data
###########################################################################
Install basic packages for Debian/Ubuntu to work:
  pkg.installed:
    - pkgs:
      - dbus
      - keyboard-configuration
      - kbd
      - console-data

###########################################################################
# Many unnecessary services are started by default. These are the
# ones I disable for now
###########################################################################
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
{% endif %}

###########################################################################
# Setting locales
###########################################################################
us_locale:
  locale.present:
    - name: en_US.UTF-8

default_locale:
  locale.system:
    - name: en_US.UTF-8
    - require:
      - locale: us_locale

###########################################################################
# Update system
###########################################################################
Keep system up to date:
  pkg.uptodate:
    - refresh: True

###########################################################################
# According to https://docs.saltstack.com/en/latest/ref/states/all/salt.states.pkgrepo.html, these are the
# dependencies needed for Ubuntu to properly handle repositories
###########################################################################
Install packages to manage Ubuntu repositories:
  pkg.installed:
    - pkgs:
      - python3-software-properties
      - python3-pycurl
      - python3-apt
