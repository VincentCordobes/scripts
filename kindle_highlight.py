#!/usr/bin/env python3

import re


def main():
    CLIPPING_FILE = "/Users/Vincent/Desktop/My Clippings.txt"
    with open(CLIPPING_FILE, "r") as hl_file:

        text = hl_file.read()
        regex = re.compile(r"Votre surlignement.*\n+(.*)\n==========")
        hls = re.findall(regex, text)

        for hl in set(hls):
            print(hl, "\n")


if __name__ == "__main__":
    main()
