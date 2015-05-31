#!/bin/bash

set -e

rm -r Gen/ || true
hprotoc --prefix Gen caffe.proto
hprotoc --prefix Gen purine.proto
(
    cd Gen
    for f in $(find . -iname "*.hs"); do 
        echo $f
        ../add_lenses.py $f || true
    done
)

protoc caffe.proto --python_out=Gen/
protoc purine.proto --python_out=Gen/
touch Gen/__init__.py
