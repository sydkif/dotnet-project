<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.lecturer.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row mt-3">

            <div class="col">

                <asp:Label ID="welcomeMsg" runat="server" Text="Label" CssClass="fs-2"></asp:Label>
                <hr />

                <div class="card text-dark bg-light mb-3">
                    <div class="card-header fs-4"><b>Assigned Subject</b></div>
                    <div class="card-body">

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                <asp:BoundField HeaderText="Subject ID" DataField="subject_id" />
                                <asp:BoundField HeaderText="Subject Name" DataField="subject_name" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="ViewAssignment"
                                            Text="View Assignment" CssClass="btn btn-dark" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <hr />

            </div>

            <asp:Label ID="error_msg" runat="server" Text="Label"></asp:Label>


        </div>
    </div>
</asp:Content>

<%-- Lecturer --%>




