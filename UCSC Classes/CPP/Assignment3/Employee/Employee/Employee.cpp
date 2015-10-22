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
#include <string>




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
    
    
        void add();                                 //add employee
        void displayEmployees();                    //Display Employees (reads from the file)
        bool openFile();                            //Open File
        void saveFile();
        void closeFile();                           //Close File
        void userMenu();                            //Display User Menu
        void sort();                                //Sort the employee array
    
    
        char fileName[80];                          //FileName passed in from main

    
    private:
    
        char employeeName[20];
        unsigned int employeeAge;
        long double employeeSalary;
        Employee *employeeLink;
    
    
    
        ifstream inputFile;                         //ifstream input file
        int userSelection;                          //UserSelection selection;
    
        int lineCount;                              //Get a number of lines in the record
        Employee **employees;                       //temporary array to hold the created Employee Object
        
        
        //Helper Methods
        void readData();                            //reads the input file and setups necessary back end data
        int getNumberOfRecords();                  //reads through the file and gets the number of records
    
};


/***********************************************************************
 *   Function: userMenu                                                 *
 *   Purpose:  Prompts the user with the input menu                     *
 *   Parameters:  None                                                  *
 *   Local Variables:  UserSelection ENUM                               *
 ***********************************************************************/
void Employee::userMenu()
{
    readData();
    
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
                    add();
                    break;
                case DELETE:
                    cout << "You selected " << selection << endl;
                    break;
                case SEARCH:
                    cout << "You selected " << selection << endl;
                    break;
                case LIST:
                    displayEmployees();
                    break;
                case SAVE:
                    cout << "You selected " << selection << endl;
                    break;
                case EXIT:
                    cout << "You selected " << selection << endl;
                    break;
                default:
                    break;
            }
        }
        else
        {
            cout << "Invalid Selection. Please try again. " << endl;
        }
        
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        
        userMenu();
    }
}

/***********************************************************************
 *   Function: add                                                      *
 *   Purpose:  Prompts the user to input the new employee's info        *
 *   Parameters:  None                                                  *
 *   Local Variables: firstName, lastName, age and salar                *
 *   Member Data: NA                                                    *
 ***********************************************************************/
void Employee::add()
{
    string firstName;
    string lastName;
    unsigned int age;
    long double salary;
    
    cout << "Enter New Employee First Name: ";
    cin >> firstName;
    cout << "Enter New Employee Last Name: ";
    cin >> lastName;
    cout << "Enter Employee's Age: ";
    cin >> age;
    cout << "Emter Employee's Salary: ";
    cin >> salary;
    
    fstream outputFile(fileName, ios::app);
    outputFile << firstName << " " << lastName << ";" << age << ";" << salary;
    outputFile.close();
    
    cout << "Employee Added" << endl;
    
}



/***********************************************************************
 *   Function: saveFile                                                 *
 *   Purpose:  Takes the content of the array and saves it to the file  *
 *   Parameters:  None                                                  *
 *   Local Variables: NA                                                *
 *   Member Data: NA                                                    *
 ***********************************************************************/
void Employee::saveFile()
{
    ofstream outputFile(fileName);
    if (!outputFile)
    {
        cout << "Unable to open the file !";
    }
    
    for (int i = 0; i < lineCount; i++)
    {
        outputFile << employees[i]->employeeName << ";";
        outputFile << employees[i]->employeeAge << ";";
        outputFile << employees[i]->employeeSalary << endl;
    }
    
    outputFile.close();
    
}

/***********************************************************************
 *   Function: readData                                                 *
 *   Purpose:  reads through each line in the file and gets number      *
 *   Parameters:  None                                                  *
 *   Local Variables: None                                              *
 *   Member Data: elementCount - keeps track of each element in the a   *
 *                                array                                 *
 ***********************************************************************/
