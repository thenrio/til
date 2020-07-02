#!/usr/bin/env python3
import os
from distutils.util import strtobool

def truth(value):
    print("{} -> {}".format(value, bool(value)))
    return value


a = truth(os.getenv("test"))
b = truth(strtobool(os.getenv("test", "false")))

print(a and "a is a witch" or "a is not a witch")
print(None if a else "a is not a witch")
print(b and "b is a witch" or "b is not a witch")
print(None if b else "b is not a witch")
