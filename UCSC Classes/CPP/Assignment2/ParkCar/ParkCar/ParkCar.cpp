//
//
//  ParkCar.cpp
//
//  Created by James Kim on 9/30/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//
//  OS: Mac OS X 10.11
//  Compiler: LLVM
//  IDE: XCode

#include <iostream>

using namespace std;

#define USER_INSTRUCTION "D)isplay   P)ark   R)etrieve   Q)uit\n"
#define INVALID_INPUT "\nInvalid Selection. Please try again\n."
#define VEHICLE_FOUND "Retrieving Vehicle with License Plate #: "
#define VEHICLE_NOTFOUND "We were unable to locate your vehicle. You either came to the wrong place or we SOLD your car."
#define MAX_SIZE 5

//enum for identifying user selection and actions
enum Selections
{
    DISPLAY='D',
    PARK='P',
    RETRIEVE='R',
    QUIT='Q'
};

class Car
{
    public:
        Car(int tNumber, Car *nextCar); //default constructor
        Car();
        
        //what's the next car ?
        //What's the car before me ?
        
        void setLinkToNextCar(Car *car);
        Car* getLinkToNextCar();
        
        void setAssignedTicketNumber(int tNumber);
        int getAssignedTicketNumber();
        
        
        
    private:
        unsigned int assignedTicketNumber;
        Car *linkToTheCarParkedBehind;
};

class Parking
{
    public:
    
        Parking();
    
        void userPrompt();
    
        Car* getNewCar();
        void parkNewCar();//park a new car
        void retrieveCar(int tNumber); //retrieve a car with this ticket number
        void displayAllCars();//show me all the cars
        //is the parking log full?
        //move the car from AlleyA to AlleyB
    
        int getNewTicketNumber();
        int getCurrentTicketNumber(); //this simply increments the ticket number to the next
    
    private:
    
        Car *carInFront; // vehicle on the very bottom of the stack
        Car *previousToCurrentCar; // vehicle that WAS current before
        Car *currentCar; // vehicle that ptr is currently pointing to
        Car *lastCar; // vehicle at the very top of the stack
        Car *removeThisCar; //vehicle node for removal
    
        char userSelection; //variable to determine what user has selected
        Selections selection; //variable for enum of Selection
    
        static unsigned int totalTicketIssued;
    
        bool isLotFull(); //check if the lot is full
    
        //helper & debugging utilty
        void carDescription(Car *ka);
        void currentPointerStatus();

    
};

//static variable to hold the ticketNumber
unsigned int Parking::totalTicketIssued = 1;

/**
 * Function: Car()
 * Purpose: Default constructor
 * Parameters: NA
 * Class MemberVariable: 
            assignedTicketNumber; default value to 0
            linkToTheCarParkedBehind; default value to null
 **/
Car::Car(): assignedTicketNumber(0), linkToTheCarParkedBehind(0)
{
    assignedTicketNumber = 0;
    linkToTheCarParkedBehind = 0;
}

/**
 * Function: setAssignedTicketNumber
 * Purpose: setter method for assignedTicketNumber
 * Parameters:
            tNumber: int value to set the value
 * Class MemberVariable:
            assignedTicketNumber; setting value to the passed in parameter
 **/
void Car::setAssignedTicketNumber(int tNumber)
{
    assignedTicketNumber = tNumber;
}

/**
 * Function: getAssignedTicketNumber
 * Purpose: getter method for assignedTicketNumber
 * Parameters:
         tNumber: int value to set the value
 * Class MemberVariable: NA
 **/
int Car::getAssignedTicketNumber()
{
    return assignedTicketNumber;
}

/**
 * Function: setLinkToNextCar
 * Purpose: setter method for setLinkToNextCar
 * Parameters:
         car: pointer value to car object
 * Class MemberVariable: NA
 **/
void Car::setLinkToNextCar(Car *car)
{
    linkToTheCarParkedBehind = car;
}

/**
 * Function: getLinkToNextCar
 * Purpose: getter method for setLinkToNextCar
 * Parameters:
         car: pointer value to car object
 * Class MemberVariable: NA
 **/
Car* Car::getLinkToNextCar()
{
    return linkToTheCarParkedBehind;
}

/**
 * Function: Parking()
 * Purpose: default constructor for the Parking class.
 * Parameters: NA
 * Class MemberVariable: 
        carInFront, previousToCurrentCar, currentCar, removeThisCar
 **/
Parking::Parking()
{
    carInFront = 0;
    previousToCurrentCar = 0;
    currentCar = 0;
    lastCar = 0;
    removeThisCar = 0;
}

