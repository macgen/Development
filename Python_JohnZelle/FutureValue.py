#File Name: FutureValue.py

#Print the introduction
print("This program calculates the future value")
print("of 10 year investment !")

#Input the amount of the principal (principle)
principal = eval(input("Enter the initial principal: "))

#Input the annual percentage rate (apr)
apr = eval(input("Enter teh annual interest rate: "))

#Repeat it 10 times
	# principal = principal * (1 + apr)
	
for i in range(10):
	principal = principal * ( 1 + apr)
	
#Output the value of principal
print("The value in 10 years is: $", principal)