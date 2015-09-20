//
//  MagicSquare.cpp
//  MagicSquare
//
//  Created by James Kim on 9/17/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include <limits>
#include <cctype>
#include <iomanip>

using namespace std;

/**
 * Function: name
 * Purpose:
 *      Describe the purpose of the function
 * Parameters:
 *      argument1: description <Passed by reference>
 * Local Variable:
 *      variable1: holds some data
 *      varibale2: holds some data
 **/

class MagicSquare
{
    private:
    int input;                               /* User defined integer       */
    int **loc = 0;                         /* Array holding all          */
    /*  input*input values.       */
    int row;                                 /* Determines row of matrix   */
    int col;                                 /* Determines col of matrix   */
    int value;                               /* Integer between 1 and      */
    /*  input*input               */
    int otherdiag;                           /* Total of one matrix diagonal*/
    
    
    public:
    void userInput();
    void displayResults();
    void init();
    void clean();
    
};

void MagicSquare::init()
{
    loc = new int*[input + 1];
    
    for (row = 0; row <= input; row++)
    {
        loc[row] = new int[input + 1];
    }
    
    for (row = 0; row <= input; row++)
    {
        for (col = 0; col <= input; col++)
        {
            //loc[row] = new int[col];
            *(loc[row] + col) = 0;
        }
    }
    
    /*  rows 1 to input*input and */
    /*  columns 1 to input*input. */
    /* Row totals will reside in  */
    /*  loc[row][0], where row is */
    /*  the row number, while the */
    /*  column totals will reside */
    /*  in loc[0][col], where col */
    /*  is the column number.     */
    row = 1;                              /* First value gets to sit on */
    col = input/2 + 1;                    /*  1st row, middle of matrix.*/
    otherdiag = 0;

    /*                                                                        */
    /*    Loop for every value up to input*input, and position value in matrix*/
    /*                                                                        */
    for (value = 1; value <= input*input; value++)
    {                                     /* Loop for all values.       */
        if (loc[row][col] > 0)             /* If some value already      */
        {                                  /*  present, then             */
            row += 2;                       /*  move down 1 row of prev.  */
            if (row > input)                /*  If exceeds side, then     */
                row -= input;                /*   go to other side.        */

            col--;                          /*  move left 1 column.       */
            if (col < 1)                    /*  If exceeds side, then     */
                col = input;                 /*   go to other side.        */
        }

        loc[row][col] = value;             /* Assign value to location.  */

        /*                                                                        */
        /*       Add to totals                                                    */
        /*                                                                        */
        loc[0][col] += value;              /* Add to its column total.   */
        loc[row][0] += value;              /* Add to its row total.      */
        if (row == col)                    /* Add to diagonal total if   */
            loc[0][0] += value;             /*  it falls on the diagonal. */

        if (row+col == input+1)            /* Add to other diagonal if   */
            otherdiag += value;             /*  it falls on the line.     */

        /*                                                                        */
        /*       Determine where new row and col are                              */
        /*                                                                        */
        row--;
        if (row < 1)                       /* If row exceeds side then   */
            row = input;                    /*  goto other side.          */
        col++;
        if (col > input)                   /* If col exceeds side then   */
            col = 1;                        /*  goto other side.          */
    }                                     /* End of getting all values. */
}

