//
//  Employee.cpp
//  Employee
//
//  Created by James Kim on 10/14/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include <iomanip>
#include <fstream>
#include <string.h>




using namespace std;

enum UserSelection
{
    ADD = 1,
    DELETE = 2,
    SEARCH = 3,
    LIST = 4,
    SAVE = 5,
    EXIT = 6
};

class Employee
{
    public:
        void setEmployeeName(const char *eName);
        char getEmployeeName();
        void setEmployeeAge(unsigned int eAge);
        void setEmployeeSalary(double eSalary);
    
    private:
        char employeeName[20];
        unsigned int employeeAge;
        double employeeSalary;
        Employee *employeeLink;
};

void Employee::setEmployeeName(const char *eName)
{
    strcpy(employeeName, eName);
}

char Employee::getEmployeeName()
{
    return *employeeName;
}

void Employee::setEmployeeAge(unsigned int eAge)
{
    employeeAge = eAge;
}

void Employee::setEmployeeSalary(double eSalary)
{
    employeeSalary = eSalary;
}

class EmployeeTracker
{
    public:
        EmployeeTracker(const char *fileName);
    
    

        void displayEmployees();                    //Display Employees (reads from the file)
        bool openFile();                            //Open File
        void closeFile();                           //Close File
        void userMenu();                            //Display User Menu
    
    private:
        ifstream inputFile;                         //ifstream input file
        char fileName[80];                          //FileName passed in from main
        int userSelection;                          //UserSelection selection;
    
        int lineCount;                              //Get a number of lines in the record
        Employee *employees;                 //temporary array to hold the created Employee Object
    
    
        //Helper Methods
        void readData();                            //reads the input file and setups necessary back end data
        void getNumberOfRecords();                  //reads through the file and gets the number of records
    

};

/***********************************************************************
 *   Function: Constructor                                              *
 *   Purpose:  Constructor to set some data members                     *
 *   Parameters:  fileName - passed in from main function               *
 *   Local Variables:  userSelection - selection from menu              *
 ***********************************************************************/
EmployeeTracker::EmployeeTracker(const char *fName)
{
    userSelection = 0;                                  //userSelection
    lineCount = 0;                                      //initialize the number of lines
    strcpy(fileName, fName);                   //copies the const char file name to the data member
    
    getNumberOfRecords();                               //get number of records
    readData();
    
    employees = new Employee[lineCount - 1];
    //DEBUG - check to see if the file name is passed
    //cout << "Data Member: " << this->fileName << endl;
}

/***********************************************************************
 *   Function: userMenu                                                 *
 *   Purpose:  Prompts the user with the input menu                     *
 *   Parameters:  None                                                  *
 *   Local Variables:  UserSelection ENUM                               *
 ***********************************************************************/
void EmployeeTracker::userMenu()
{
    cout << "Menu Options: " << endl;
    cout << setw(10) << " " << "1. Add Employee" << endl;
    cout << setw(10) << " " << "2. Delete Employee" << endl;
    cout << setw(10) << " " << "3. Search Employee" << endl;
    cout << setw(10) << " " << "4. List All Employees" << endl;
    cout << setw(10) << " " << "5. Save Employee Database" << endl;
    cout << setw(10) << " " << "6. Exit Employee Database" << endl;
    cout << "Enter Your Choice: ";
    
    while (cin >> userSelection || !cin.eof())
    {
        //Instantiating UserSelection enum for userSelection
        UserSelection selection = (UserSelection)userSelection;
        
        if (cin.good())
        {
            switch (selection)
            {
                case ADD:
                    cout << "You selected " << selection << endl;
                    break;
                case DELETE:
                    cout << "You selected " << selection << endl;
                    break;
                case SEARCH:
                    cout << "You selected " << selection << endl;
                    break;
                case LIST:
                    cout << "You selected " << selection << endl;
                    displayEmployees();
                    break;
                case SAVE:
                    cout << "You selected " << selection << endl;
                    break;
                case EXIT:
                    cout << "You selected " << selection << endl;
                    exit(0);
            }
        }
        else
        {
            cout << "Invalid Selection. Please try again. " << endl;
        }
        
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
    }
}

