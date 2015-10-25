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
    
        // Methods
        void add();                                 //add a new employee
        void displayEmployees();                    //Display all employees
        bool openFile();                            //Open File
        void saveFile();                            //Save the file
        void search();                              //Search for an employee
        void remove();                              //Remove an employee
        void closeFile();                           //Close File
        void userMenu();                            //Display User Menu
        void sort();                                //Sort the employee array
    
        // Variables
        char fileName[80];                          //FileName passed in from main

    
    private:
    
        Employee *head;
        Employee *previous;
        Employee *current;
        Employee *last;
    
        // Variables
        char employeeName[20];                      //Employee Name
        unsigned int employeeAge;                   //Employee Age
        long double employeeSalary;                 //Employee Salary
        Employee *employeeLink;                     //Employee Link
        ifstream inputFile;                         //ifstream input file
        int userSelection;                          //UserSelection selection;
        int lineCount;                              //Get a number of lines in the record
        Employee **employees;                       //temporary array to hold the created Employee Object
        
        
        //Helper Methods
        void readData();                            //reads the input file and setups necessary back end data
        int getNumberOfRecords();                  //reads through the file and gets the number of records
        string formatSalary(string salary);
    
};


/************************************************************
 Function: userMenu()
 Purpose: Display the user with an input and menu screen.
 Parameters: none
 Variables: 
        userSelection: ENUM Values
************************************************************/
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
                    remove();
                    break;
                case SEARCH:
                    search();
                    break;
                case LIST:
                    displayEmployees();
                    break;
                case SAVE:
                    saveFile();
                    break;
                case EXIT:
                    saveFile();
                    exit(0);
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


/************************************************************
 Function: formatSalary(string sal)
 Purpose: Converts a string and add a comma
 Parameters:
        sal: salary to be formatted
 Variables:
        length: length of the variable to be formatted
        salaryToFormat: Original string to be formatted
        formattedSalary: newly formatted salary
************************************************************/
string Employee::formatSalary(string sal)
{
    // get the original string
    string salaryToFormat = sal;
    // get the length of the original string
    int length = int(salaryToFormat.length());
    
    // variable to hold the new formatted string
    string formattedSalary;
    
    //determine the spot where comma should be added
    unsigned int comma = length % 3;
    
    //iterate through each character and add the comma
    for (int i = 0; i < length; i++)
    {
        if (i % 3 == comma && i)
        {
            formattedSalary += ',';
        }
        
        formattedSalary += salaryToFormat[i];
    }
    
    // return the formatted string.
    return "$" + formattedSalary;
}

/************************************************************
 Function: add()
 Purpose: add new employee into the employees array
 Parameters: none
 Variables: 
        name: new employee name
        age: new employee age
        salary: new employee salary
************************************************************/
void Employee::add()
{
    char name[256];
    unsigned int age;
    long double salary;
    
    cout << "Enter Employee's Name: ";
    cin.ignore();
    cin.getline(name, 256);
    cout << "Enter Employee's Age: ";
    cin >> age;
    cout << "Emter Employee's Salary: ";
    cin >> salary;
    
    fstream outputFile(fileName, ios::app);
    outputFile << name <<  ";" << age << ";" << salary;
    outputFile.close();
    
    cout << "Employee Added" << endl;
    
}

/************************************************************
 Function: search()
 Purpose: search for employees
 Parameters: none
 Variables:
        name: employee name
        maximumSearch: number of records
        count: number of elements to display
************************************************************/
void Employee::search()
{
    char name[20];
    
    cout << "What is the name of the person your looking for ? ";
    cin.ignore();
    cin.getline(name, 256);
    
    int maximumSearch = getNumberOfRecords();
    int count = 0;
    
    bool not_found = true;
    
    
    while (not_found && count < maximumSearch)
    {
        if (strcmp(employees[count]->employeeName, name) == 0)
        {
            cout << setw(10) << "#" << left << setw(20) << "Employee Name" << left << setw(10) << "Age" << left << setw(15) << "Salary" << endl;
            cout << "===============================================================" << endl;

            cout << left << setw(10) << count;
            cout << left << setw(20) << employees[count]->employeeName;
            cout << left << setw(10) << employees[count]->employeeAge;
            cout << left << setw(15) << employees[count]->employeeSalary;
            cout << "\n";

            not_found = false;
            cout << "===============================================================" << endl;
            break;
        }
        else
        {
            ++count;
        }
        
        if (count == maximumSearch)
        {
            cout << setw(10) << "#" << left << setw(20) << "Employee Name" << left << setw(10) << "Age" << left << setw(15) << "Salary" << endl;
            cout << "===============================================================" << endl;

            cout << "Employee Not Found. Please double check employee name.\n\n";
            cout << "===============================================================" << endl;
            break;
        }
    }

    
    userMenu();
    
}

