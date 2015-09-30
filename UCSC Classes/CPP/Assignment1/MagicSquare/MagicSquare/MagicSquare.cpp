//
//  MagicSquare.cpp
//  MagicSquare
//
//  Created by James Kim on 9/17/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//
//  OS: Mac OS X 10.11
//  Compiler: LLVM
//  IDE: XCode

#include <iostream>
#include <limits>
#include <cctype>
#include <iomanip>

using namespace std;

class MagicSquare
{
    private:
        int input;              // User defined integer
        int **loc = 0;          // Array holding all
        int row;                // Determines row of matrix
        int col;                // Determines col of matrix
        int value;              // Integer between 1 and
        int otherdiag;          // Total of one matrix diagonal*/

    public:
        void userInput();       //Method to get user input
        void displayResults();  //Displaying results
        void createMatrix();    //Allocating and creating the matrix table
        void clean();           //Cleaning up the memory
};

/**
 * Function: userInput
 * Purpose:
 *      Get a valid input from the user by asking the user to provide the number of rows & column for the matrix table
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      input: Int that holds the user input.
 *      loc: Int Array that 2 Dimentional Array.
 *      row: Int that holds the number of rows.
 *      col: Int that holds the number of columns.
 **/
void MagicSquare::userInput()
{
    //Prompt the user for the input
    cout << "Enter a positive, odd integer (-1 to exit program): " << endl;
    
    //As long as valid input or not eof, continue on.
    while (cin >> input || !cin.eof())
    {
        if (cin.good())
        {
            if (input == -1)
            {
                //Clean up the allocated memory
                clean();
                
                cout << "\nBye bye!\n";
                break;
            }
            
            if (input <= 0)
            {
                cout << "Sorry, but the integer has to be positive." << endl;
                cout << "\nEnter a positive, odd integer (-1 to exit program): " << endl;
                continue;
            }
            
            if (input > 13)
            {
                cout << "Sorry, but the integer has to be less than 15. " << endl;
                cout << "\nEnter a positive, odd integer (-1 to exit program): " << endl;
                continue;
            }
            
            if (input % 2 == 0)
            {
                cout << "Sorry, but the integer has to be odd. " << endl;
                cout << "\nEnter a positive, odd integer (-1 to exit program): " << endl;
                continue;
            }
            
            createMatrix();
        }
        //Make sure that the input isnt anything but a digit.
        else if (!isdigit(input))
        {
            cout << "Invalid Input Detected: Sorry but your input must be an integer." << endl;
            
        }
        
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        
        cout << "\nEnter a positive, odd integer (-1 to exit program): " << endl;
    }
}

/**
 * Function: createMatrix
 * Purpose:
 *      Allocates memory to create the matrix
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      input: Int that holds the user input.
 *      loc: Int Array that 2 Dimentional Array.
 *      row: Int that holds the number of rows. 
 *      col: Int that holds the number of columns.
 **/
void MagicSquare::createMatrix()
{
    //Allocate the memmory for the number of rows in the matrix with the number provided by the end user
    loc = new int*[input + 1];
    
    //ALlocate the memor for the each column per row
    for (row = 0; row <= input; row++)
    {
        loc[row] = new int[input + 1];
    }
    
    //Initially fill in each cells with the ZERO value
    for (row = 0; row <= input; row++)
    {
        for (col = 0; col <= input; col++)
        {
            //loc[row] = new int[col];
            *(loc[row] + col) = 0;
        }
    }
    
    // rows 1 to input*input and columns 1 to input*input.
    // Row totals will reside in loc[row][0], where row is the row number, while the column totals will reside in loc[0][col], where col is the column number.

    // First value gets to sit on first row
    row = 1;
    
    //1st row, middle of matrix
    col = input/2 + 1;
    
    //Initial diagnoal value
    otherdiag = 0;
    
    /* Loop for every value up to input*input, and position value in matrix*/
    for (value = 1; value <= input*input; value++)
    {
        
        // Loop for all values if some value already present, then move down 1 row of prev.
        // If exceeds side, then go to other side. move left 1 column.
        // If exceeds side, then go to other side.
        if (loc[row][col] > 0)
        {
            row += 2;
            if (row > input)
            {
                row -= input;
            }
            
            col--;
            if (col < 1)
            {
                col = input;
            }
            
        }
        
        // Assign value to location.
        loc[row][col] = value;
        
        // Add to totals
        loc[0][col] += value;              /* Add to its column total.   */
        loc[row][0] += value;              /* Add to its row total.      */
        
        if (row == col)                    /* Add to diagonal total if   */
        {
            loc[0][0] += value;             /*  it falls on the diagonal. */
        }
        
        
        if (row+col == input+1)            /* Add to other diagonal if   */
        {
            otherdiag += value;             /*  it falls on the line.     */
        }
        
        /* Determine where new row and col are                              */
        row--;
        if (row < 1)                       /* If row exceeds side then   */
        {
            row = input;                    /*  goto other side.          */
        }
        
        col++;
        if (col > input)                   /* If col exceeds side then   */
        {
            col = 1;                        /*  goto other side.          */
        }
        
    }
    
    //Display the results of the matrix
    displayResults();
}



/**
 * Function: displayMatrix
 * Purpose:
 *      Display the data in the matrix.
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      input: Int that holds the user input.
 *      loc: Int Array that 2 Dimentional Array.
 *      row: Int that holds the number of rows.
 *      col: Int that holds the number of columns.
 **/
void MagicSquare::displayResults()
{
    //   Print out the matrix with its totals
    cout << "\nThe number you selected was " << input << " and the matrix is:\n\n";
    
    //Loop through each row and fill in each cell with the value
    for (row = 1; row <=input; row++)
    {
        //First Column is left empty
        cout << "     ";
        
        for (col = 1; col <=input; col++)
        {
            // Print values found in a row
            cout << setw(5) << loc[row][col];
        }
        
        // Print total of row.
        cout << " = " << setw(5) << loc[row][0] << endl;
    }

    //Print out the totals for each column, starting with diagonal total.
    // Print line separating the value matrix and col totals
    for (col = 0; col <=input; col++)
    {
        cout << "-----";
    }

    // Print out the diagonal total
    cout << "\n" << setw(5) << otherdiag;
    for (col = 1; col <=input; col++)
    {
        // Print out the column totals
        cout << setw(5) << loc[0][col];
    }
    
    // Print out the other diagonal
    cout << "   " << setw(5) << loc[0][0] << "\n";

}

/**
 * Function: clean
 * Purpose:
 *      Clean any allocated memory upon exiting the program.
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      loc: Int Array that 2 Dimentional Array.
 **/
void MagicSquare::clean()
{
    //clean up..
    for (int i = 0; i < input; i++)
    {
        //Delete the allocated memory for the columns
        delete [] loc[i];
    }
    
    //Delete the memory allocated for the row
    delete [] loc;
}

int main(int argc, const char * argv[])
{
    //Instantiate an object of MagicSquare
    MagicSquare mySquare;
    
    //Call userInput method
    mySquare.userInput();

    return 0;
}
