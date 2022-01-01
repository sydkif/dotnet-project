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
    public partial class change_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null || Session["username"] == null || Session["usertype"] == null)
            {
                Response.Redirect("/login.aspx");
            }
        }

        protected void confirmBtn_Click(object sender, EventArgs e)
        {
            string pass1 = password1.Text;
            string pass2 = password2.Text;
            string userid = Session["userid"].ToString();
            string usertype = Session["usertype"].ToString();



            if (pass1.Equals(pass2))
            {

                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();

                    string query = "UPDATE [user] SET password = '" + pass1 + "' WHERE id = '" + userid + "'";

                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader sdr = cmd.ExecuteReader();

                    con.Close();

                    Response.Redirect("/" + usertype.ToLower() + "/dashboard.aspx");

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
            else
            {
                tempLabel.Text = "Password does not match.";
            }

        }
    }
}