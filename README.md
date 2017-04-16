# ![Logo](/images/logo.png) Salty Leak
SaLt State files for installing [Globaleaks](https://www.globaleaks.org/)

# Setup

Downloading the scripts is pretty simple:

    $ git clone https://github.com/germfue/saltyleak.git

Just follow these steps if you want to use SaltStack in your virtualenv:

    $ cd saltyleak
    $ virtualenv-3 venv
    $ source venv/bin/activate
    $ pip install -r requirements.txt

Enjoy!

# The file_roots
For saltyleak to work; it is necessary to add the project to the file_roots variable, in the master configuration file.

If you want saltyleak to manage the SSHD service, the file `/root/.ssh/autorized_keys` will need to be found in the
file_roots path and contain the appropriate public keys.

# Execute the SaLt State files

If you are using a system installed Salt:

    $ sudo salt-ssh server state.apply

On the other hand, if you installed Salt in your virtualenv:

    $ salt-ssh --config-dir=/path/to/etc/salt server state.apply
