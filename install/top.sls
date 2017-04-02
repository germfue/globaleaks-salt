install:

  '*':
    - uptodate

  'os:Ubuntu':
    - match: grain
    - tor_repository
    - gl_fix_tor_permissions
    - gl_install
