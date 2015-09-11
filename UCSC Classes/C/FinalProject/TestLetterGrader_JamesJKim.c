//
//  Program Name: TestLetterGrader_JamesJKIm
//
//  Created by James J. Kim on 1/31/2015.
//  School: UCSC
//  Class: C Programmers for Beginners


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//Struct to hold the student elements...
typedef struct
{
    char studentName[50];
    float scores[7];
    float gpa;
    char *letterGrade;
    
} Student;

//Struct to hold the class average of students' grades...
typedef struct
{
    float average[7];
    float minScore[7];
    float maxScore[7];
    
} ClassGrade;



//************************ Function Protocols ************************//
void inputCheck(char * argv[]);
void printHelp();
FILE *openFile(char *fileName);
void generateOutputFile(char *outputFileName, char *inputFileName, Student *listOfStudents, int numberOfStudents);
void closeFile(FILE *file);

Student *createStudents(Student *students, int numberOfStudents);
void fillStudentRecord(FILE *file, Student *students, int numberOfStudents);
void getGPA(Student *students, int numberOfStudents);
void getGrade(Student *students, int numberOfStudents);
int getRecordCount(char *inputFileName);
void printAllStudents(Student *students, ClassGrade *classGrade, int numberOfStudents, char *inputFileName, char *outputFileName);

void getScoreAverage(Student *students, ClassGrade *classGrade, int numberOfStudents);
void getMinScore(Student *students, ClassGrade *classGrade, int numberOfStudents);
void getMaxScore(Student *students, ClassGrade *classGrade, int numberOfStudents);
//int compare(const void *first, const void *second);
void sortStudents(Student students[], int numberOfStudents);


//************************ Function Definitions ************************//

/**
 @desc checks to make sure that there is an inputfile and an outputfile provided
 @param char *argv[] - list of command line arguments
 @return - none
 **/
void inputCheck(char * argv[])
{
    if (*(argv + 1) == NULL || *(argv + 2) == 0)
    {
        printf("\n\nMissing the one of the file arguments\nPlease read the instruction below: \n");
        printHelp();
    }
    
}

/**
 @desc prints instruction on how to use the program
 @return - none
 **/
void printHelp()
{
    printf("\n-How to use the Test Letter Grader\n");
    printf("--- Please provide 2 command line argument separated by space\n");
    printf("--- $ compiledFileName yourInputFileName.txt yourOutputFileName.txt \n\n");
    exit(1);
}

/**
 @desc Opens the input file
 @param char* - name of the file you wish to open
 @return - none
 **/
FILE *openFile(char *fileName)
{
    FILE *inputFile = (FILE *) malloc(sizeof fileName);
    
    if ((inputFile = fopen(fileName, "r")) == NULL)
    {
        printf("\nERROR: Unable to open \"%s\". Please check your input file.\n\n", fileName);
        exit(1);
    }
    
    return inputFile;
}


/**
 @desc Creates an output file for the results to be printed to.
 @param char *outputFileName - name of the output file
 @param char *inputFileName - name of the input file
 @param Student *listOfStudents - array of Student elements inside an array
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void generateOutputFile(char *outputFileName, char *inputFileName, Student *listOfStudents, int numberOfStudents)
{
    FILE *outputFile = (FILE *) malloc(sizeof outputFileName);
    
    if ((outputFile = fopen(outputFileName, "w")) == NULL)
        {
            printf("\nERROR: Unable to create the file \"%s\". Please check your output file.\n\n", outputFileName);
            exit(1);
        }
    
    fprintf(outputFile, "Letter grade for %d students given in %s\n", numberOfStudents, inputFileName);
    for (int i = 0; i < numberOfStudents; i++)
    {
        fprintf(outputFile, "\n%15s:", (listOfStudents + i)->studentName);
        fprintf(outputFile, "  %s", (listOfStudents + i)->letterGrade);
    }
    
    printf("\n");
    
    closeFile(outputFile);
}

/**
 @desc Closes a open file resource
 @param FILE *file - file to be closed
 @return - none
 **/
void closeFile(FILE *file)
{
    fclose(file);
}

/**
 @desc Opens the input file and determines the number of lines by reading the \n and determine the number of records
 @param char *inputFileName - name of the output file
 @return int - returns the number of records from an input file
 **/
int getRecordCount(char *inputFileName)
{
    //Start count from 1 because when endChar hits EOF, it wont increment the last record...
    int recordCount = 1;
    
    //iterates through all the chars in the file and identifies all the '\n' for getting the number of records...
    char eachChar;
    
    //Capturing the maximum character count per each line of record...
    int maxLineCount = 0;
    int nowLineCount = 0;
    
    FILE *file = openFile(inputFileName);
    
    //iterate through each characters and once it reaches \n, it will increment the count...
    while ((eachChar = fgetc(file)) != EOF)
    {
        nowLineCount++;
        
        if (eachChar == '\n')
        {
            recordCount++;
            
            if (nowLineCount > maxLineCount)
            {
                maxLineCount = nowLineCount;
            }
            
            nowLineCount = 0;
        }
    }
    
    closeFile(file);

    return recordCount;
}


