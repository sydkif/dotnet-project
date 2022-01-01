<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.admin.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <br />

        <div class="row">

            <div class="col-6">

                <div class="card text-dark bg-light  my-2 shadow-sm">
                    <div class="card-header fs-4"><b>List of Current User</b></div>
                    <div class="card-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                <asp:BoundField HeaderText="ID" DataField="id" />
                                <asp:BoundField HeaderText="Name" DataField="name" />
                                <asp:BoundField HeaderText="Type" DataField="type" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="col-6">
                <div class="card text-dark bg-light  my-2 shadow-sm">
                    <div class="card-header fs-4"><b>Add new User</b></div>
                    <div class="card-body">
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
                </div>

                <div class="card text-dark bg-light my-2 shadow-sm">
                    <div class="card-header fs-4"><b>Delete a user</b></div>
                    <div class="card-body">
                        <p>Please enter the user ID of the account that you want to delete.</p>
                        <b>User ID</b><br />
                        <asp:TextBox ID="selectedUserID" runat="server"></asp:TextBox>
                        <asp:Button ID="deleteBtn" runat="server" CssClass="btn btn-danger"
                            Text="Delete" Style="margin-left: 20px" OnClick="deleteBtn_Click"
                            OnClientClick="return confirm('Are you sure?')" />
                        <span runat="server" id="delete_msg"></span>
                    </div>
                </div>

            </div>



        </div>

        <hr />

        <div class="row">

            <div class="col-6">

                <div class="card text-dark bg-light  my-2 shadow-sm">
                    <div class="card-header fs-4"><b>Subject List</b></div>
                    <div class="card-body">
                        <asp:GridView ID="GridView2" runat="server" CssClass="table"></asp:GridView>
                    </div>
                </div>

            </div>

            <div class="col-md-6">
                <div class="card text-dark bg-light  my-2 shadow-sm">
                    <div class="card-header fs-4"><b>Add new Subject</b></div>
                    <div class="card-body">
                        <p>Please enter a subject ID and name for the new subject.</p>
                        <b>Subject ID</b><br />
                        <asp:TextBox ID="newSubID" runat="server" MaxLength="8"></asp:TextBox><br />
                        <b>Name</b><br />
                        <asp:TextBox ID="newSubName" runat="server" MaxLength="50"></asp:TextBox><br />
                        <br />
                        <asp:Button ID="addNewSub" runat="server" CssClass="btn btn-success"
                            Text="Add" OnClick="addNewSubBtn_Click" OnClientClick="return confirm('Are you sure?')" />
                        <span runat="server" id="Span1"></span>
                    </div>
                </div>

                <div class="card text-dark bg-light  my-2 shadow-sm">
                    <div class="card-header fs-4"><b>Delete a Subject</b></div>
                    <div class="card-body">
                        <p>Please enter the subject ID that you want to delete.</p>
                        <b>Subject ID</b><br />
                        <asp:TextBox ID="selectedSubID" runat="server"></asp:TextBox>
                        <asp:Button ID="deleteSubBtn" runat="server" CssClass="btn btn-danger"
                            Text="Delete" Style="margin-left: 20px" OnClick="deleteSubBtn_Click"
                            OnClientClick="return confirm('Are you sure?')" />
                        <span runat="server" id="Span2"></span>
                    </div>
                </div>
            </div>

        </div>

        <hr />

        <div class="row">

            <div class="col-md-6">

                <div class="card text-dark bg-light mb-3">
                    <div class="card-header fs-4"><b>Lecturer Workload</b></div>
                    <div class="card-body">
                        <asp:GridView ID="GridView3" runat="server" CssClass="table"></asp:GridView>
                    </div>
                </div>


            </div>


            <div class="col-md-6">

                <div class="card text-dark bg-light mb-3">
                    <div class="card-header fs-4"><b>Assign Workload</b></div>
                    <div class="card-body">

                        <p>Please select a lecturer and a subject</p>
                        <b>Lecturer</b><br />
                        <asp:DropDownList ID="lecturerList" runat="server" Height="36px" Width="50%">
                        </asp:DropDownList>
                        <br />
                        <b>Subject</b><br />
                        <asp:DropDownList ID="subjectList" runat="server" Height="36px" Width="50%">
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Button ID="assignWorkloadBtn" runat="server" CssClass="btn btn-success"
                            Text="Add" OnClick="assignWorkload_Click" OnClientClick="return confirm('Are you sure?')" />
                        <span runat="server" id="Span3"></span>
                    </div>
                </div>


                <div class="card text-dark bg-light mb-3">
                    <div class="card-header fs-4"><b>Remove Workload</b></div>
                    <div class="card-body">

                        <p>Please enter the lecturer and subject id to remove. </p>
                        <b>Lecturer</b><br />
                        <asp:TextBox ID="lecturerId" runat="server" MaxLength="50"></asp:TextBox><br />
                        <b>Subject</b><br />
                        <asp:TextBox ID="subjectId" runat="server" MaxLength="8"></asp:TextBox><br />
                        <br />
                        <asp:Button ID="deleteWorkloadBtn" runat="server" CssClass="btn btn-danger"
                            Text="Delete" OnClick="deleteWorkloadBtn_Click" OnClientClick="return confirm('Are you sure?')" />
                        <span runat="server" id="Span4"></span>
                    </div>
                </div>

            </div>

        </div>






        <%-- for error message --%>
        <asp:Label ID="tempLabel" runat="server" Text=""></asp:Label>

    </div>

</asp:Content>
