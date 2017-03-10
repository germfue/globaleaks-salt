#!/bin/bash

home_dir=$HOME/.docker/globaleaks
if [ ! -d $vps_dir ]
then
    mkdir -p $HOME/.docker/globaleaks
fi

docker run -it globaleaks-devel
