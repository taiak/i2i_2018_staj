package com.calculatorwebservice.calculator;

public class CalculatorWebService {

	public CalculatorWebService() {
		
	}
	
	public double add(double x, double y) {
		return x + y;
	}
	
	public double sub(double x, double y) {
		return x - y;
	}
	
	public double multiply(double x, double y)  {
		return (x * y);
	}
	
	/*
	 * @pre divisor != 0
	 * 
	 * */
	public double div(double dividend, double divisor) {
		if (divisor == 0)
			throw new ArithmeticException("Error: Divide by zero error!!!");
		
		return dividend/divisor;
	}
	
	// module operator
	public double mod(double dividend, double divisor) {
		if (divisor < 0)
			throw new ArithmeticException("Error: Invalid divisor!!!");

		return dividend % divisor;
	}
	
	/*
	 * @pre base > 0
	 */
	public double log(double base, double number) {	
		if (base < 2)
			throw new ArithmeticException("Error: Base must bigger then zero!!!");

		return Math.log(number) / Math.log(base);
	}
	
	// sum other funtion together
	public double calculate(double x, double y, String operation) {
		double result = 0;
		
		switch(operation) {
			case "+":
				result = add(x, y);      break;
			case "-":
				result = sub(x, y);      break;
			case "*":
				result = multiply(x, y); break;
			case "/":
				result = div(x, y);      break;
			case "%":
				result = mod(x,y);       break;
			case "log":
				result = log(x,y);       break;
			default:
				throw new ArithmeticException("ERROR: False operator!!");
		}
		
		return result;
	}

}

