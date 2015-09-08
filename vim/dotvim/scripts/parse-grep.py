#!/usr/bin/python

# Usage: parse-grep.py <GIT-GREP-FILENAME>

import sys

with open(sys.argv[1], 'r') as f:
    lastFilename = ''
    printFilenameNext = False
    for line in f:
        if len(line) > 500:  # Compiled files - hacky quickfix
            continue

        if line[0].isalpha():
            lastFilename = line.strip()
            printFilenameNext = True
        elif line[0].isdigit():
            lineNum = line.split(':')[0].split('-')[0]
            # Print the file it's in, with the line number, if we can
            if printFilenameNext:
                print lastFilename + ':' + lineNum + ':'
                printFilenameNext = False
            print line.rstrip().lstrip('0123456789-:')
        else:   # -- Between diffs of the same file
            printFilenameNext = True

