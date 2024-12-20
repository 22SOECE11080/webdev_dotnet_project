using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace YourNamespace
{
    public partial class ClientManager : System.Web.UI.Page
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["ClientDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClients();
            }
        }

        private void LoadClients()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM clients", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvClients.DataSource = dt;
                        gvClients.DataBind();
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO clients (name, email, phone, address) VALUES (@Name, @Email, @Phone, @Address)";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                    cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            ClearForm();
            LoadClients();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(hfClientId.Value))
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE clients SET name=@Name, email=@Email, phone=@Phone, address=@Address WHERE id=@Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", hfClientId.Value);
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                ClearForm();
                LoadClients();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void gvClients_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int clientId = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "EditClient")
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT * FROM clients WHERE id=@Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", clientId);
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                hfClientId.Value = reader["id"].ToString();
                                txtName.Text = reader["name"].ToString();
                                txtEmail.Text = reader["email"].ToString();
                                txtPhone.Text = reader["phone"].ToString();
                                txtAddress.Text = reader["address"].ToString();
                            }
                        }
                    }
                }
            }
            else if (e.CommandName == "DeleteClient")
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "DELETE FROM clients WHERE id=@Id";
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Id", clientId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
                LoadClients();
            }
        }

        private void ClearForm()
        {
            hfClientId.Value = string.Empty;
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAddress.Text = string.Empty;
        }
    }
}
