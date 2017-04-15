base:
  '*':
    # basic setup
    - os.locale
    - service.apache2
    - service.postfix
    - service.quota
    - service.quotarpc
    - service.rpcbind
    - service.xinetd
    # update the system
    - os.update
    # let's install Python3 dependencies for salt
    - app.python
    - app.curl
    # install Tor
    - service.tor
    - service.apparmor
    - service.globaleaks
