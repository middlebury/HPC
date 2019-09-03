#!/usr/bin/env python3
# Simple counter

import time
import sys

c = 0
while c < 100:
    print c,
    sys.stdout.flush()
    c += 1
    time.sleep(1)

