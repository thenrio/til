import math

def solve(area):
    parts=[]
    while area > 0:
        part = int(math.pow(math.floor(math.sqrt(area)), 2))
        parts.append(part)
        area -= part
    return parts
