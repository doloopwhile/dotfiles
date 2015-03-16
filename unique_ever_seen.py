import fileinput

seen = set()
for line in fileinput.input():
    if line not in seen:
        print(line)
        seen.add(line)