/**
 @desc fills the array of students and use the studentName properties
 @param File *file - name of the file to read the data from
 @param Student *listOfStudents - array of Student elements inside an array
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void fillStudentRecord(FILE *file, Student *students, int numberOfStudents)
{
    char line[200];
    char *token;
    const char *comma = ",";
    //float *testScore;
    
    
    for (int i = 0; i < numberOfStudents; i++)
    {
        fgets(line, sizeof line, file);
        token = strtok(line, comma);
        
        
        if (token == NULL || *token == '\n')
        {
            continue;
        }
        
        strcpy((students + i)->studentName, token);
        //printf("%s", token);
        
        
        
        for (int j = 0; j < 7; j++)
        {
            token = strtok(NULL, comma);
            (students + i)->scores[j] = atof(token);
        }
    }
}

/**
 @desc Creates number of student struct by the number of records found from the input file
 @param Student *listOfStudents - array of Student elements inside an array
 @param int numberOfStudents - number of students from the input file
 @return Student * - returns a Student * after it is created
 **/
Student *createStudents(Student *students, int numberOfStudents)
{
    //students[numberOfStudents];
    Student *student;
    
    for (int i = 0; i < numberOfStudents; i++)
    {
        students[i] = *(Student *) malloc((sizeof student) * 200);
    }
    
    return students;
}

/**
 @desc Prints all the individual properties from each student struct
 @param Student *listOfStudents - array of Student elements inside an array
 @param Student *classGrade - ClassGrade struct
 @param char *outputFileName - name of the output file
 @param char *inputFileName - name of the input file
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void printAllStudents(Student *students, ClassGrade *classGrade, int numberOfStudents, char *inputFileName, char *outputFileName)
{
    //DEBUG - Prints all student's names from the array
//    printf("Letter grade for %d students given in %s\n", numberOfStudents, inputFileName);
//    for (int i = 0; i < numberOfStudents; i++)
//    {
//        printf("\n%15s:", (students + i)->studentName);
//        printf("  %s", (students + i)->letterGrade);
//    }
//    printf("\n\n");
    
    printf("Letter grade has been calculated for students listed in input file \"%s\" and written to output file \"%s\".\nHere is the class average:\n", inputFileName, outputFileName);
    
    // Formating the Output
    printf("%21s  %14s %14s %15s %17s %15s %15s", "Q1", "Q2", "Q3", "Q4", "MidI", "MidII", "Final");
    printf ("\n\nAverage: ");
    for (int i=0; i < 7; i++)
    {
        printf("%8s", "");
        printf("%6.2f\t", (classGrade->average[i]));
    }
    
    printf ("\nMinimum: ");
    for (int i=0; i < 7; i++)
    {
        printf("%8s", "");
        printf("%6.2f\t", (classGrade->minScore[i]));
    }
    
    printf ("\nMaximum: ");
    for (int i=0; i < 7; i++)
    {
        printf("%8s", "");
        printf("%6.2f\t", (classGrade->maxScore[i]));
    }
    
    printf("\n\n");
    
}

/**
 @desc iterates through each student struct and determine their gpa. Once calculated, their gpa is recorded
 @param Student *listOfStudents - array of Student elements inside an array
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void getGPA(Student *students, int numberOfStudents)
{
    for (int i = 0; i < numberOfStudents; i++)
    {
        (students + i)->gpa = ((students + i)->scores[0] * .10) + ((students + i)->scores[1] * .10) + ((students + i)->scores[2] * .10) + ((students + i)->scores[3] * .10) + ((students + i)->scores[4] * .20) + ((students + i)->scores[5] * .15) + ((students + i)->scores[6] * .25);
    }
}

/**
 @desc iterates through each student struct and determine their grade. Once calculated, their grade is recorded
 @param Student *listOfStudents - array of Student elements inside an array
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void getGrade(Student *students, int numberOfStudents)
{
    for (int i = 0; i < numberOfStudents; i++)
    {
        float gpa = ((students + i)->gpa);
        
        if (gpa >= 90.00)
        {
            //strcpy((students + i)->letterGrade, "A");
            (students + i)->letterGrade = "A";
        }
        else if(gpa > 80.00)
        {
            //strcpy((students + i)->letterGrade, "B");
            (students + i)->letterGrade = "B";
        }
        else if(gpa > 70.00)
        {
            //strcpy((students + i)->letterGrade, "C");
            (students + i)->letterGrade = "C";
        }
        else if(gpa > 60.00)
        {
            //strcpy((students + i)->letterGrade, "D");
            (students + i)->letterGrade = "D";
        }
        else
        {
            //strcpy((students + i)->letterGrade, "F");
            (students + i)->letterGrade = "F";
        }
        
       
    }
    
}


/**
 @desc iterates through each student struct and determine the class score average. Once calculated, the average is recorded in the ClassGrade struct
 @param Student *listOfStudents - array of Student elements inside an array
 @param ClassGrade *classGrade - ClassGrade struct that holds the data
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void getScoreAverage(Student *students, ClassGrade *classGrade, int numberOfStudents)
{
    float average = 0.0;
    float tempTotal = 0.0;
    
    for (int i = 0; i < 7; i++)
    {
        for (int j = 0; j < numberOfStudents; j++)
        {
            tempTotal += (students + j)->scores[i];
        }

        average = tempTotal / numberOfStudents;
        classGrade->average[i] = average;
        
        average = 0.0;
        tempTotal = 0.0;

    }
    
}

/**
 @desc iterates through each student struct and determine the class minimum score. Once calculated, the minimum score is recorded in the ClassGrade struct
 @param Student *listOfStudents - array of Student elements inside an array
 @param ClassGrade *classGrade - ClassGrade struct that holds the data
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void getMinScore(Student *students, ClassGrade *classGrade, int numberOfStudents)
{
    for (int i = 0; i < 7; i++)
    {
        //Highest score you can get...
        float min = 100.0;
        
        //Iterate through all the 7 test scores for each student...
        for (int j = 0; j < numberOfStudents; j++)
        {
            if ((students + j)->scores[i] < min)
            {
                min = (students + j)->scores[i];
            }
            
            classGrade->minScore[i] = min;
        }
    }
    
}

/**
 @desc iterates through each student struct and determine the class max score. Once calculated, the max score is recorded in the ClassGrade struct
 @param Student *listOfStudents - array of Student elements inside an array
 @param ClassGrade *classGrade - ClassGrade struct that holds the data
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void getMaxScore(Student *students, ClassGrade *classGrade, int numberOfStudents)
{
    for (int i = 0; i < 7; i++)
    {
        //Lowest score you can get...
        float max = 0.0;
        
        //Iterate through all the 7 test scores for each student...
        for (int j = 0; j < numberOfStudents; j++)
        {
            if ((students + j)->scores[i] > max)
            {
                max = (students + j)->scores[i];
            }
            
            classGrade->maxScore[i] = max;
        }
    }
    
}

/**
 @desc iterates through all students in the array and sorts it by student's name
 @param Student *listOfStudents - array of Student elements inside an array
 @param int numberOfStudents - number of students from the input file
 @return - none
 **/
