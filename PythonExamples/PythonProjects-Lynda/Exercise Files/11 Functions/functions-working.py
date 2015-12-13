#!/usr/bin/python3
# functions.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC

def main():
    testfunc(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

def testfunc(one, two, three, *args):
    print(one, two, three)
    for i in args:
        print(i, end = " ")

if __name__ == "__main__": main()
