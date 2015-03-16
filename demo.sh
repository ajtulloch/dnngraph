#!/bin/bash

set -x 
set -e
for net in GoogLeNet AlexNet; do
    cabal exec -- \
          runhaskell NN/Examples/$net.hs visualize \
          --output $net.png \
          --format png
done
