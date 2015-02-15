#! /usr/bin/env python

"""
This is an incredibly hacky way to add automatically generated
lenses to protocol buffers, but it works.
"""

import sys
import re

with open(sys.argv[1]) as f:
    lines = f.readlines()

def find_lens():
    for (i, line) in enumerate(lines):
        match = re.match(r"data ([A-Za-z]+) =", line)
        if match:
            ty = match.group(1)
            return (ty, i)
    return None

def find_deriving():
    for (i, line) in enumerate(lines):
        match = re.search(r"deriving", line)
        if match:
            return i
    return None

def find_export_line():
    for (i, line) in enumerate(lines):
        match = re.search(r"module .* where", line)
        if match:
            return i
    return None

try:
    (ty, data_line) = find_lens()
except:
    print "Couldn't find Data declaration, exiting"
    sys.exit(0)

deriving_line = find_deriving()
export_line = find_export_line()

def remove_braces_and_container(line):
    start = line.find("(")
    end = line.rfind(")")
    return line[:start] + line[end+1:]

lens = """
makeLensesWith (lensRules & lensField .~ \_ _ name -> [TopName (mkName Prelude'.$ "_" Prelude'.++ nameBase name)]) ''{}\n
"""

newlines = ["{-# LANGUAGE TemplateHaskell #-}\n"] \
    + lines[:export_line] \
    + [remove_braces_and_container(lines[export_line])] \
    + lines[export_line+1:data_line] \
    + ["import Language.Haskell.TH.Syntax\n"] \
    + ["import Control.Lens\n"] \
    + lines[data_line:deriving_line+1] \
    + [lens.format(ty)] \
    + lines[deriving_line+1:]

with open(sys.argv[1], "w") as f:
    f.write("".join(newlines))
