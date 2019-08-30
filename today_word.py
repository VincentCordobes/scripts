#!/usr/bin/env python3
"""
Select a word from my french word list
"""
import re
import random
from datetime import date


def main():
    """
    Read word file and print one random word
    """
    with open("/Users/Vincent/Dropbox/wiki/Voc.md", "r") as words_file:
        lines = words_file.read().splitlines()

    regex = re.compile(r"^[^#\s%].*")
    filtered_lines = list(filter(regex.search, lines))
    today = date.today()
    seed = today.year + today.month + today.day
    random.seed(seed)

    print(random.choice(filtered_lines).capitalize())


if __name__ == "__main__":
    main()
