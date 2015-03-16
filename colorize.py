#!/usr/bin/env python3 -u
import sys
from argparse import ArgumentParser
import re

Colors = dict(
    black='0',
    blue='4',
    green='2',
    cyan='6',
    red='1',
    purple='5',
    gray='7',
)


def main():
    parser = ArgumentParser()
    parser.add_argument('regex')
    parser.add_argument('-f', choices=list(Colors.keys()))
    parser.add_argument('-b', choices=list(Colors.keys()))
    parser.add_argument('--bold', action='store_true')
    parser.add_argument('--lighter', action='store_true')
    parser.add_argument('--underline', action='store_true')
    parser.add_argument('-i', '--ignore-case', action='store_true', dest='ignore_case')
    args = parser.parse_args()

    codes = []
    if args.lighter:
        codes.append('1')
    if args.f:
        codes.append('3' + Colors[args.f])
    if args.b:
        codes.append('4' + Colors[args.b])
    if args.bold:
        codes.append('01')
    if args.underline:
        codes.append('04')

    if args.ignore_case:
        opts = re.I
    else:
        opts = 0

    regex = re.compile(args.regex, opts)

    while True:
        line = sys.stdin.readline()
        if not line:
            break
        nl = line.endswith("\n")
        line = line.rstrip("\n")

        if regex.search(line):
            sys.stdout.write('\033[' + ';'.join(codes) + 'm')
            sys.stdout.write(line)
            sys.stdout.write('\033[0m')
        else:
            sys.stdout.write(line)
        if nl:
            sys.stdout.write("\n")

        sys.stdout.flush()

if __name__ == '__main__':
    main()
