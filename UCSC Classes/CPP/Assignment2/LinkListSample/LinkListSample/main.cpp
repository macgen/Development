//
//  main.cpp
//  LinkListSample
//
//  Created by James Kim on 10/2/15.
//  Copyright © 2015 James J. Kim. All rights reserved.
//

#include <iostream>

using namespace std;

class CNode
{
    public:
        int m_nData;
        CNode *m_pLink;
};



int main(int argc, const char * argv[])
{
    CNode *pHeadPtr;
    CNode *pCurrPtr;
    CNode *pTailPtr;
    CNode *pDeleteThisNode;
    
    cout << "Before Assignment" << endl;
    cout << "pHeadPtr Address: " << pHeadPtr << endl;
    cout << "pCurrPtr Address: " << pCurrPtr << endl;
    cout << "pTailPtr Address: " << pTailPtr << endl;
    
    pCurrPtr = new CNode;
    pTailPtr = pHeadPtr = pCurrPtr;
    pCurrPtr->m_nData = 1;
    pCurrPtr->m_pLink = 0;
    
//    cout << "\nAfter pCurrPtr gets Assignment" << endl;
//    cout << "pHeadPtr Address: " << pHeadPtr << endl;
//    cout << "Header Data: " << pHeadPtr->m_nData << endl;
//    cout << "Header Link: " << pHeadPtr->m_pLink << endl;
//    cout << "\npCurrPtr Address: " << pCurrPtr << endl;
//    cout << "Current Data: " << pCurrPtr->m_nData << endl;
//    cout << "Current Link: " << pCurrPtr->m_pLink << endl;
//    cout << "\npTailPtr Address: " << pTailPtr << endl;
//    cout << "Tail Data: " << pTailPtr->m_nData << endl;
//    cout << "Tail Link: " << pTailPtr->m_pLink << endl;
    
    pTailPtr->m_pLink = new CNode;
    pCurrPtr = pTailPtr->m_pLink;
    pCurrPtr->m_nData = 2;
    pCurrPtr->m_pLink = 0;
    pTailPtr = pCurrPtr;
    
    
//    cout << "\nAfter pTailPtr gets 2nd new object Assignment" << endl;
//    cout << "pHeadPtr Address: " << pHeadPtr << endl;
//    cout << "Header Data: " << pHeadPtr->m_nData << endl;
//    cout << "Header Link: " << pHeadPtr->m_pLink << endl;
//    cout << "\npCurrPtr Address: " << pCurrPtr << endl;
//    cout << "Current Data: " << pCurrPtr->m_nData << endl;
//    cout << "Current Link: " << pCurrPtr->m_pLink << endl;
//    cout << "\npTailPtr Address: " << pTailPtr << endl;
//    cout << "Tail Data: " << pTailPtr->m_nData << endl;
//    cout << "Tail Link: " << pTailPtr->m_pLink << endl;
    
    pTailPtr->m_pLink = new CNode;
    pCurrPtr = pTailPtr->m_pLink;
    pCurrPtr->m_nData = 3;
    pCurrPtr->m_pLink = 0;
    pTailPtr = pCurrPtr;
    
//    cout << "\nAfter pTailPtr gets 3rd new object Assignment" << endl;
//    cout << "pHeadPtr Address: " << pHeadPtr << endl;
//    cout << "Header Data: " << pHeadPtr->m_nData << endl;
//    cout << "Header Link: " << pHeadPtr->m_pLink << endl;
//    cout << "\npCurrPtr Address: " << pCurrPtr << endl;
//    cout << "Current Data: " << pCurrPtr->m_nData << endl;
//    cout << "Current Link: " << pCurrPtr->m_pLink << endl;
//    cout << "\npTailPtr Address: " << pTailPtr << endl;
//    cout << "Tail Data: " << pTailPtr->m_nData << endl;
//    cout << "Tail Link: " << pTailPtr->m_pLink << endl;
    
    pTailPtr->m_pLink = new CNode;
    pCurrPtr = pTailPtr->m_pLink;
    pCurrPtr->m_nData = 4;
    pCurrPtr->m_pLink = 0;
    
    pCurrPtr = pHeadPtr;
    
    while (pCurrPtr != 0)
    {
        pDeleteThisNode = pCurrPtr;
        cout << pCurrPtr->m_nData << endl;
        pCurrPtr = pCurrPtr->m_pLink;
        delete pDeleteThisNode;
    }
    
    
//    cout << "\nHeader and Tail should point to same thing as Current" << endl;
//    cout << "Header Data: " << pHeadPtr->m_nData << endl;
//    cout << "Header Link: " << pHeadPtr->m_pLink << endl;
    
    return 0;
}
