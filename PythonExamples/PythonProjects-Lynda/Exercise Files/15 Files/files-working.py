#!/usr/bin/python3
# files.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC

def main():
    buffersize = 50000
    infile = open("/Users/jamesjkim/Library/Logs/com.apple.sharingd/sharingd.log", 'r')
    outfile = open ("/Users/jamesjkim/Desktop/sharingd.log", "w")
    buffer = infile.read(buffersize)
    
    while len(buffer):
        outfile.write(buffer)
        print(".", end = '')
        buffer = infile.read(buffersize)
    print()
    print("Done")

if __name__ == "__main__": main()
