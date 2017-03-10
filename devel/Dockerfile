FROM ubuntu:latest

LABEL maintainer "development@fuentescapella.com"


# disable interactive debconf mode
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# update base system
RUN apt-get -y update

# install apt-utils to avoid further errors while package install
RUN apt-get -y install apt-utils

# install base dependencies
RUN apt-get -y install \
    aptitude \
    apt-transport-https \
    bash-completion \
    build-essential \
    curl \
    dialog \
    dnsutils \
    gcc \
    git-core \
    htop \
    iputils-ping \
    keychain \
    libffi-dev \
    libssl-dev \
    locales \
    locate \
    lsb-release \
    make \
    man \
    net-tools \
    python-dev \
    python-software-properties \
    python-virtualenv \
    software-properties-common \
    sudo \
    traceroute \
    vim \
    wget

# install nodejs dependencies
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# install latest version of Grunt
RUN npm install -g grunt-cli

# set timezone and locale
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN dpkg-reconfigure -f noninteractive tzdata
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure -f noninteractive locales
RUN /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# set the default shell
ENV SHELL /bin/bash

# create user
RUN useradd -m globaleaks

# add a volume for /home
VOLUME /home/globaleaks

# set user to start session with
USER globaleaks

# default command to run in the container
CMD /bin/bash -c 'cd $HOME; exec "${SHELL}"'
