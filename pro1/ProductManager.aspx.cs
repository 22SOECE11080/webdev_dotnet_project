using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pro1
{
    public partial class ProductManager : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["ClientDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProduct();
            }

            // Check if we are deleting a product
            if (Request.QueryString["DeleteProduct"] != null)
            {
                int productId = Convert.ToInt32(Request.QueryString["DeleteProduct"]);
                DeleteProduct(productId);
            }
        }

        private void LoadProduct()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM Products", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvProducts.DataSource = dt;
                        gvProducts.DataBind();
                    }
                }
            }
        }

        public void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Products (ProductName, Price) VALUES (@ProductName, @Price)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductName", txtProductName.Value);  // .Value for HtmlInputText
                    cmd.Parameters.AddWithValue("@Price", txtPrice.Value);  // .Value for HtmlInputText
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            ClearForm();
            LoadProduct();
        }

        // Add the RowCommand handler method
        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                // Retrieve the productId from the CommandArgument
                int productId = Convert.ToInt32(e.CommandArgument);

                // Delete the product from the database
                DeleteProduct(productId);
            }
        }

        public void EditProduct(int productId)
        {
            using(SqlConnection con = new SqlConnection(connectionString))
            {

            }
        }

        public void DeleteProduct(int productId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Products WHERE ProductId=@ProductId";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            LoadProduct();  // Reload the product list after deletion
        }

        private void ClearForm()
        {
            txtProductName.Value = string.Empty;  // Use .Value for HtmlInputText
            txtPrice.Value = string.Empty;  // Use .Value for HtmlInputText
        }
    }
}
