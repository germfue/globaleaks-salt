Install Tor repository:
  pkgrepo.managed:
    - humanname: Tor Repository for Ubuntu 16.04 (Xenial Xerus)
    - name: deb http://deb.torproject.org/torproject.org xenial main
    - keyserver: keys.gnupg.net
    - keyid: A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
  pkg.latest:
    - pkgs:
      - tor
      - deb.torproject.org-keyring
    - refresh: True
