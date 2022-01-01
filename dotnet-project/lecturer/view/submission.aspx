<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="submission.aspx.cs" Inherits="dotnet_project.lecturer.view.submission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row mt-3">

            <div class="col">

                <a href="javascript: history.go(-1)" class="btn btn-sm text-decoration-none text-muted">< Go back</a>
                <hr />

                <div class="card text-dark bg-light mb-3">

                    <div class="card-header fs-4">
                        <b>
                            <% 
                                Response.Write(Request.QueryString["id"].ToString());
                            %>: 
                            <% 
                                Response.Write(Request.QueryString["title"].ToString());
                            %>
                        </b>
                    </div>
                    <div class="card-body">
                    </div>
                </div>
                <hr />

            </div>

            <asp:Label ID="error_msg" runat="server" Text=""></asp:Label>


        </div>
    </div>

</asp:Content>
