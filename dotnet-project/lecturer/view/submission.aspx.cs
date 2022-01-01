using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project.lecturer.view
{
    public partial class submission : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection
                 ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null || Session["username"] == null || Session["usertype"] == null)
            {
                Response.Redirect("/login.aspx");
            }


        }



    }
}