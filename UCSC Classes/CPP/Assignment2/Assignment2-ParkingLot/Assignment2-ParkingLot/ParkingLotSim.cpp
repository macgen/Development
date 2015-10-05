//
//  main.cpp
//  Assignment2-ParkingLot
//
//  Created by James Kim on 9/30/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include <cctype>
#include <iomanip>
#include <limits>
#include <cstring>

using namespace std;

#define USER_INSTRUCTION "D)isplay   P)ark   R)etrieve   Q)uit\n"
#define INVALID_INPUT "\nInvalid Selection. Please try again\n."
#define VEHICLE_FOUND "Vehicle is located in Alley A."
#define VEHICLE_NOTFOUND "We were unable to locate your vehicle. You either came to the wrong place or we SOLD your car."

//enum for identifying user selection and actions
enum UserCommands
{
    DISPLAY='D',
    PARK='P',
    RETRIEVE='R',
    QUIT='Q'
};

//Every time a car is created... a new link is created...
// each car (link) will have a 1) ticketNumber



class Vehicle
{
    private:
        UserCommands commands;
        char userSelection; //ivar to hold the user selection
        void init();
        void parkNewVehicle();
        void displayParked();
        void retrieveCar(int tNumber);
    
        Vehicle *frontVehicle; //*frontVehicle;
        Vehicle *current; //*currentVehicle;
        Vehicle *lastVehicle; //*rearVehicle;
    
    public:
    
        Vehicle();
    
        unsigned int globalTicketNumber; //varibale to keep track of the ticket number
        unsigned int ticketNumber; // ticket number per vehicle
        Vehicle *linkVehicleBehind; //pointer to the car parked behind
    

    
        void displayPrompt(); //prompt the user with the instruction
};

Vehicle::Vehicle()
{
    current = 0;
    lastVehicle = current;
    frontVehicle = current;
    
    globalTicketNumber = 0;
}


void Vehicle::parkNewVehicle()
{
    // first if statement is only called when the very vehicle is created and ready to be parked
    // all subsequent vehicle will and should be hitting the else statement
    if (frontVehicle == 0)
    {
        //increment the overall ticket number
        globalTicketNumber++;
        
        //setting all pointers to the front, current and tail
        current = new Vehicle;
        frontVehicle = current;
        lastVehicle = current;
        
        current->ticketNumber = 1;
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
        current->ticketNumber = globalTicketNumber;
        current->linkVehicleBehind = 0;
        lastVehicle = current;
        
        // Output to alert the user with the ticket number that's being assigned
        cout << "Ticket No.: " << globalTicketNumber << endl;
    }
}

void Vehicle::retrieveCar(int tNumber)
{
    //reset the current pointer to point to the front of the vehicle
    current = frontVehicle;
    
    //iterate through all the link until it hits the end
    while (current != 0)
    {
        //if the passed in tNumber matches the current ticket number, you have found the vehicle
        if (tNumber == current->ticketNumber)
        {
            cout << VEHICLE_FOUND << " - License Plate #: " << current << " Ticket: " << current->ticketNumber << endl;;
            break;
        }
        else //else move the current to the next link
        {
            current = current->linkVehicleBehind;
        }
    }
    
    // if the current pointer has reached the end and nothing has found, please return the message
    if (current == 0)
    {
        cout << VEHICLE_NOTFOUND << endl;
    }
    
    
}

void Vehicle::displayParked()
{
    // check if no ticket was ever generated, if so, alert the caller
    if (globalTicketNumber == 0)
    {
        cout << "Currently Alley A is Empty." << endl;
    }
    else // this simply tells you how many cars are parked in Alley A.
    {
        cout << "You currently have " << globalTicketNumber << " vehicles parked in Alley A" << endl;
    }
    
    //change the current pointer to the vehicle in front
    current = frontVehicle;
    
    //while the current pointer is not at the end
    while (current != 0)
    {
        cout << "License Plate #: " << current << " Ticket: " << current->ticketNumber << endl;
        current = current->linkVehicleBehind;
    }
}

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