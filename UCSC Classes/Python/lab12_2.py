#!/usr/bin/env python

import tree_def

class FruitTree(tree_def.Tree):

    fruit = "Some kind of fruit"

    def Print(self):
        print self.__class__.__name__ ,
        tree_def.Tree.Print(self)
        print "Eat my %s." % self.fruit

class Apple(FruitTree):
    fruit = "Apple"

class Banana(FruitTree):
    fruit = "Banana"

class Fig(FruitTree):
    fruit = "Fig"

def main():
    trees = Apple(30), Banana(40), Fig(10)

    for tree in trees:
        tree.Print()

if __name__ == '__main__':
    main()