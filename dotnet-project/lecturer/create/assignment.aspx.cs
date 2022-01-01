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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null || Session["username"] == null || Session["usertype"] == null)
            {
                Response.Redirect("/login.aspx");
            }

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


                SqlConnection con = new SqlConnection
                 ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");
                SqlCommand cmd = new SqlCommand
                    ("INSERT INTO [assignment] (title, filename, subject_id) VALUES ('" + title + "','" + filename + "','" + id + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                error_msg.Text = "File Uploaded";
                error_msg.ForeColor = System.Drawing.Color.ForestGreen;

            }

            else
            {
                error_msg.Text = "Please Upload your File";
                error_msg.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}