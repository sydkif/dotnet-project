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


            try
            {
                con.Open();

                string id = Request.QueryString["id"].ToString();
                string title = Request.QueryString["title"].ToString();

                SqlCommand cmd1 = new SqlCommand
                    ("SELECT  *   FROM assignment_student WHERE subject_id = '" + id + "' AND assignment_title = '" + title + "';", con);
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

        protected void downloadBtn_Click(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string file = gvr.Cells[1].Text.ToString();


            Response.ContentType = "text/plain";
            Response.AppendHeader("Content-Disposition", "attachment;");
            Response.TransmitFile(Server.MapPath(file));
            Response.End();

        }



    }
}