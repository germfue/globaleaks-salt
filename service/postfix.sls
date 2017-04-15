###########################################################################
# postfix is not needed for GlobaLeaks, uninstalling it
###########################################################################
Remove postfix packages:
  pkg.removed:
    - pkgs:
      - postfix
