using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace dotnet_project.lecturer
{
    public partial class dashboard : System.Web.UI.Page // Lecturer
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userid"] == null || Session["username"] == null || Session["usertype"] == null)
            {
                Response.Redirect("/login.aspx");
            }

            string id = Session["userid"].ToString();
            string name = Session["username"].ToString();
            string type = Session["usertype"].ToString();

            if (type.ToLower() != "lecturer")
                Response.Redirect("/login.aspx");

            welcomeMsg.Text = "Welcome, " + name + "!";

        }
    }
}