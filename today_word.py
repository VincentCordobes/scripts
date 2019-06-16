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
    with open("/Users/Vincent/Dropbox/wiki/Voc.md", "r") as words_file:
        lines = words_file.read().splitlines()

    regex = re.compile(r"^[^#\s%].*")
    filtered_lines = list(filter(regex.search, lines))

    print(random.choice(filtered_lines))


if __name__ == "__main__":
    main()
