#!/usr/bin/python3
from operator import methodcaller
import argparse

parser = argparse.ArgumentParser(description='A tutorial of argparse!')
parser.add_argument("--f", default=None, help="enter file path")

args = parser.parse_args()
f = args.f
doc = open(f,"r")

# print(doc.read())

lines = map(methodcaller("split", " "), doc.read())

print(list(lines))