/**
 * Function: carDescrition(Car *ka)
 * Purpose: Debug Logging
 * Parameters: Car Object
 * Class MemberVariable: NA
 **/
void Parking::carDescription(Car *ka)
{
    cout << "Car License Plate: " << ka << endl;
    cout << " - - - - - tNumber: " << ka->getAssignedTicketNumber() << endl;
    cout << " - - - - - nextCarLinkAddress: " << ka->getLinkToNextCar() << endl;
}

/**
 * Function: currentPointerStatus()
 * Purpose: Debug Logging
 * Parameters: No Pramater: NA
 * Class MemberVariable: NA
 **/
void Parking::currentPointerStatus()
{
    cout << "Car In Front: " << carInFront << endl;
    cout << "Car In Front ---> " << carInFront->getLinkToNextCar() << endl;
    cout << "Current Car: " << currentCar << endl;
    cout << "Current Car ---> " << currentCar->getLinkToNextCar() << endl;
    cout << "Last Car: " << lastCar << endl;
    cout << "Last Car ---> " << lastCar->getLinkToNextCar() << endl;

}

/**
 * Function: isLotFull()
 * Purpose: Iterates through all the nodes and checks if its the max
 * Parameters: No Pramater: NA
 * Class MemberVariable: NA
 **/
bool Parking::isLotFull()
{
    currentCar = carInFront;
    
    int totalCount = 1;
    
    while(currentCar != 0)
    {
        totalCount++;
        currentCar = currentCar->getLinkToNextCar();
    }
    
    return (totalCount > MAX_SIZE) ? true : false;
}



/**
 * Function: getNewCar()
 * Purpose: Instantiate a new car object and returns to the caller
 * Parameters: No Pramater: NA
 * Return:
 *          newCar - instance of a new car object
 * Class MemberVariable: NA
 **/
Car* Parking::getNewCar()
{
    Car *newCar = new Car;
    
    //DEBUG - please remove
    //carDescrition(newCar);
    
    return newCar;
}

/**
 * Function: retrieveCar(int tNumber)
 * Purpose: Iterate through each node and search for the car with the ticketnumber
 * Parameters: tNumber - integer value that represents the ticket number
 * Class MemberVariable:
 *          carInFront - equivalent to headPointer
 *          currentCar - equivalent to currentPointer
 *          lastCar - equivalent to tailPointer
 *          previousToCurrentCar - equivalent to previous (holds the pointer to the one node prior to current being changed)
 **/
void Parking::retrieveCar(int tNumber)
{
    //change the pointer to the top
    currentCar = carInFront;
    
    //iterate through the node until current reaches the end
    while (currentCar != 0)
    {
        //first car...
        if (carInFront == currentCar && tNumber == currentCar->getAssignedTicketNumber())
        {
            cout << VEHICLE_FOUND << currentCar << " with ticket #: " << tNumber << endl;
            removeThisCar = currentCar;
            currentCar = currentCar->getLinkToNextCar();
            delete removeThisCar;
            //setting the new front car
            carInFront = currentCar;
            break;
        }
        //end of the node car....
        else if(currentCar->getLinkToNextCar() == 0)
        {
            cout << VEHICLE_FOUND << currentCar << " with ticket #: " << tNumber << endl;
            removeThisCar = currentCar;
            previousToCurrentCar->setLinkToNextCar(0);
            currentCar = previousToCurrentCar;
            delete removeThisCar;
            //setting the last car
            lastCar = currentCar;
            break;
        }
        else if (carInFront == currentCar && lastCar == currentCar && currentCar->getLinkToNextCar() == 0)
        {
            cout << VEHICLE_FOUND << currentCar << " with ticket #: " << tNumber << endl;
            break;
        }
        
        else if (currentCar->getAssignedTicketNumber() == tNumber)
        {
            cout << VEHICLE_FOUND << currentCar << " with ticket #: " << tNumber << endl;
            removeThisCar = currentCar;
            currentCar = currentCar->getLinkToNextCar();
            delete removeThisCar;
            previousToCurrentCar->setLinkToNextCar(currentCar);
            
            break;
        }
        else
        {
            previousToCurrentCar = currentCar;
            currentCar = currentCar->getLinkToNextCar();
        }
        
    }
}

