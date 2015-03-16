#!/usr/bin/env python
from __future__ import print_function
import sys
import cgi
import fileinput
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('--html', action='store_const', const='html')
parser.add_argument('FILES', nargs='*')
opts = parser.parse_args()

if opts.html:
    f = cgi.escape
else:
    f = cgi.escape

for line in fileinput.input(opts.FILES):
    print(f(line), end='')

