//
//  main.cpp
//  Assignment2-ParkingLot
//
//  Created by James Kim on 9/30/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//
//  OS: Mac OS X 10.11
//  Compiler: LLVM
//  IDE: XCode

#include <iostream>
#include <cctype>
#include <iomanip>
#include <limits>
#include <cstring>

using namespace std;



#define USER_INSTRUCTION "D)isplay   P)ark   R)etrieve   Q)uit\n"
#define INVALID_INPUT "\nInvalid Selection. Please try again\n."
#define VEHICLE_FOUND "Retrieving Vehicle with License Plate #: "
#define VEHICLE_NOTFOUND "We were unable to locate your vehicle. You either came to the wrong place or we SOLD your car."

//enum for identifying user selection and actions
enum UserCommands
{
    DISPLAY='D',
    PARK='P',
    RETRIEVE='R',
    QUIT='Q'
};


class Vehicle
{
    private:
        static unsigned int globalTicketNumber; //varibale to keep track of the ticket number
    
        UserCommands commands;          //declaring enum for user commands
        char userSelection;             //ivar to hold the user selection

        void parkNewVehicle();          //Park New Vehicle
        void displayParked();           //Display
        void retrieveCar(int tNumber);  //Retrieve
    
        void swapVehicle(Vehicle &fromVehicle, Vehicle &toVehicle);

        void incrementTicket();
        int getCurrentTicketNumber();
    
        Vehicle *frontVehicle;          // pointer that points to the first node in the link list
        Vehicle *previous;              // pointer that points to the node before the current in the link list
        Vehicle *current;               // pointer that points to the current node in the link list
        Vehicle *lastVehicle;           // pointer that points to the last node in the link list
        Vehicle *removeVehicle;         //this pointer is used to assign a node that needs to be deleted
    
    public:
    
        Vehicle();                      //default constructor
        unsigned int ticketNumber;      // ticket number per vehicle
        Vehicle *linkVehicleBehind;     //pointer to the car parked behind
        void displayPrompt();           //prompt the user with the instruction
};


unsigned int Vehicle::globalTicketNumber = 0;

/**
 * Function: Vehicle = default constructor
 * Purpose:
 *      Initializes all the pointers once a Vehicle Object is instantiated.
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      current: all assigned to null pointer.
 *      lastVehicle: all assigned to null pointer
 *      frontVehicle: all assigned to null pointer
 *      globalTicketNumber: sets the ticket number to 0.
 **/
Vehicle::Vehicle()
{
    current = 0;
    lastVehicle = current;
    frontVehicle = current;
}

void Vehicle::incrementTicket()
{
    Vehicle::globalTicketNumber++;
}

int Vehicle::getCurrentTicketNumber()
{
    return globalTicketNumber;
}

/**
 * Function: parkNewVehicle()
 * Purpose:
 *      Instantiates a new Vehicle object and add/create a new node in the link list.
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      current: Points to current node.
 *      lastVehicle: Points to the last node in the link list
 *      frontVehicle: Points to the first node in the link list
 *      globalTicketNumber: increments the ticket number and assign to the member variable
 **/
void Vehicle::parkNewVehicle()
{
    // first if statement is only called when the very vehicle is created and ready to be parked
    // all subsequent vehicle will and should be hitting the else statement
    if (frontVehicle == 0)
    {
        //increment the overall ticket number
        incrementTicket();
        
        //setting all pointers to the front, current and tail
        current = new Vehicle;
        frontVehicle = current;
        lastVehicle = current;
        
        current->ticketNumber = getCurrentTicketNumber();
        current->linkVehicleBehind = 0;
        
        // Output to alert the user with the ticket number that's being assigned
        cout << "Ticket No.: " << globalTicketNumber << endl;
    }
    else
    {
        //increment the overall ticket number
        globalTicketNumber++;
        
        lastVehicle->linkVehicleBehind = new Vehicle;
        current = lastVehicle->linkVehicleBehind;
        incrementTicket();
        current->ticketNumber = getCurrentTicketNumber();
        current->linkVehicleBehind = 0;
        lastVehicle = current;
        
        // Output to alert the user with the ticket number that's being assigned
        cout << "Ticket No.: " << globalTicketNumber << endl;
    }
}

/**
 * Function: retrieveCar
 * Purpose:
 *      Iterates through the link list and finds the user requested vehicle.
 * Parameters:
 *      tNumber: ticket number that user is requesting
 * Class MemberVariable:
 *      current: Points to current node.
 *      lastVehicle: Points to the last node in the link list
 *      frontVehicle: Points to the first node in the link list
 *      globalTicketNumber: increments the ticket number and assign to the member variable
 **/
