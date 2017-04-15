###############################################################################
# Universe repository is needed for pip
###############################################################################
Install Ubuntu Universe repository:
  pkgrepo.managed:
    - humanname: Ubuntu Universe 16.04 repository (Xenial Xerus)
    - name: deb http://archive.ubuntu.com/ubuntu xenial main restricted universe

###############################################################################
# According to
# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.pkgrepo.html,
# these are the dependencies needed for Ubuntu to properly handle
# repositories
###############################################################################
Install Python3 dependencies to manage Ubuntu repositories:
  pkg.installed:
    - pkgs:
      - software-properties-common
      - python3-software-properties
      - python3-pycurl
      - python3-apt
