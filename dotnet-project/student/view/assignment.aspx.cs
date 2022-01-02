using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project.student.view
{
    public partial class assignment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection
                            ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null || Session["username"] == null || Session["usertype"] == null)
            {
                Response.Redirect("/login.aspx");
            }

            string subject_id = Request.QueryString["id"].ToString();
            string user_id = Session["userid"].ToString();

            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand
                    ("SELECT * FROM assignment a LEFT JOIN assignment_student ass ON (a.title = ass.assignment_title) " +
                    "WHERE a.subject_id = '" + subject_id + "'  AND(ass.student_id = '" + user_id + "' OR ass.student_file is NULL)", con);
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
        protected void viewAss_click(object sender, EventArgs e)
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

        protected void submitAss_click(object sender, EventArgs e)
        {

            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string title;
            title = gvr.Cells[0].Text.ToString();

            string id = Request.QueryString["id"].ToString();

            if (FileUpload1.HasFile)
            {
                string str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str));
                string filename = "~/upload/" + str.ToString();

                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO [assignment_student] (assignment_title, file_name, student_id, student_file, subject_id) " +
                    "VALUES ('" + title + "','" + filename + "','" + Session["userid"].ToString() + "','" + Session["userid"].ToString() + "_" + title + "', '" + id + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                error_msg.Text = "File Uploaded";
                error_msg.ForeColor = System.Drawing.Color.ForestGreen;
                Response.Redirect(Page.Request.Url.ToString(), true);
            }

            else
            {
                error_msg.Text = "Please enter a title OR upload a File";
                error_msg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}