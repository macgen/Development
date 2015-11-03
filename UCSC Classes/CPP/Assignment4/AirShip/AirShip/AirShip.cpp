//
//  AirShip.cpp
//
//  Created by James Kim on 10/30/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include <fstream>
#include <iomanip>
#include <string>

using namespace std;

enum AIRSHIP_TYPE {AIRPLANE = 0, BALLOON = 1};  //AirShip Type
enum ENGINE_TYPE {JET = 0, PROPELLER = 1};      //Engine Type for Airplane Objects
enum GAS_TYPE {HELIUM = 0, HYDROGEN = 1};       //Gas Type for Balloon Objects

/************************************************************
 Function: DataMembers
 Purpose: Place holder to hold the data that's being read from the file
 Parameters: none
 Variables:
    type: int value to determine if its airplane or balloon
    name: name of the airplane or balloon
    maxPassemgers: number of passengers
    maxCargoWeight: maximum cargo weight
    gasType: either helium or hydrogen
    maxRange: maximum range
    maxAltitude: maximum altitude
 ************************************************************/
struct DataMembers
{
    int type;
    const char *name;
    int maxPassengers;
    double maxCargoWeight;
    int engineType;
    int gasType;
    double maxRange;
    double maxAltitude;
};


class AirShip
{
    public:
        void readFile(int argCount, const char *fileName);                      //Method to read in the file
        virtual void setData (DataMembers &data) = 0;                           //Setting the values
        virtual void showData() = 0;                                            //Display the data
        AIRSHIP_TYPE getAirShipType() { return (AIRSHIP_TYPE)airShipType; };    //Returns enum type

    private:
        const char *fileName;                                                   //File name passed in from the CLI argument
        int getNumberOfRecords(const char *fileName);                           //Number of records found in the file

    
    protected:
        int airShipType;                                                        //Type of AirShip object being held
        string name;                                                            //Name of the object
        int maxPassengers;                                                      //Max Passenger Counts
        double maxCargoWeight;                                                  //Max Cargo Weight
    
};

//Airplane Object
class Airplane : public AirShip
{
    public:
        Airplane() : AirShip() {}                                               //Default constructor
        void setData (DataMembers &data);                                       //Implementation of setData method from the baseclass
        void showData();                                                        //Implementaiton of showData method from the baseclass
        const char* getType(ENGINE_TYPE type);                                  //Returns the engine type from the enum
    protected:
        int engineType;                                                         //iVar to hold engine type info
        double maxRange;                                                        //iVar to hold the max range
    
};

//Balloon Object
class Balloon : public AirShip
{
    public:
        Balloon() : AirShip() {}                                                //Default constructor
        void setData (DataMembers &data);                                       //Implementation of setData method from the baseclass
        void showData();                                                        //Implementaiton of showData method from the baseclass
        const char* getType(GAS_TYPE type);                                     //Returns the gas type from the enum
    protected:
        int gasType;                                                            //iVar to hold the gas type
        double maxAltitude;                                                     //iVar to hold the maximum altitude
    

};


/************************************************************
 Function: setData (DataMembers &data)
 Purpose: Holds the data thats read from the database
 Parameters: DataMembers-enum
 Variables:
     name: name of the airplane or balloon
     maxPassemgers: number of passengers
     maxCargoWeight: maximum cargo weight
     gasType: either helium or hydrogen
     maxRange: maximum range
     maxAltitude: maximum altitude
 ************************************************************/
void Airplane::setData (DataMembers &data)
{
    
    name = data.name;
    maxPassengers = data.maxPassengers;
    maxCargoWeight = data.maxCargoWeight;
    maxRange = data.maxRange;
    airShipType = AIRSHIP_TYPE(data.type);
    engineType = ENGINE_TYPE(data.engineType);
}

/************************************************************
 Function: showData()
 Purpose: Displays the data that's being held in the object
 Parameters: none
 Variables: none
************************************************************/
void Airplane::showData()
{
    cout << left << setw(20) << name;
    cout << left << setw(20) << getType(ENGINE_TYPE(engineType));
    cout << left << setw(20) << maxRange;
}

/************************************************************
 Function: setData (DataMembers &data)
 Purpose: Holds the data thats read from the database
 Parameters: DataMembers-enum
 Variables:
 name: name of the airplane or balloon
 maxPassemgers: number of passengers
 maxCargoWeight: maximum cargo weight
 gasType: either helium or hydrogen
 maxRange: maximum range
 maxAltitude: maximum altitude
 ************************************************************/
void Balloon::setData (DataMembers &data)
{
    name = data.name;
    maxPassengers = data.maxPassengers;
    maxCargoWeight = data.maxCargoWeight;
    maxAltitude = data.maxAltitude;
    airShipType = AIRSHIP_TYPE(data.type);
    gasType = GAS_TYPE(data.gasType);
}

/************************************************************
 Function: showData()
 Purpose: Displays the data that's being held in the object
 Parameters: none
 Variables: none
 ************************************************************/
void Balloon::showData()
{
    cout << left << setw(20) << name;
    cout << left << setw(20) << getType(GAS_TYPE(gasType));
    cout << left << setw(20) << maxAltitude;
}

/************************************************************
 Function: getType(ENGINE_TYPE type)
 Purpose: Determines what type of engine
 Parameters: ENGINE_TYPE type
 Variables: none
 ************************************************************/
