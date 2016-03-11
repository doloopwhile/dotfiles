#!/usr/bin/env python
from __future__ import print_function
import tempfile
from argparse import ArgumentParser
import fileinput
from subprocess import call
import pipes

description = 'Save inputs to temporary file and print name of the temporary file'
parser = ArgumentParser(description=description)
parser.add_argument('FILES', action='store', nargs='*')
parser.add_argument(
    '--suffix', action='store', default='',
    help='Suffix of name of temporary file')
parser.add_argument(
    '--prefix', action='store', default='tmp',
    help='Prefix of name of temporary file')
parser.add_argument(
    '--dir', '-d', action='store', default=tempfile.gettempdir(),
    help='Dir in which temporary created')
parser.add_argument(
    '--command', '-c', action='store', default=None,
    help='Dir in which temporary created')

opts = parser.parse_args()
kw = dict()
for k in 'suffix prefix dir'.split():
    kw[k] = getattr(opts, k)

with tempfile.NamedTemporaryFile('w', delete=False, **kw) as fp:
    fp.writelines(fileinput.input(opts.FILES))
    fp.flush()

print(fp.name)

if opts.command is not None:
    call(opts.command + " " + pipes.quote(fp.name), shell=True)
