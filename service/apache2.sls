###########################################################################
# Apache2 is not needed for globaleaks; uninstalling it
###########################################################################
Remove apache2 packages:
  pkg.removed:
    - pkgs:
      - apache2
      - apache2-bin
      - apache2-data
      - apache2-doc
      - apache2-utils