const char* Airplane::getType(ENGINE_TYPE type)
{
    switch (type)
    {
        case JET:
            return "Jet";
            break;
        case PROPELLER:
            return "Propeller";
            break;
        default:
            return "No Type";
            break;
    }
    
}

/************************************************************
 Function: getType(GAS_TYPE type)
 Purpose: Determines what type of engine
 Parameters: GAS_TYPE type
 Variables: none
 ************************************************************/
const char* Balloon::getType(GAS_TYPE type)
{
    switch (type)
    {
        case HELIUM:
            return "Helium";
            break;
        case HYDROGEN:
            return "Hydrogen";
            break;
        default:
            return "No Type";
            break;
    }
    
}


/************************************************************
 Function: getNumberOfRecords(const char *fileName)
 Purpose: Opens the file with the fileName that's passed in
 Parameters: fileName
 Variables:
    inputFile: file object
    tokenRead: token that's read in from the file
    numberOfRecords: number of lines found in the file
 ************************************************************/
int AirShip::getNumberOfRecords(const char *fileName)
{
    //create the input stream
    ifstream inputFile(fileName);
    
    //check if the file is open
    if (!inputFile)
    {
        cout << "Can't open the input file !." << endl;
        
        exit(1);
    }
    
    char tokenRead[100];    //this is used to read in the value
    
    //initialize a value for line count
    int numberOfRecords = 0;
    
    //iterate through each reacord and find out how many lines of records you have
    while (inputFile.getline(tokenRead, 100))
    {
        //DEBUG - Prints out total number of records
        //cout << numberOfRecords << ": " << tokenRead << endl;
        numberOfRecords++;
    }
    
    cout << "Total Records in File: " << numberOfRecords << endl;
    
    return numberOfRecords;
    
}

/************************************************************
 Function: readFile(int argCount, const char *fileName)
 Purpose: Opens the file
 Parameters: 
    argCount: argument count from the main mneu
    fileName: fileName
 Variables:
     inputFile: file object
     tokenRead: token that's read in from the file
     numberOfRecords: number of lines found in the file
 ************************************************************/
void AirShip::readFile(int argCount, const char *fileName)
{
    if (argCount != 2)
    {
        cout << "Input file was not specified. " << endl;
        cout << "$> AirShip fileName" << endl;
        
        exit(1);
    }
    
    fileName = fileName;
    
    //create the input stream
    ifstream inputFile(fileName);
    
    //check if the file is open
    if (!inputFile)
    {
        cout << "Can't open the input file !." << endl;
        
        exit(1);
    }
    
    char tokenRead[100];    //this is used to read in the value
    char d[] = ",";         //this is used to delimit by commas
    
    //initialize a value for line count
    int numberOfRecords = getNumberOfRecords(fileName);
    
    //create an array of AirShips according to the records found in the file
    AirShip *ships[numberOfRecords];
    
    //variable to hold the array element
    int count = 0;
    
    while(inputFile.getline(tokenRead, 100) && !inputFile.eof())
    {
        //enum to determine the AirShip type
        //AIRSHIP_TYPE airshipType;
        
        //determine the AirShip type by the first value in the file
        //airshipType = (AIRSHIP_TYPE)atoi(strtok(tokenRead, d));
        
        struct DataMembers data;
        
        data.type = atoi(strtok(tokenRead, d));
        
        switch (data.type)
        {
            case AIRPLANE:
                //cout << "Fucking AirAplane !!!" << endl;
                ships[count] = new Airplane();
                //data.type = atoi(strtok(tokenRead, d));
                data.name = strtok(NULL, d);
                data.maxPassengers = atoi(strtok(NULL, d));
                data.maxCargoWeight = atof(strtok(NULL, d));
                data.engineType = atoi(strtok(NULL, d));
                data.maxRange = stof(strtok(NULL, d));
                break;
            case BALLOON:
                //cout << "Fucking Baloon !!!" << endl;
                
                ships[count] = new Balloon();
                //data.type = atoi(strtok(tokenRead, d));
                data.name = strtok(NULL, d);
                data.maxPassengers = atoi(strtok(NULL, d));
                data.maxCargoWeight = atof(strtok(NULL, d));
                data.gasType = atoi(strtok(NULL, d));
                data.maxAltitude = stof(strtok(NULL, d));
                break;
            default:
                break;
        }
        

        
        ships[count]->setData(data);
        count++;
        memset(tokenRead, '\0', 100);
        
       }
    
    //print the Airplane Data
    cout << "Listing of all Airplanes" << endl;
    cout << left << setw(20) << "Name" << left << setw(20) << "Engine Type" << left << setw(10) << "Maximum Range" << endl;
    cout << "===============================================================" << endl;
    for (int i = 0; i < numberOfRecords;i++)
    {
        if (ships[i]->getAirShipType() == AIRPLANE)
        {
            ships[i]->showData();
            cout << "\n";
        }
    }
    
    cout << "\n";
    
    //print the Balloon Data
    cout << "Listing of all Balloons" << endl;
    cout << left << setw(20) << "Name" << left << setw(20) << "Gas Type" << left << setw(10) << "Maximum Altitude" << endl;
    cout << "===============================================================" << endl;
    for (int i = 0; i < numberOfRecords;i++)
    {
        if (ships[i]->getAirShipType() == BALLOON)
        {
            ships[i]->showData();
            cout << "\n";
        }
    }
}


int main(int argc, const char * argv[])
{
    AirShip *myShip;
    myShip->readFile(argc, argv[1]);
    
    
    
    
    
    return 0;
}