void sortStudents(Student *students, int numberOfStudents)
{
    Student tempStudent;
    int i;
    int j;
    
    for ( i = 0; i < numberOfStudents; i++)
    {
        for ( j = i + 1; j < numberOfStudents; j++)
        {
            if ( strcmp(((students + i)->studentName), ((students + j)->studentName)) > 0)
            {
                tempStudent = students[i];
                students[i] = students[j];
                students[j] = tempStudent;
            }
        }
        
    }

}

int main(int argc, char * argv[])
{
    //checks to make sure that there are 2 arguments - one for input and output
    inputCheck(argv);
    
    //Get the input file name...
    char *inputFileName = *(argv + 1);
    char *outputFileName = *(argv + 2);
    
    //Find out how many students are on the input file...
    int numberOfStudents = getRecordCount(inputFileName);
    
    //Create the number of students depending on the record count...
    Student listOfStudents[numberOfStudents];
    createStudents(listOfStudents, numberOfStudents);
    
    //Read the data of the input file...
    FILE *myFile = openFile(inputFileName);
    
    //Fill out all the student's info...
    fillStudentRecord(myFile, listOfStudents, numberOfStudents);
    
    //sortStudents using the array of student struct
    sortStudents(listOfStudents, numberOfStudents);
    
    //Calculate each student's GPA and recorded in the structure...
    getGPA(listOfStudents, numberOfStudents);
    
    //Calculate each student's Letter Grade and record in the structure...
    getGrade(listOfStudents, numberOfStudents);
    
    //Create ClassGrade structure pointer...
    ClassGrade *classGrade;
    classGrade = (ClassGrade *)malloc((sizeof classGrade) * 20);
    
    //Call functions to calculate the scores...
    getScoreAverage(listOfStudents, classGrade, numberOfStudents);
    getMinScore(listOfStudents, classGrade, numberOfStudents);
    getMaxScore(listOfStudents, classGrade, numberOfStudents);
    
    //Generate and output file with the student grade information
    generateOutputFile(outputFileName, inputFileName, listOfStudents, numberOfStudents);
    
    //Print out student's info...
    printAllStudents(listOfStudents, classGrade, numberOfStudents, inputFileName, outputFileName);
    
    return 0;
}
