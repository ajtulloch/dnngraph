#! /usr/bin/env python

import Gen.caffe_pb2 as pb2
import google.protobuf.text_format as pb2_text
import sys


def binary_to_text(binary_file, text_file):
    msg = pb2.NetParameter()

    with open(binary_file) as f:
        msg.ParseFromString(f.read())

    with open(text_file, "w") as f:
        f.write(pb2_text.MessageToString(msg))

if __name__ == "__main__":
    binary_file = sys.argv[1]
    text_file = sys.argv[2]
    binary_to_text(binary_file, text_file)
