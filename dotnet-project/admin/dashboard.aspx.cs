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
            if (Session["userid"] == null || Session["username"] == null || Session["usertype"] == null)
            {
                Response.Redirect("/login.aspx");
            }

            string id = Session["userid"].ToString();
            string name = Session["username"].ToString();
            string type = Session["usertype"].ToString();

            if (type.ToLower() != "admin")
                Response.Redirect("/login.aspx");

            SqlConnection con = new SqlConnection
                ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

            try
            {
                con.Open();

                SqlCommand cmd1 = new SqlCommand("SELECT id, name, type FROM [user]", con);
                SqlDataReader sdr1 = cmd1.ExecuteReader();

                GridView1.DataSource = sdr1;
                GridView1.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd2 = new SqlCommand("SELECT * FROM [subject]", con);
                SqlDataReader sdr2 = cmd2.ExecuteReader();

                GridView2.DataSource = sdr2;
                GridView2.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd3 = new SqlCommand("SELECT * FROM [workload]", con);
                SqlDataReader sdr3 = cmd3.ExecuteReader();

                GridView3.DataSource = sdr3;
                GridView3.DataBind();

                con.Close();

                con.Open();

                SqlCommand cmd4 = new SqlCommand("SELECT * FROM [user] WHERE type = 'lecturer'", con);
                SqlDataAdapter da1 = new SqlDataAdapter(cmd4);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);

                lecturerList.DataTextField = ds1.Tables[0].Columns["name"].ToString();
                lecturerList.DataValueField = ds1.Tables[0].Columns["id"].ToString();
                lecturerList.DataSource = ds1.Tables[0];
                if (!Page.IsPostBack)
                {
                    lecturerList.DataBind();
                }


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

        protected void addBtn_Click(object sender, EventArgs e)
        {

            string id = newUserID.Text;
            string name = newUserName.Text;
            string type = newUserType.SelectedValue;

            if ((id != "") && (name != ""))
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("INSERT INTO [user] VALUES ('" + id + "', '" + name + "', '" + id + "', '" + type + "'); ", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                    add_msg.InnerHtml = "Added!";
                }
                catch (Exception ex)
                {
                    add_msg.InnerHtml = ex.ToString();
                }
                finally
                {
                    con.Close();

                    Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        protected void deleteBtn_Click(object sender, EventArgs e)
        {

            string id = selectedUserID.Text;

            if (id != "")
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("DELETE FROM [user] WHERE id = '" + id + "'", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    delete_msg.InnerHtml = ex.ToString();
                }
                finally
                {
                    con.Close();

                    Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        protected void addNewSubBtn_Click(object sender, EventArgs e)
        {

            string id = newSubID.Text;
            string name = newSubName.Text;

            if ((id != "") && (name != ""))
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("INSERT INTO [subject] VALUES ('" + id + "', '" + name + "'); ", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                    add_msg.InnerHtml = "Added!";
                }
                catch (Exception ex)
                {
                    add_msg.InnerHtml = ex.ToString();
                }
                finally
                {
                    con.Close();

                    Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        protected void deleteSubBtn_Click(object sender, EventArgs e)
        {

            string id = selectedSubID.Text;

            if (id != "")
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("DELETE FROM [subject] WHERE id = '" + id + "'", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    delete_msg.InnerHtml = ex.ToString();
                }
                finally
                {
                    con.Close();

                    Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        protected void assignWorkload_Click(object sender, EventArgs e)
        {
            string lecturer = lecturerList.SelectedValue;
            string subject = subjectList.SelectedValue;

            if ((lecturer != "") && (subject != ""))
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("INSERT INTO [workload] VALUES ('" + lecturer + "', '" + subject + "'); ", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                    add_msg.InnerHtml = "Added!";
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

        protected void deleteWorkloadBtn_Click(object sender, EventArgs e)
        {
            string lecturer_id = lecturerId.Text;
            string subject_id = subjectId.Text;

            if (lecturer_id != "")
            {
                SqlConnection con = new SqlConnection
                    ("Data Source =.\\SQLEXPRESS; Initial Catalog = DotNetProject; Integrated Security = True; Pooling = False");

                try
                {
                    con.Open();
                    SqlDataAdapter cmd = new SqlDataAdapter();

                    cmd.InsertCommand = new SqlCommand
                        ("DELETE FROM [workload] WHERE lecturer_id = '" + lecturer_id + "' AND subject_id = '" + subject_id + "'", con);

                    cmd.InsertCommand.ExecuteNonQuery();

                }
                catch (Exception ex)
                {
                    delete_msg.InnerHtml = ex.ToString();
                }
                finally
                {
                    con.Close();

                    Response.Redirect(Page.Request.Url.ToString(), true);
                }
            }

        }

        protected void lecturerList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void subjectList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}