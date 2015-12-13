#!/usr/bin/python3
# classes.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC

class Duck:
    def __init__(self, color = 'white'):
        self._color = color
        
    def quack(self):
        print('Quaaack!')

    def walk(self):
        print('Walks like a duck.')
        
    def get_color(self):
        return self._color
    
    def set_color(self, color):
        self._color = color

def main():
    donald = Duck()
    print(donald.get_color())
    donald.set_color("Orange")
    print(donald.get_color())

if __name__ == "__main__": main()
