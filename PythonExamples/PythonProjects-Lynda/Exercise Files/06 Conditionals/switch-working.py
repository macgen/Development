#!/usr/bin/python3
# switch.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC

def main():
    
    choice = dict(
                 a = 5,
                 b = 6, 
                 c = 7,
                 d = 8
                 )
    
    v = "a"
    
    print(choice[v])

if __name__ == "__main__": main()