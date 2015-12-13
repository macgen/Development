#!/usr/bin/python3
# classes.py by Bill Weinman [http://bw.org/]
# This is an exercise file from Python 3 Essential Training on lynda.com
# Copyright 2010 The BearHeart Group, LLC
from turtledemo.nim import COLOR

class Duck:
    
    def __init__(self, **kwargs):
        self.properties = kwargs
        
    def get_properties(self, key):
        return self.properties.get(key, None)
    
    def set_properties(self, key, value):
        self.properties[key] = value
         
#     def __init__(self, **kwargs):
#         self.properties = kwargs
# 
#     def quack(self):
#         print('Quaaack!')
# 
#     def walk(self):
#         print('Walks like a duck.')
# 
#     def get_properties(self):
#         return self.properties
# 
#     def get_property(self, key):
#         return self.properties.get(key, None)

def main():
    donald = Duck(color = "white", size = "Large", health = "Great")
    print(donald.get_properties("color"))
    print(donald.get_properties("size"))
    print(donald.get_properties("health"))
    print(donald.get_properties("healths"))
    print(donald)
    id(donald)
    
if __name__ == "__main__": main()
