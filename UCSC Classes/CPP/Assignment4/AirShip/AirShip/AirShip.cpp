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

enum AIRSHIP_TYPE {AIRPLANE = 0, BALLOON = 1};
enum ENGINE_TYPE {JET = 0, PROPELLER = 1};
enum GAS_TYPE {HELIUM = 0, HYDROGEN = 1};

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
        void readFile(int argCount, const char *fileName);
        virtual void setData (DataMembers &data) = 0;
        virtual void showData() = 0;
        void displayData(AirShip &data);
        AIRSHIP_TYPE getAirShipType() { return (AIRSHIP_TYPE)airShipType; };

    private:
        const char *fileName;
        int getNumberOfRecords(const char *fileName);

    
    protected:
        int airShipType;
        string name;
        int maxPassengers;
        double maxCargoWeight;
    
};

class Airplane : public AirShip
{
    public:
        Airplane() : AirShip() {}
        void setData (DataMembers &data);
        void showData();
        const char* getType(ENGINE_TYPE type);
    protected:
        int engineType;
        double maxRange;
    
};

class Balloon : public AirShip
{
    public:
        Balloon() : AirShip() {}
        void setData (DataMembers &data);
        void showData();
    const char* getType(GAS_TYPE type);
    protected:
        int gasType;
        double maxAltitude;
    

};



void Airplane::setData (DataMembers &data)
{
    
    name = data.name;
    maxPassengers = data.maxPassengers;
    maxCargoWeight = data.maxCargoWeight;
    maxRange = data.maxRange;
    airShipType = AIRSHIP_TYPE(data.type);
    engineType = ENGINE_TYPE(data.engineType);
}

void Airplane::showData()
{
    cout << left << setw(20) << name;
    cout << left << setw(20) << getType(ENGINE_TYPE(engineType));
    cout << left << setw(20) << maxRange;
}


void Balloon::setData (DataMembers &data)
{
    name = data.name;
    maxPassengers = data.maxPassengers;
    maxCargoWeight = data.maxCargoWeight;
    maxAltitude = data.maxAltitude;
    airShipType = AIRSHIP_TYPE(data.type);
    gasType = GAS_TYPE(data.gasType);
}

void Balloon::showData()
{
    cout << left << setw(20) << name;
    cout << left << setw(20) << getType(GAS_TYPE(gasType));
    cout << left << setw(20) << maxAltitude;
}

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



// File Utility Method
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
    
    //print the Airplane Data
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
