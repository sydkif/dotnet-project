<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.student.dashboard"enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="row mt-3">

            <div class="col">

                <asp:Label ID="welcomeMsg" runat="server" Text="Label" CssClass="fs-2"></asp:Label>
                <hr />

                <div class="card text-dark bg-light mb-3">
                    <div class="card-header fs-4"><b>Registered Subject</b></div>
                    <div class="card-body">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                <asp:BoundField HeaderText="Subject ID" DataField="subject_id" />
                                <asp:BoundField HeaderText="Subject Name" DataField="subject_name" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="false"
                                            Text="View Assignment" CssClass="btn btn-dark" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <hr />

                <div class="card text-dark bg-light mb-3">
                    <div class="card-header fs-4"><b>Register new Subject</b></div>
                    <div class="card-body">

                        <p>Please select a subject</p>

                        <b>Subject</b><br />
                        <asp:DropDownList ID="subjectList" runat="server" Height="36px" Width="50%">
                        </asp:DropDownList>
                        <asp:Button ID="registerSubjectBtn" runat="server" Text="Register" CssClass="btn btn-success ml-3"
                            OnClick="regSubjectBtn_Click" OnClientClick="return confirm('Are you sure?')" />



                    </div>
                </div>


            </div>

        </div>


        <%-- for error message --%>
        <asp:Label ID="tempLabel" runat="server" Text=""></asp:Label>

    </div>


</asp:Content>

<%-- Student --%>