void Employee::readData()
{
    //get the number of records so that we couyld dynamically create an array of employees
//    getNumberOfRecords();
    
    int count = getNumberOfRecords();
    cout << "Count: " << count << endl;
    
    
    //instantiate the array of employees
    employees = new Employee*[count];
    
    //keeps the local count to fill the employee array
    int elementCount = 0;
    
    //open the file
    if (openFile())
    {
        //character array to hold each line of data read from the file
        char readline[100];
        char d[] = ";";
        
        //read each line until you reach the end of file
        while (inputFile.getline(readline, 100))
        {
            //instantiate a new employee
            Employee *newEmployee = new Employee;
            
            //fill each object property delimited by the ;
            strcpy(newEmployee->employeeName, strtok(readline, d));
            newEmployee->employeeAge = atoi(strtok(NULL, d));
            newEmployee->employeeSalary = atoi(strtok(NULL, d));

            //DEBUG - displaying each element being entered
//            cout << newEmployee->employeeName << "\t";
//            cout << newEmployee->employeeAge << "\t";
//            cout << newEmployee->employeeSalary << "\t";
//            cout << '\n';
            
            //assigning new employee object to the array
            employees[elementCount] = newEmployee;
            //increment so that next array can be filled
            ++elementCount;
        }
        
        sort();
        //saveFile();
        closeFile();
    }
    else
    {
        cout << "FAILED TO OPEN THE FILE !!!" << endl;
    }
    


}

/***********************************************************************
 *   Function: sort                                                     *
 *   Purpose:  perform bubble sort and save the file                    *
 *   Parameters:  None                                                  *
 *   Local Variables: None                                              *
 *   Member Data: NA                                                    *
 ***********************************************************************/
void Employee::sort()
{
    Employee *tmp;
    int i;
    int j;
    
    for ( i = 0; i < lineCount; i++)
    {
        for ( j = i + 1; j < lineCount; j++)
        {
            //if ( strcmp((*(employees + i)->employeeName), (*(employees + j)->employeeName)) > 0)
            if (strcmp(employees[i]->employeeName, employees[j]->employeeName) > 0)
            {
                tmp = employees[i];
                employees[i] = employees[j];
                employees[j] = tmp;
            }
        }
    }
    
    saveFile();
}


/***********************************************************************
 *   Function: getNumberOfRecords                                       *
 *   Purpose:  reads through each line in the file and gets number      *
 *   Parameters:  None                                                  *
 *   Local Variables: None                                              *
 *   Member Data: lineCount                                             *
 ***********************************************************************/
int Employee::getNumberOfRecords()
{
    int count = 0;
    
    if (openFile())
    {
        //character array to hold each line of data read from the file
        char readline[100];
        
        //read each line until you reach the end of file
        while (inputFile.getline(readline, 100))
        {
            //cout << readline << endl;
            count++;
        }
    }
    else
    {
        cout << "Unable to open the file !" << endl;
    }
    
    //close the file once complete.
    closeFile();
    
    //set the data member updated
    lineCount = count;
    
    return count;
    //DEBUG
    //cout << "Number of Lines: " << lineCount << endl;
}

/***********************************************************************
 *   Function: displayEmployees                                         *
 *   Purpose:  Reads the file and displays the content                  *
 *   Parameters:  NA                                                    *
 *   Return: NA                                                         *
 *   Local Variables:  NA                                               *
 ***********************************************************************/
void Employee::displayEmployees()
{
    if (openFile())
    {
        //character array to hold each line of data read from the file
        char readline[100];
        int indexNumber = 1;
        
        cout << setw(10) << "#" << left << setw(20) << "Employee Name" << left << setw(10) << "Age" << left << setw(15) << "Salary" << endl;
        cout << "===============================================================" << endl;
        //read each line until you reach the end of file
        while (inputFile.getline(readline, 100))
        {
            cout << left << setw(10) << indexNumber;
            cout << left << setw(20) << strtok(readline, ";");
            cout << left << setw(10) << strtok(NULL, ";");
            cout << left << setw(15) << strtok(NULL, ";");
            cout << "\n";
            indexNumber++;
        }
        
        //DEBUG - display the number of records found in the input file
        //cout << "Number of Records: " << lineCount << endl;
        
        closeFile();
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
bool Employee::openFile()
{
    inputFile.open(fileName);
    
    return (inputFile) ? true : false;
}


/***********************************************************************
 *   Function: closeFile                                                *
 *   Purpose:  Closes the file                                          *
 *   Parameters:  NA                                                    *
 *   Return: NA                                                         *
 *   Local Variables:  NA                                               *
 ***********************************************************************/
void Employee::closeFile()
{
    inputFile.close();
}

/***********************************************************************
 *   Function: main                                                     *
 *   Purpose:  main entry point                                         *
 *   Parameters:  NA                                                    *
 *   Return: NA                                                         *
 *   Local Variables:  NA                                               *
 ***********************************************************************/
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
    
    
    Employee newEmployee;
    strcpy(newEmployee.fileName, argv[1]);
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
