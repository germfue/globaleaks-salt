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

# Execute the SaLt State files

If you are using a system installed Salt:

    $ sudo salt-ssh server state.apply <script_name>

On the other hand, if you installed Salt in your virtualenv:

    $ salt-ssh --config-dir=/path/to/etc/salt server state.apply <script_name>

# All in one go

If you have a server with a default Ubuntu 16.04 and want to get it ready for installing GlobaLeaks, please run:

    $ salt-ssh --config-dir=/path/to/etc/salt server state.apply bootstrap

The installation can be executed like this:

    $ salt-ssh --config-dir=/path/to/etc/salt server state.apply install

*Careful*: you will need to have saltyleak as part of your file_roots

To maintain an existing installation:

    $ salt-ssh --config-dir=/path/to/etc/salt server state.apply maintain
