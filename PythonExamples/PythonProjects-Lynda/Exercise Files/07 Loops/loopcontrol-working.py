#!/usr/bin/python3
# break.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC

def main():
    s = "This is James Kim"
    
    for c in s:
        print(c, end='')
    else:
        print("End of the iterator")
        
        
    a, b = 0, 1
    
    v = "It is less " if a < b else "It is greater"
    print(v)

if __name__ == "__main__": main()
