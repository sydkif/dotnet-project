using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project.lecturer
{
    public partial class dashboard : System.Web.UI.Page // Lecturer
    {

        SqlConnection con = new SqlConnection
                ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

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

            welcomeMsg.Text = "<b>Welcome, " + name + "!</b>";

            SqlConnection con = new SqlConnection
                            ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand
                    ("SELECT s.name AS subject_name, s.id AS subject_id FROM SUBJECT S JOIN [workload] wl ON s.id = wl.subject_id  " +
                    "JOIN [user] l ON wl.lecturer_id = l.id WHERE l.id = '" + id + "';", con);
                SqlDataReader sdr1 = cmd1.ExecuteReader();

                GridView1.DataSource = sdr1;
                GridView1.DataBind();

                con.Close();

            }
            catch (Exception ex)
            {
                error_msg.Text = ex.ToString();
            }
            finally
            {
                con.Close();
            }

            if (Session["error_msg"] != null)
            {
                error_msg.Text = Session["error_msg"].ToString();
            }

            Session["error_msg"] = "";

        }

        protected void viewAssignment_Click(object sender, EventArgs e)
        {

            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string id, name;
            id = gvr.Cells[0].Text.ToString();
            name = gvr.Cells[1].Text.ToString();

            error_msg.Text = id;

            Response.Redirect("create/assignment.aspx?id=" + id + "&name=" + name);

        }

    }

}


public class Subject
{
    public string id { get; set; }
    public string name { get; set; }
}