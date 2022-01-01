using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project.lecturer.create
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

            string id = Request.QueryString["id"].ToString();

            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand
                    ("SELECT * FROM [assignment] WHERE subject_id ='" + id + "'", con);
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

        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string title = TextBox1.Text;
            string id = Request.QueryString["id"].ToString();

            if (title != "" && FileUpload1.HasFile)
            {
                string str = FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str));
                string filename = "~/upload/" + str.ToString();

                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO [assignment] (title, filename, subject_id) VALUES ('" + title + "','" + filename + "','" + id + "')", con);

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

        protected void viewBtn_Click(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string id, title;
            id = Request.QueryString["id"].ToString();
            title = gvr.Cells[0].Text.ToString();


            error_msg.Text = "View" + title;
            Response.Redirect("../view/submission.aspx?id=" + id + "&title=" + title);


        }

        protected void downloadBtn_Click(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string title;
            title = gvr.Cells[0].Text.ToString();

            con.Open();

            SqlCommand cmd = new SqlCommand
                    ("SELECT filename FROM [assignment] WHERE title = '" + title + "'", con);
            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                string file = sdr.GetString(0);
                Response.ContentType = "text/plain";
                Response.AppendHeader("Content-Disposition", "attachment;");
                Response.TransmitFile(Server.MapPath(file));
                Response.End();
            }
            con.Close();

        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            string title;
            title = gvr.Cells[0].Text.ToString();


            try
            {
                con.Open();
                SqlDataAdapter cmd = new SqlDataAdapter();

                cmd.InsertCommand = new SqlCommand
                    ("DELETE FROM [assignment] WHERE title = '" + title + "'", con);

                cmd.InsertCommand.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                error_msg.Text = ex.ToString();
            }
            finally
            {
                con.Close();

                Response.Redirect(Page.Request.Url.ToString(), true);
            }

            error_msg.Text = "delete" + title;

        }
    }
}