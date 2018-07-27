<?php

/*
 * @post return result_set
 *
 */
function calculate_from_web_service($wsdl_link, $parameters){
	
	$client = new SoapClient($wsdl_link);
	
	$response = $client->calculate($parameters);
	
	return(get_object_vars($response));
}

/*
 * @post return calculateReturn
 *
 */

function calculator($param1, $param2, $operation){
	$wsdl_link = "http://209.97.129.103:8080/CalculatorWebService/services/CalculatorWebService?wsdl";
		
	$parameters = array( 
		'x'         => $param1,
		'y'         => $param2,
		'operation' => $operation
	);
	// catch exception before web service
	switch ($operation) {
		case '/':
			if($param2 == 0)
				throw new Exception("Error: Divisor can't be 0.");
        	break;
    	case '%':
			if($param1 < 1) // if base < 1
				throw new Exception("Error: Base must be positive.");
        	break;
    	case 'log':
			if($param1 < 2) // if base < 2
				throw new Exception("Error: Base must bigger than 1.");
			break;
	}
	
	$response_array = calculate_from_web_service($wsdl_link, $parameters);
	
	return($response_array["calculateReturn"]);
}

$result = calculator($_GET['firstNumber'], $_GET['secondNumber'], $_GET['operation']);

echo("$result");

php?>