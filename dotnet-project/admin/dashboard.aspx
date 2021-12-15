<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        <br />
        <h3>Admin List</h3>
        <hr />



        <br />
        <h3>Lecturer List</h3>
        <hr />



        <br />
        <h3>Student List</h3>
        <hr />



        <br />


        <%-- untuk testing --%>
        <asp:Label ID="tempLabel" runat="server" Text="Temporary Label"></asp:Label>

    </div>

</asp:Content>
