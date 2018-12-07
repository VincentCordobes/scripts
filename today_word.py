#!/usr/bin/env python3
"""
Select a word from my french word list
"""
import re
import random


def main():
    """
    Read word file and print one random word
    """
    words_file = open('/Users/Vincent/Dropbox/wiki/Voc.md', 'r')

    lines = words_file.read().splitlines()
    regex = re.compile(r'^[^#\s%].*')
    filered_lines = list(filter(regex.search, lines))

    print(random.choice(filered_lines))
    words_file.close()


if __name__ == '__main__':
    main()