void MagicSquare::userInput()
{
//    cout << "Enter a number of rows for the matrix table. (-1 to exit program): " << endl;
//    cout << "[INPUT]: ";
//    
//    while (cin >> input || !cin.eof())
//    {
//        if (cin.good())
//        {
//            if (input == -1)
//            {
//                //cout << "Exited the Program as Requested.";
//                break;
//            }
//            else if (input <= 0)
//            {
//                cout << "Invalid Input Detected: Sorry, but the number of rows must be greater than 0." << endl;
//                break;
//            }
//            else
//            {
//                cout << "You entered: " << input << endl;
//                break;
//            }
//        }
//        else if (!isdigit(input))
//        {
//            cout << "Invalid Input Detected: Sorry but your input must be an integer." << endl;
//            cin.clear();
//            cin.ignore(numeric_limits<streamsize>::max(), '\n');
//        }
//        else
//        {
//            
//        }
//    
//        cout << "Enter a number of rows for the matrix table. (-1 to exit program): " << endl;
//        
//    }
    
        cout << "Enter a positive, odd integer (-1 to exit program):\n";
        while (cin >> input || !cin.eof())
        {
            if (cin.good())
            {
                
                if (input == -1)
                {
                    break;
                }
                
                if (input <= 0)
                {
                    printf("Sorry, but the integer has to be positive.\n");
                    printf("\nEnter a positive, odd integer (-1 to exit program):\n");
                    continue;
                }
                
                if (input > 13)
                {
                    printf("Sorry, but the integer has to be less than 15.\n");
                    printf("\nEnter a positive, odd integer (-1 to exit program):\n");
                    continue;
                }
                
                if (input%2 == 0)
                {
                    printf("Sorry, but the integer has to be odd.\n");
                    printf("\nEnter a positive, odd integer (-1 to exit program):\n");
                    continue;
                }
                
                break;
            }
            else if (!isdigit(input))
            {
                cout << "Invalid Input Detected: Sorry but your input must be an integer." << endl;
                cin.clear();
                cin.ignore(numeric_limits<streamsize>::max(), '\n');
                continue;
            }
            
            cout << "Enter a positive, odd integer (-1 to exit program):\n";
        }
    
    
}



/**
 * Function: displayResults
 * Purpose:
 *      Prints the data inside the matrix
 * Parameters:
 *      argument1: description <Passed by reference>
 * Local Variable:
 *      variable1: holds some data
 *      varibale2: holds some data
 **/
void MagicSquare::displayResults()
{
//    row = 1;                              /* First value gets to sit on */
//    col = input/2 + 1;                    /*  1st row, middle of matrix.*/
//    otherdiag = 0;
//    
//    cout << "\nThe number you selected was " << input << endl;
//    cout << "and the matrix is:\n\n";
//    for (row = 1; row <= input; row++)     /* Loop: print a row at a time*/
//    {
//        cout << "   ";                   /* Create column for diag.total*/
//        for (col = 1; col <=input; col++)
//        {
//            cout << loc[row][col];    /* Print values found in a row*/
//        }
//        
//        cout << " = " << "\n" << loc[row][0];    /* Print total of row.        */
//    }
    
    //test display the newly created matrix table
//    for (row = 0; row < input; row++)
//    {
//        for (col = 0; col < input; col++)
//        {
//            cout << loc[row][col] << " ";
//        }
//        
//        cout << endl;
//    }
    
    /*                                                                        */
    /*    Print out the matrix with its totals                                */
    /*                                                                        */
    cout << "\nThe number you selected was " << input << endl;
    cout << ", and the matrix is:\n\n";
    for (row = 1; row <=input; row++)     /* Loop: print a row at a time*/
    {
        cout << "     ";                   /* Create column for diag.total*/
        for (col = 1; col <=input; col++)
        {
            cout << setw(5) << loc[row][col];    /* Print values found in a row*/
        }
        
        cout << " = " << setw(5) << loc[row][0] << endl;    /* Print total of row.        */
    }

    /*                                                                        */
    /*    Print out the totals for each column, starting with diagonal total. */
    /*                                                                        */
    for (col = 0; col <=input; col++)     /* Print line separating the  */
        printf("-----");                   /*  value matrix and col totals*/
    printf("\n%5d",otherdiag);            /* Print out the diagonal total*/
    for (col = 1; col <=input; col++)
        printf("%5d",loc[0][col]);         /* Print out the column totals*/
    printf("   %5d\n",loc[0][0]);         /* Print out the other diagonal*/
    /*  total                     */
    printf("\nEnter a positive, odd integer (-1 to exit program):\n");

                                       /* End of while input>-1 loop */
    printf("\nBye bye!\n");
}

void MagicSquare::clean()
{
    //clean up..
    for (int i = 0; i < input; i++)
    {
        delete [] loc[i];
    }
    
    delete [] loc;
}

int main(int argc, const char * argv[])
{
    
    MagicSquare mySquare;
    mySquare.userInput();
    mySquare.init();
    mySquare.displayResults();
    
    //mySquare.clean();
    
    
    
    return 0;
}