/************************************************************
 Function: remove()
 Purpose: remove employee from the database
 Parameters: none
 Variables:
        name: employee name
        maximumSearch: number of records
        count: number of elements to display
************************************************************/
void Employee::remove()
{
    char name[20];
    
    cout << "Name of the employee to delete ? ";
    cin.ignore();
    cin.getline(name, 256);
    
    int maximumSearch = getNumberOfRecords();
    int count = 0;
    
    bool not_found = true;
    
    
    while (not_found && count < maximumSearch)
    {
        if (strcmp(employees[count]->employeeName, name) == 0)
        {
            cout << setw(10) << "#" << left << setw(20) << "Employee Name" << left << setw(10) << "Age" << left << setw(15) << "Salary" << endl;
            cout << "===============================================================" << endl;
            
            cout << left << setw(10) << count;
            cout << left << setw(20) << employees[count]->employeeName;
            cout << left << setw(10) << employees[count]->employeeAge;
            cout << left << setw(15) << employees[count]->employeeSalary;
            cout << "\n";
            
            employees[count] = 0;
            saveFile();
     
            not_found = false;
            cout << "===============================================================" << endl;
            break;
        }
        else
        {
            ++count;
        }
        
        if (count== maximumSearch)
        {
            cout << setw(10) << "#" << left << setw(20) << "Employee Name" << left << setw(10) << "Age" << left << setw(15) << "Salary" << endl;
            cout << "===============================================================" << endl;
            cout << "Employee Not Found. Please double check employee name.\n\n";
            cout << "===============================================================" << endl;
            break;
        }
    }
    
    
    userMenu();
    
}

/************************************************************
 Function: saveFile()
 Purpose: save the file
 Parameters: none
 Variables:
        outputFile: output file object
************************************************************/
void Employee::saveFile()
{
    ofstream outputFile(fileName);
    if (!outputFile)
    {
        cout << "Unable to open the file !";
    }
    
    for (int i = 0; i < lineCount; i++)
    {
        // only add if the employee isnt null.
        if (employees[i] != 0)
        {
            outputFile << employees[i]->employeeName << ";";
            outputFile << employees[i]->employeeAge << ";";
            outputFile << employees[i]->employeeSalary << endl;
        }
        
    }
    
    outputFile.close();
    
}

/************************************************************
 Function: readData()
 Purpose: read in the file from the file
 Parameters: none
 Variables:
        count: number of records in the file
        elementCount: local count of variables
        employees: instantiating new employees
************************************************************/
void Employee::readData()
{
    
    int count = getNumberOfRecords();
    
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

/************************************************************
 Function: sort()
 Purpose: sort the records thats being read from the database
 Parameters: none
 Variables:
        tmp: temporary object to hold while swapping
        i: inner search counter
        j: outer search counter
************************************************************/
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


/************************************************************
 Function: getNumberOfRecords()
 Purpose: get the number of records
 Parameters: none
 Variables:
        count: keep number of records
************************************************************/
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
            ++count;
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

/************************************************************
 Function: displayEmployees()
 Purpose: display the menu and prompt the user
 Parameters: none
 Variables:
        salary: string variable to hold the salary
        readLine: character to holde the value that's being read in
        indexNumber: number of elements
************************************************************/
void Employee::displayEmployees()
{
    string salary;
    
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
            salary = strtok(NULL, ";");
            
            cout << left << setw(15) << formatSalary(salary);
            cout << "\n";
            indexNumber++;
        }
        
        cout << "===============================================================" << endl;
        
        //DEBUG - display the number of records found in the input file
        //cout << "Number of Records: " << lineCount << endl;
        
        closeFile();
    }
    else
    {
        cout << "FAILED TO OPEN THE DAMN FILE !!!" << endl;
    }
    
}

/************************************************************
 Function: saveFile()
 Purpose: save the file
 Parameters: none
 Variables: none
 ************************************************************/
bool Employee::openFile()
{
    inputFile.open(fileName);
    
    return (inputFile) ? true : false;
}


/************************************************************
 Function: closeFile()
 Purpose: close the file
 Parameters: none
 Variables: none
************************************************************/
void Employee::closeFile()
{
    inputFile.close();
}

/************************************************************
 Function: main()
 Purpose: main entry point of the project
 Parameters: none
 Variables: none
************************************************************/
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

    return 0;
}
