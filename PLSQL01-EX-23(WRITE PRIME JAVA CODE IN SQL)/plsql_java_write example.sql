/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         29.06.2018
    DESCRIPTION : plsql java code example for isPrime java function
*/
CREATE OR REPLACE AND COMPILE JAVA SOURCE NAMED "PrimeNumberSearcher" AS
    public class PrimeSearcher
    {
        public string isPrime(int n)
        {
            boolean _isPrime = true;
        
            if (n < 2)
                _isPrime = false;
        
            if (n == 2)
                _isPrime = true;
            else if(n % 2 == 0)
                _isPrime = false;
            else {
                for (int i = 3; i < n; i+=2) {
                    if(n % i == 0) {
                        _isPrime = false;
                        break;
                    }
                }
            }
        
            return (_isPrime)?"true":"false";
        }
}
/

CREATE OR REPLACE FUNCTION prime_number_searcher(n number ) 
    RETURN VARCHAR2 
AS
LANGUAGE JAVA NAME 'PrimeSearcher.isPrime(int n) return java.lang.String';
/
