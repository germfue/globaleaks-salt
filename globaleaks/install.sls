Download script from GlobaLeaks:
  cmd.run:
    - name: wget https://deb.globaleaks.org/install-globaleaks.sh -O /tmp/install-globaleaks.sh

Install globaleaks:
  cmd.run:
    - name: bash /tmp/install-globaleaks.sh

Remove installer:
  file.absent:
    - name: /tmp/install-globaleaks.sh
