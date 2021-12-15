<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <br />
        <h3>List of Current User</h3>
        <hr />

        <asp:GridView ID="GridView1" runat="server" CssClass="table"></asp:GridView>

        <br />
        <hr />
        <h3>Add new User</h3>
        <hr />
        <b>ID</b>
        <br />
        <asp:TextBox ID="newUserID" runat="server"></asp:TextBox><br />
        <b>Name</b>
        <br />
        <asp:TextBox ID="newUserName" runat="server"></asp:TextBox><br />
        <b>Type</b>
        <br />
        <asp:DropDownList ID="newUserType" runat="server">
            <asp:ListItem>Admin</asp:ListItem>
            <asp:ListItem>Lecturer</asp:ListItem>
            <asp:ListItem>Student</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="addBtn" runat="server" CssClass="btn btn-success"
            Text="Add" OnClick="addBtn_Click" OnClientClick="return confirm('Are you sure?')" />
        <span runat="server" id="add_msg"></span>
        <br />
        <br />
        <hr />
        <h3>Delete a User</h3>
        <hr />
        <p>Please enter carefully the user id that you want to delete.</p>
        <b>ID</b><br />
        <asp:TextBox ID="selectedUserID" runat="server"></asp:TextBox>
        <asp:Button ID="deleteBtn" runat="server" CssClass="btn btn-danger"
            Text="Delete" Style="margin-left: 20px" OnClick="deleteBtn_Click"
            OnClientClick="return confirm('Are you sure?')" />
        <span runat="server" id="delete_msg"></span>
        <hr />
        <br />

        <%-- for error message --%>
        <asp:Label ID="tempLabel" runat="server" Text=""></asp:Label>

    </div>

</asp:Content>
