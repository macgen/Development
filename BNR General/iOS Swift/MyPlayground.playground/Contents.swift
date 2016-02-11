//: Playground - noun: a place where people can play

import UIKit

var helloWorld = "Hello World!"

print (helloWorld)

print (42)

var someInt = Int()

var someIntValueToString = String(50)

print(someIntValueToString)


var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 10.00
reading2 = 15.00
//reading3 = 25.00

let totalAverage = reading1! + reading2! + reading3!

if let r1 = reading1, r2 = reading2, r3 = reading3
{
    let averageReading = (r1 + r2 + r2) / 3
}
else
{
    let errorString = "Failed'"
}

enum PieType
{
    case Apple
    case Cherry
    case Grape
}

let favoritePie = PieType.Apple

let name: String

switch favoritePie
{
case .Apple:
    name = "Apple"
case .Cherry:
    name = "Cherry"
case .Grape:
    name = "Grape"
}