void Vehicle::retrieveCar(int tNumber)
{
    //reset the current pointer to point to the front of the vehicle
    current = frontVehicle;
    
    //iterate through all the link until it hits the end
    while (current != 0)
    {
        
        
        //if this is the very first node, then change the pointer of head
        if (tNumber == current->ticketNumber && current == frontVehicle)
        {
            
            //frontVehicle pointer will now point to the second node
            frontVehicle = current->linkVehicleBehind;
            
            //assign the current pointer to the remove ptr
            removeVehicle = current;
            
            //alert the user
            cout << VEHICLE_FOUND << current << " Ticket: " << current->ticketNumber << endl;
            
            //assign the next node to the current ptr
            current = current->linkVehicleBehind;
            
            //delete the retrieved node
            delete removeVehicle;
            
            //assign the previous link member to the current
            previous->linkVehicleBehind = current;
            
            break;
        } // if the ticketNumber matches the current ticket number
        else if (tNumber == current->ticketNumber)
        {
            
            removeVehicle = current;
            cout << "Retrieving Vehicle with License Plate #: " << current << endl;
            current = current->linkVehicleBehind;
            delete removeVehicle;
            previous->linkVehicleBehind = current;
            break;
            
        } //if this is the last node in the link list
        else if (current->linkVehicleBehind == 0 && lastVehicle == current)
        {
            removeVehicle = current;
            previous->linkVehicleBehind = 0;
            delete removeVehicle;
            (globalTicketNumber > 0) ? globalTicketNumber-- : 0;
            current = previous;
            
            cout << "All the vehicles retrieved. No more vehicles in Alley A" << endl;
            break;
        }
        else //else move the current to the next link
        {
            previous = current;
            current = current->linkVehicleBehind;
        }
    }
}


/**
 * Function: displayParked()
 * Purpose:
 *      Iterates through the link list and displays vehicles.
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      current: Points to current node.
 *      lastVehicle: Points to the last node in the link list
 *      frontVehicle: Points to the first node in the link list
 *      globalTicketNumber: increments the ticket number and assign to the member variable
**/
void Vehicle::displayParked()
{
    //change the current pointer to the vehicle in front
    current = frontVehicle;
    
    if (current == 0)
    {
        cout << "Alley A is empty. " << endl;
    }
    
    //while the current pointer is not at the end
    while (current != 0)
    {
        cout << "License Plate #: " << current << " Ticket: " << current->ticketNumber << endl;
        current = current->linkVehicleBehind;
    }
    
}

/**
 * Function: displayPrompt()
 * Purpose:
 *      Displays uer with a user input menu.
 * Parameters:
 *      No Pramater: NA
 * Class MemberVariable:
 *      current: Points to current node.
 *      lastVehicle: Points to the last node in the link list
 *      frontVehicle: Points to the first node in the link list
 *      globalTicketNumber: increments the ticket number and assign to the member variable
 **/
void Vehicle::displayPrompt()
{
    cout << USER_INSTRUCTION;
    
    while (cin >> userSelection || !cin.eof())
    {
        //changs lowercase user input to uppercase
        userSelection = toupper(userSelection);
        
        UserCommands commands = (UserCommands)userSelection;
        
        if (isalpha(commands) && cin.good())
        {
            switch (commands)
            {
                case DISPLAY:
                    //cout << "You chose: " << userSelection << endl;
                    displayParked();
                    break;
                case PARK:
                    //cout << "You chose: " << userSelection << endl;
                    parkNewVehicle();
                    break;
                case RETRIEVE:
                    
                    // if the global ticket number is decremented to 0, this means there are no more vehicles to retrieve
                    if (globalTicketNumber == 0)
                    {
                        cout << "All the vehicles retrieved. No more vehicles in Alley A" << endl;
                        break;
                    }
                    
                    cout << "Ticket No.: ";
                    int retrievalTicketNumber;
                    cin >> retrievalTicketNumber;
                    retrieveCar(retrievalTicketNumber);
                    
                    break;
                case QUIT:
                    cout << "Thank you and have you nice day !" << endl;
                    return;
                default:
                    cout << userSelection << " is not a valid optin. Let's try that. This time read carefully.\n";
                    break;
            }
        }
        else
        {
            cout << INVALID_INPUT;
            
        }
        
        //Clear any bad bits and data
        cin.clear();
        cin.ignore(numeric_limits<streamsize>::max(), '\n');
        
        cout << USER_INSTRUCTION;
        
    }
}

int main(int argc, const char * argv[])
{
    Vehicle parking;
    
    parking.displayPrompt();
    
    return 0;
}