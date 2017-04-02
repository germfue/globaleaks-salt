# According to https://docs.saltstack.com/en/latest/ref/states/all/salt.states.pkgrepo.html, these are the
# dependencies needed for Ubuntu to properly handle repositories
Install packages to manage Ubuntu repositories:
  pkg.installed:
    - pkgs:
      - python3-software-properties
      - python3-pycurl
      - python3-apt
