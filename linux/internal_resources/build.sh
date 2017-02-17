#!/bin/bash

mkdir -p $GOPATH/src/github.com/influxdata

if [ -d /src ]; then
    # copy the repository into the proper gopath
    cp -r /src $GOPATH/src/github.com/influxdata/telegraf

    # list the files in the repository
    ls $GOPATH/src/github.com/influxdata/telegraf

    # change to telegraf repository
    cd $GOPATH/src/github.com/influxdata/telegraf

    # make telegraf
    make
fi

# Copy out build artifacts if they exist
if [[ -d /output && -f $GOPATH/bin/telegraf ]]; then
    cp $GOPATH/bin/telegraf /output/telegraf
    cd /output
    zip Linux-x86_64 telegraf
fi

echo "DONE"