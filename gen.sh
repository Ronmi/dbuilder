#!/bin/bash

for i in stable testing unstable experimental squeeze stretch sid
do
    rm -fr $i
    mkdir $i
    cat build | sed "s/DEBIAN_VERSION/$i/" > $i/build
    chmod a+x $i/build
    cat Dockerfile | sed "s/DEBIAN_VERSION/$i/" > $i/Dockerfile
done
