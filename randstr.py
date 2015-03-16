#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import random
import string
from argparse import ArgumentParser

description = 'Print random string'
parser = ArgumentParser(description=description)
parser.add_argument('length', action='store', type=int, nargs='?', default=16)
parser.add_argument('--count', action='store', type=int, default=1)

char_types = [
    ('octdigit', '0123456789'),
    ('hexdigit', '0123456789ABCDEF'),
]

parser.add_argument(
    '--char-classes', '-c', nargs='+',
    choices='lowers uppers digits symbols spaces octdigits hexdigits'.split(),
    default='lowers uppers digits'.split(),
)

opts = parser.parse_args()

charset = set()
for typename in opts.char_classes:
    charset.update(dict(
        lowers=string.ascii_lowercase,
        uppers=string.ascii_uppercase,
        digits=string.digits,
        symbols=string.punctuation,
        space=' ',
        octdigits=string.octdigits,
        hexdigits=string.hexdigits,
    )[typename])

charset = list(charset)
for _ in range(opts.count):
    print(''.join(random.choice(charset) for i in range(opts.length)))
