bootstrap:

  'os_family:Debian':
    - match: grain
    - debian_bootstrap
    - debian_services

  '*':
    - locale
    - uptodate

  'os:Ubuntu':
    - match: grain
    - ubuntu_saltdeps

