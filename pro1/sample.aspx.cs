using System;
using System.Web.UI;

namespace pro1
{
    public partial class sample : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            try
            {
                // Parse the input values
                double num1 = double.Parse(TextBox1.Text);
                double num2 = double.Parse(TextBox2.Text);

                // Determine the selected operation
                string operation = ddlOperation.SelectedValue;
                double result = 0;

                // Perform the calculation
                switch (operation)
                {
                    case "Add":
                        result = num1 + num2;
                        break;
                    case "Subtract":
                        result = num1 - num2;
                        break;
                    case "Multiply":
                        result = num1 * num2;
                        break;
                    case "Divide":
                        if (num2 != 0)
                            result = num1 / num2;
                        else
                        {
                            lblResult.Text = "Error: Division by zero is not allowed.";
                            return;
                        }
                        break;
                    default:
                        lblResult.Text = "Please select a valid operation.";
                        return;
                }

                // Display the result
                lblResult.Text = $"The result is: {result}";
            }
            catch (FormatException)
            {
                lblResult.Text = "Error: Please enter valid numbers.";
            }
        }
    }
}
