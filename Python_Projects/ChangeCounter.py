#FileName: ChangeCounter.py
#A program to calculate the value of the some change in dollars

#Introduction


#Number of Quarters (quarters)
quarters = eval(input("Quarters: "))

#Number of Dimes (dimes)
dimes = eval(input("Dimes: "))

#Number of Nickels (nickels)
nickels = eval(input("Nickels: "))

#Number of Pennies (pennies)
pennies = eval(input("Pennies: "))

#Calculate
totalAmount = (quarters * 0.25) + (dimes * 0.10) + (nickels * 0.05) + (pennies * 0.01)

#Display the total amount in dollars and pennies
print("You have total of ${} dollars.".format(float(totalAmount)))