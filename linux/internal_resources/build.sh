#!/bin/bash
set -x

mkdir -p $GOPATH/src/github.com/influxdata

if [ -d /src ]; then
    # copy the repository into the proper gopath
    cp -r /src $GOPATH/src/github.com/influxdata/telegraf

    # list the files in the repository
    ls $GOPATH/src/github.com/influxdata/telegraf

    # change to telegraf repository
    cd $GOPATH/src/github.com/influxdata/telegraf

    # make telegraf
    make clean
    make deps
    make lint
    make test
    make
fi

if [[ -f /output/Linux-x86_64.zip ]]; then
    rm /output/Linux-x86_64.zip
fi

# Copy out build artifacts if they exist
if [[ -d /output && -f $GOPATH/src/github.com/influxdata/telegraf/telegraf ]]; then
    mkdir -p /output
    cp $GOPATH/src/github.com/influxdata/telegraf/telegraf /output/telegraf
    cd /output
    zip Linux-x86_64.zip *
fi

echo "DONE"