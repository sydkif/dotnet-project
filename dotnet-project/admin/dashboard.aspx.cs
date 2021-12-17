﻿using System;
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
    }
}