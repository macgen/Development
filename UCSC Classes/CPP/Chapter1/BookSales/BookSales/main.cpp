//
//  main.cpp
//  BookSales
//
//  Created by James Kim on 9/12/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>
#include "Sales_item.h"

using namespace std;

int main()
{
    //Instantiate a Sales_item...
//    Sales_item sales;
//    std::cout << "Please type in the ISBN Number, number of copies sold and the price." << std::endl;
//    std::cin >> sales;
//    
//    std::cout << sales << std::endl;
    
    
    Sales_item book1;
    Sales_item book2;
    
    cin >> book1 >> book2;
    cout << "The sum of 2 books: " << book1 + book2 << std::endl;
    
    if (book1.isbn() == book2.isbn())
    {
        cout << "The ISBN Numbers are the same: proceeding..." << endl;
        cout << book1 + book2 << endl;
    }
    else
    {
        cout << "The ISBN numbers do not match. " << endl;
    }
    
    return 0;
}