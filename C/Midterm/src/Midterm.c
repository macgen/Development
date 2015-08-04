/*
 ============================================================================
 Name        : Midterm.c
 Author      : James J. Kim
 Version     :
 Copyright   : No Copy Rights
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>


//Function Prototypes
void displayMenu(); //Displays menu to the user..
void userInput(void); //validates if the user has made a valid selection...


void userInput(void)
{
	int selection;

	do
	{
		printf ("What would you like to do? ");
		scanf("%d", &selection);


		if (selection == 1)
		{
			printf ("Please enter two numbers to add, separated by a space: ");
		}
		else if (selection == 2)
		{
			printf ("Please enter two numbers to subtract, separated by a space: ");
		}
		else if (selection == 3)
		{
			printf ("Please enter two numbers to multiply, separated by a space: ");
		}
		else if (selection == 4)
		{
			printf ("Please enter two numbers to divide, separated by a space: ");
		}
		else if (selection == 5)
		{
			printf ("Thank you for using James' Handy Calculator.");
		}
		else
		{
			printf ("That is not a valid choice, please re-enter: ");
		}
	}
	while (selection != 5);

}

void displayMenu()
{
	printf ("\n\nWelcome to James Handy Calculator\n");
	printf ("1. Addition\n");
	printf ("2. Subtraction\n");
	printf ("3. Multiplication\n");
	printf ("4. Division\n");
	printf ("5. Exit\n");

	userInput();
}

int main(void)
{
	displayMenu();

	return EXIT_SUCCESS;
}
