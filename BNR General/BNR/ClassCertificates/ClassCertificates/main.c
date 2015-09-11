//
//  main.c
//  ClassCertificates
//
//  Created by James on 3/1/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <unistd.h>

void congratulateStudent(char *student, char *courses, int numDays)
{
    printf ("%s has done as much %s Programming as I could fit into %d days.\n", student, courses, numDays);
}

int main(int argc, const char * argv[])
{
    congratulateStudent("Kate", "Cocoa", 5);
    sleep(2);
    congratulateStudent("Bo", "Objective-C", 2);
    sleep(2);
    congratulateStudent("Mike", "Python", 5);
    sleep(2);
    congratulateStudent("Liz", "iOS", 5);
    sleep(2);
}
