using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project.admin
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection
                ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();


                //SqlCommand admin_cmd = new SqlCommand("SELECT id, name FROM [user] WHERE type='ADMIN'", con);
                SqlCommand cmd = new SqlCommand("SELECT * FROM [user]", con);
                SqlDataReader sdr = cmd.ExecuteReader();

                GridView1.DataSource = sdr;
                GridView1.DataBind();




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