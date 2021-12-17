<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <br />

        <div class="row">

            <div class="col-md-6">
                <h3>List of Current User</h3>
                <hr />
                <asp:GridView ID="GridView1" runat="server" CssClass="table"></asp:GridView>
            </div>

            <div class="col-md-6">
                <h3>Subject List</h3>
                <hr />
                <asp:GridView ID="GridView2" runat="server" CssClass="table"></asp:GridView>
            </div>

        </div>
        <hr />

        <div class="row">

            <div class="col-md-6">
                <h3>Add new User</h3>
                <hr />
                <p>Please enter a user ID, name and select a type for the new account.</p>
                <b>User ID</b>
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
            </div>

            <div class="col-md-6">
                <h3>Delete a User</h3>
                <hr />
                <p>Please enter the user ID for the account that you want to delete.</p>
                <b>User ID</b><br />
                <asp:TextBox ID="selectedUserID" runat="server"></asp:TextBox>
                <asp:Button ID="deleteBtn" runat="server" CssClass="btn btn-danger"
                    Text="Delete" Style="margin-left: 20px" OnClick="deleteBtn_Click"
                    OnClientClick="return confirm('Are you sure?')" />
                <span runat="server" id="delete_msg"></span>
            </div>
        </div>

        <hr />

        <div class="row">

            


            <div class="col-md-6">
                <h3>Add a new Subject</h3>
                <hr />
                <p>Please enter a subject ID and name for the new subject.</p>
                <b>Subject ID</b>
                <br />
                <asp:TextBox ID="newSubID" runat="server" MaxLength="8"></asp:TextBox><br />
                <b>Name</b>
                <br />
                <asp:TextBox ID="newSubName" runat="server" MaxLength="50"></asp:TextBox><br />
                <br />
                <asp:Button ID="addNewSub" runat="server" CssClass="btn btn-success"
                    Text="Add" OnClick="addNewSubBtn_Click" OnClientClick="return confirm('Are you sure?')" />
                <span runat="server" id="Span1"></span>
            </div>

            <div class="col-md-6">

                <h3>Delete a Subject</h3>
                <hr />
                <p>Please enter the subject ID that you want to delete.</p>
                <b>Subject ID</b><br />
                <asp:TextBox ID="selectedSubID" runat="server"></asp:TextBox>
                <asp:Button ID="deleteSubBtn" runat="server" CssClass="btn btn-danger"
                    Text="Delete" Style="margin-left: 20px" OnClick="deleteSubBtn_Click"
                    OnClientClick="return confirm('Are you sure?')" />
                <span runat="server" id="Span2"></span>
            </div>

        </div>




        <%-- for error message --%>
        <asp:Label ID="tempLabel" runat="server" Text=""></asp:Label>

    </div>

</asp:Content>
