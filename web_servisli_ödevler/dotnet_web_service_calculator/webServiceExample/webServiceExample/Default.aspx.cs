using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webServiceExample
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WebReference.CalculatorWebServiceService wsCalculator = new WebReference.CalculatorWebServiceService();
            resultLabel.Text = wsCalculator.calculate(4, 5, "+").ToString();
        }

        protected void WebCalculateButton_Click(object sender, EventArgs e) {
            WebReference.CalculatorWebServiceService wsCalculator = new WebReference.CalculatorWebServiceService();
            double parameter1 = int.Parse(firstNumberTextBox.Text.ToString());
            double parameter2 = int.Parse(secondNumberTextBox.Text.ToString());
            String operation = operationTextBox.Text.ToString();
            //System.Diagnostics.Debug.WriteLine("parameter1: " + parameter1.ToString() +"\nparameter 2 is :" + parameter2.ToString() +"op: " + operation);
            System.Diagnostics.Debug.WriteLine("wööööö");
            double result = wsCalculator.calculate(parameter1, parameter2, operation);
            resultLabel.Text = "Result is: " + result.ToString();
        }
    }
}