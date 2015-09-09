#FileName: Factorial.py
#	Program to compute the factorial of a number

def main():
	n = eval(input("Please enter a whole number: "))
	fact = 1
	for factor in range(n, 1, -1):
		fact = fact * factor
	
	print ("The factorial of {} is, {}".format(n, fact))
	

main()
