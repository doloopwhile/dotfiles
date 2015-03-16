#!/usr/bin/python
import sys
from email.Header import Header
try:
    charset = sys.argv[2]
except IndexError:
    charset = 'utf-8'
s = sys.argv[1]
print Header(s, charset)
