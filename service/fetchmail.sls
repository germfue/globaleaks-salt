###########################################################################
# Fetchmail is not needed for globaleaks; uninstalling it
###########################################################################
Remove fetchmail packages:
  pkg.removed:
    - pkgs:
      - fetchmail

