# Without these packages, several commands fail when executed:
# - localectl
# - systemctl start systemd-localed.service
# There are 2 issues:
# - localectl depends on dbus
# - localectl, and systemd-localed depend on keyboard configuration:
#   - keyboard-configuration
#   - kbd
#   - console-data
Install basic packages for Debian/Ubuntu to work:
  pkg.installed:
    - pkgs:
      - dbus
      - keyboard-configuration
      - kbd
      - console-data

