base:
  '*':
    # basic setup
    - os.locale
    - service.apache2
    - service.fetchmail
    - service.postfix
    - service.quota
    - service.quotarpc
    - service.rpcbind
    - service.xinetd
    - service.fail2ban
    # update the system
    - os.update
    # let's install Python3 dependencies for salt
    - app.python
    - app.curl
    # install Tor
    - service.tor
    - service.apparmor
    - service.globaleaks
