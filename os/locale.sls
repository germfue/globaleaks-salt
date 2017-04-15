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
Install basic packages to configure locale in Debian/Ubuntu:
  pkg.installed:
    - pkgs:
      - dbus
      - keyboard-configuration
      - kbd
      - console-data

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