void EmployeeTracker::readData()
{
    Employee *newEmployee;
//    
//    int elementCount = 1;
//    int recordCount = 0;
    
    if (openFile())
    {
        //character array to hold each line of data read from the file
        char readline[100];
        char d[] = ";";
        
        //read each line until you reach the end of file
        while (inputFile.getline(readline, 100))
        {
            newEmployee = new Employee;
            strcpy(newEmployee->employeeName, strtok(readline, d));
            cout << readline;
            cout << '\t';

        }
        
//        for (int i = 0; i < lineCount; i++)
//        {
//            cout << employees[i].getEmployeeName() << endl;
//        }
    }
    else
    {
        cout << "FAILED TO OPEN THE FILE !!!" << endl;
    }
}


/***********************************************************************
 *   Function: getNumberOfRecords                                       *
 *   Purpose:  reads through each line in the file and gets number      *
 *   Parameters:  None                                                  *
 *   Local Variables: None                                              *
 *   Member Data: lineCount                                             *
 ***********************************************************************/
void EmployeeTracker::getNumberOfRecords()
{
    if (openFile())
    {
        //character array to hold each line of data read from the file
        char readline[100];
        
        //read each line until you reach the end of file
        while (inputFile.getline(readline, 100))
        {
            lineCount++;
        }
    }
    
    //close the file once complete.
    closeFile();
    
    //DEBUG
    //cout << "Number of Lines: " << lineCount << endl;
}


void EmployeeTracker::displayEmployees()
{
    if (openFile())
    {
        //character array to hold each line of data read from the file
        char readline[100];
        
        //read each line until you reach the end of file
        while (inputFile.getline(readline, 100))
        {
            cout << readline << endl;
            lineCount++;
        }
        
        //DEBUG - display the number of records found in the input file
        //cout << "Number of Records: " << lineCount << endl;
    }
    else
    {
        cout << "FAILED TO OPEN THE DAMN FILE !!!" << endl;
    }
}

/***********************************************************************
 *   Function: openFile                                                 *
 *   Purpose:  Opens the file                                           *
 *   Parameters:  filePath - filePath from the main function            *
 *   Return: bool if the file opens                                     *
 *   Local Variables:  NA                                               *
 ***********************************************************************/
bool EmployeeTracker::openFile()
{
    inputFile.open(fileName);
    
    return (inputFile) ? true : false;
}


void EmployeeTracker::closeFile()
{
    inputFile.close();
}



int main(int argc, const char * argv[])
{
    /*****************************************************************/
    //DEBUG:
    //(argv[0] == NULL) ? cout << "NULL\n" : cout << argv[0] << endl;
    //(argv[1] == NULL) ? cout << "NULL\n" : cout << argv[1] << endl;
    //if (argc != 2)
    //{
    //    cout << "Usage: EMPLOYEE <FileName>" << endl;
    //    exit(0);
    //}
    /*****************************************************************/
    
    
    EmployeeTracker newEmployee(argv[1]);
    newEmployee.userMenu();
    
    //set the proper variables...
    
    
    
    
    //cout << "DATA MEMBER FILENAME: " << newEmployee.fileName;
    

    
    //Open the file
    //ifstream inputFile;
    //inputFile.open(argv[1]);
    
    //Check to see if you can open the file
    //if (!inputFile)
    //{
    //    cout << "ERROR: Unable to open the file " << endl;
    //}
    
    //character array to hold each line of data read from the file
    //char readline[100];
    
    //read each line until you reach the end of file
//    while (inputFile.getline(readline, 100))
//    {
//        cout << readline << endl;
//    }
    
    //Close the file
    //inputFile.close();
    
    return 0;
}
