base:

  '*':
    - os.uptodate
    - os.bootstrap

  'globaleaks':
    - tor.repository
    - globaleaks.apparmor_fix_tor_permissions
    - globaleaks.install
