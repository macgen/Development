#!/usr/bin/python3
# syntax.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC

def main():
    func()  
    func(5)
    func(3)
    
def func(a = 3):
    for i in range(a, 10):
        print(i, end='\n')
    print()
    
if __name__ == "__main__": main()
