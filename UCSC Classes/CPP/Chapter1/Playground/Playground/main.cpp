//
//  main.cpp
//  Playground
//
//  Created by James Kim on 9/12/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include <string>
#include <vector>

using namespace std;
using std::vector;

int main()
{
//   //Playing with pointers..
//
//    //Pointer that's constant can be changed...
//    const int value = 5;
//    const int *ptr = &value;
//    
//    const int anotherValue = 10;
//    ptr = &anotherValue;
//    
//    std::cout << "Value of ptr: " << *ptr << std::endl;
//    
//    
//    //Constant Pointers: Once set, you can't change the initial value..
//    int value2 = 20;
//    int value3 = 50;
//    int *const anotherPointer = &value2;
//    
//    //anotherValue = &value3; - this can't be changed since its a Constant Pointer...
//    
//    std::cout << "Value of anotherPointer: " << *anotherPointer << std::endl;
//    
//    string s = "Hello World!";
//    
//    for (decltype(s.size()) index = 0)
//    {
//        
//    }

    int testScore;
    vector<int> testScores;
    cout << "Type in the list of all the scores" << endl;
    while (cin >> testScore || !cin.eof())
    {
        testScores.push_back(testScore);
    }
    
    for (int i:testScores)
    {
        cout << i << endl;
    }
    
    vector<int>::size_type sizeOfScores = testScores.size();
    cout << "Total Scores in Vector: " << sizeOfScores << endl;
    
    //playing with arrays..
    int int_array[] = {1,2,3,4,5,6,7,8,9};
    for (auto i = begin(int_array); i != end(int_array); i++ )
    {
        cout << *i << endl;
    }
    
    //initiliazing vector from an array..
    vector<int> vect_from_array(begin(int_array), end(int_array));
    
    //creating 2 dientional array...
    size_t row = 10;
    size_t col = 10;
    int intArray[row][col];
    
    for (size_t i = 0; i < row; i++)
    {
        for (size_t j = 0; j < col; j++)
        {
            intArray[i][j] = (int)i * (int)j;
        }
    }
    
    
    size_t count = 0;
    for (auto &row : intArray)
    {
        for (auto &col : row)
        {
            col = (count * 5);
            count++;
        }
    }
    
    for (auto value : intArray)
    {
        cout << *value << endl;
    }

//    string word;
//    vector<string> text;
//    while (cin >> word)
//    {
//        text.push_back(word);
//    }
//    
//    for (auto i : text)
//    {
//        cout << i << " ";
//    }
//    cout << endl;
    
    return 0;
}
