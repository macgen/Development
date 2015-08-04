#!/usr/bin/env python

class Stack:

    def __init__(self):
        self.things = []


    def Push(self, thing):
        self.things += [thing]


    def Pop(self):
        try:
            return self.things.pop()
        except IndexError:
            return None

def main():
    box = Stack()
    print box.Pop()
    box.Push("Ball")
    box.Push("Bat")
    print box.Pop()
    print box.Pop()
    print box.Pop()



if __name__ == '__main__':
    main()
