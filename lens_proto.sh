#!/bin/bash

set -e

rm -r Gen/ || true
hprotoc --prefix Gen --lenses caffe.proto

protoc caffe.proto --python_out=Gen/
touch Gen/__init__.py
