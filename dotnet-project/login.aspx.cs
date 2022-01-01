using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] != null && Session["username"] != null && Session["usertype"] != null)
            {
                Response.Redirect("/" + Session["usertype"].ToString().ToLower() + "/dashboard.aspx");
            }

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {

            string username = user.Text;
            string password = pass.Text;

            SqlConnection con = new SqlConnection
                ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();

                string query = "SELECT * FROM [user] WHERE id='" + username + "' AND password='" + password + "'";

                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    string usertype = sdr.GetString(3);
                    tempLabel.Text = "Login Success. | User Type - " + usertype;

                    Session["userid"] = sdr.GetString(0);
                    Session["username"] = sdr.GetString(1);
                    Session["usertype"] = sdr.GetString(3);

                    con.Close();

                    if (username == password)
                    {
                        Response.Redirect("/change-password.aspx");
                    }
                    else
                    {
                        Response.Redirect("/" + usertype.ToLower() + "/dashboard.aspx");
                    }

                }
                else
                {
                    tempLabel.Text = "Invalid Username or Password.";
                }


            }
            catch (Exception ex)
            {
                tempLabel.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }

        }
    }
}