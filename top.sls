base:

  '*':
    - os.uptodate
    - os.minimal_dependencies

  'globaleaks':
    - tor.repository
    - globaleaks.apparmor_fix_tor_permissions
    - globaleaks.install