/**
 * Function: parkNewCar()
 * Purpose: Instantiate a new car object and link the node
 * Parameters: No Pramater: NA
 * Class MemberVariable:
 *          carInFront - equivalent to headPointer
 *          currentCar - equivalent to currentPointer
 *          lastCar - equivalent to tailPointer
 *          previousToCurrentCar - equivalent to previous (holds the pointer to the one node prior to current being changed)
 **/
void Parking::parkNewCar()
{
    Car *newCarSmellyCar = getNewCar();
    
    // deal with the very first car...
    if (carInFront == 0 && previousToCurrentCar == 0 && currentCar == 0 && lastCar == 0)
    {
        carInFront = newCarSmellyCar;
        previousToCurrentCar = newCarSmellyCar;
        currentCar = newCarSmellyCar;
        currentCar->setAssignedTicketNumber(getNewTicketNumber());
        currentCar->setLinkToNextCar(0);
        lastCar = newCarSmellyCar;
        
        cout << "License Plate #: " << currentCar << " Ticket #: " << currentCar->getAssignedTicketNumber() << " PARKED" << endl;
        //DEBUG
        //currentPointerStatus();
    }
    else if (!isLotFull())
    {
        lastCar->setLinkToNextCar(newCarSmellyCar);
        previousToCurrentCar = currentCar;
        currentCar = lastCar->getLinkToNextCar();
        currentCar->setAssignedTicketNumber(getNewTicketNumber());
        lastCar = currentCar;
        
        cout << "License Plate #: " << currentCar << " Ticket #: " << currentCar->getAssignedTicketNumber() << " PARKED" << endl;
        
        //DEBUG
        //currentPointerStatus();
    }
    else
    {
        cout << "PARKING LOT IS FULL !" << endl;
    }
    
}

/**
 * Function: getNewTicketNumber()
 * Purpose: Increments the static ticketnumber variable for the next number
 * Parameters: No Pramater: NA
 * Return: next available ticket number
 * Class MemberVariable: NA
 **/
int Parking::getNewTicketNumber()
{
    return totalTicketIssued++;
}

/**
 * Function: getCurrentTicketNumber()
 * Purpose: Retrieves the current ticket number
 * Parameters: No Pramater: NA
 * Class MemberVariable: NA
 **/
int Parking::getCurrentTicketNumber()
{
    return totalTicketIssued;
}


/**
 * Function: userPrompt()
 * Purpose: Displays user with the selection options
 * Parameters: No Pramater: NA
 * Class MemberVariable: 
 *          userSelection - user choosing from the selection
 **/
void Parking::userPrompt()
{
    //display the options to the user
    cout << USER_INSTRUCTION;
    
    //run this until user either quits or it reaches eof
    while (cin >> userSelection || !cin.eof())
    {
        //changs lowercase user input to uppercase
        userSelection = toupper(userSelection);
        
        //match up user selection to the enum of commands
        Selections commands = (Selections)userSelection;
        
        if (isalpha(commands) && cin.good())
        {
            //switch to the user selection
            switch (commands)
            {
                case DISPLAY: //prints out the parked cars...
                    displayAllCars();
                    break;
                    
                case PARK://park a new car
                    parkNewCar();
                    break;
                    
                    //retrieve a specific car with the ticket number
                case RETRIEVE:
                    
                    // if the global ticket number is decremented to 0, this means there are no more vehicles to retrieve
//                    if (globalTicketNumber == 0)
//                    {
//                        cout << "All the vehicles retrieved. No more vehicles in Alley A" << endl;
//                        break;
//                    }
//                    
                    cout << "Ticket No.: ";
                    int retrievalTicketNumber;
                    cin >> retrievalTicketNumber;
                    retrieveCar(retrievalTicketNumber);
                    
                    break;
                    
                    //user decides to quit the program
                case QUIT:
                    cout << "Thank you and have you nice day !" << endl;
                    return;
                    
                    //when user types in anything other than the ones on the options list
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

/**
 * Function: displayAllCars()
 * Purpose: Interates through all the nodes and prints out the memory address and the ticket number
 * Parameters: No Pramater: NA
 * Class MemberVariable: NA
 **/
void Parking::displayAllCars()
{
    currentCar = carInFront;
    
    while(currentCar != 0)
    {
        cout << "License Plate #: " << currentCar << " Ticket #: " << currentCar->getAssignedTicketNumber() << endl;
        //cout << "---->Linked Car: " << currentCar->getLinkToNextCar() << endl;
        
        currentCar = currentCar->getLinkToNextCar();
    }
}

int main(int argc, const char * argv[])
{
    Parking *newAlley = new Parking;
    newAlley->userPrompt();
    
    return 0;
}
