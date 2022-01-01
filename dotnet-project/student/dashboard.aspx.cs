using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace dotnet_project.student
{
    public partial class dashboard : System.Web.UI.Page // Student
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

            if (type.ToLower() != "student")
                Response.Redirect("/login.aspx");

            welcomeMsg.Text = "<b>Welcome, " + name + "!</b>";

            SqlConnection con = new SqlConnection
                ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand
                    ("SELECT s.name AS subject_name, s.id AS subject_id FROM SUBJECT S JOIN [student_subject] wl ON s.id = wl.subject_id  JOIN [user] l ON wl.student_id = l.id WHERE l.id = '" + id + "';", con);
                SqlDataReader sdr1 = cmd1.ExecuteReader();

                GridView1.DataSource = sdr1;
                GridView1.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd5 = new SqlCommand("SELECT * FROM [subject]", con);
                SqlDataAdapter da2 = new SqlDataAdapter(cmd5);
                DataSet ds2 = new DataSet();
                da2.Fill(ds2);

                subjectList.DataTextField = ds2.Tables[0].Columns["name"].ToString();
                subjectList.DataValueField = ds2.Tables[0].Columns["id"].ToString();
                subjectList.DataSource = ds2.Tables[0];
                if (!Page.IsPostBack)
                {
                    subjectList.DataBind();
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

            if (Session["error_msg"] != null)
            {
                tempLabel.Text = Session["error_msg"].ToString();
            }

            Session["error_msg"] = "";

        }

        protected void regSubjectBtn_Click(object sender, EventArgs e)
        {

            string student = Session["userid"].ToString();
            string subject = subjectList.SelectedValue;

            if (subject != "")
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("INSERT INTO [student_subject] VALUES ('" + student + "', '" + subject + "'); ", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    Session["error_msg"] = ex.ToString();
                    tempLabel.Text = ex.ToString();
                }
                finally
                {
                    con.Close();

                    Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }
        }
    }
}