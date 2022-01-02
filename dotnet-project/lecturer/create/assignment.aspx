<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="assignment.aspx.cs" Inherits="dotnet_project.lecturer.create.assignment" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row mt-3">

            <div class="col">

                <a href="../dashboard.aspx" class="btn btn-sm text-decoration-none text-muted"> < Go back</a>
                <hr />

                <div class="card text-dark bg-light mb-3">

                    <div class="card-header fs-4">
                        <b>
                            <% 
                                Response.Write(Request.QueryString["id"].ToString());
                            %>: 
                            <% 
                                Response.Write(Request.QueryString["name"].ToString());
                            %>
                        </b>
                    </div>
                    <div class="card-body">

                        <asp:Label ID="Label1" runat="server" Text="Title: "></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:Button ID="Button1" runat="server" Text="Upload" CssClass="btn btn-dark" OnClick="uploadBtn_Click" />
                        <hr />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                <asp:BoundField HeaderText="Assignment Title" DataField="title" />

                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button2" runat="server" Text="View Submission"
                                            CssClass="btn btn-primary" OnClick="viewBtn_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button3" runat="server" Text="Download"
                                            CssClass="btn btn-success" OnClick="downloadBtn_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button4" runat="server" Text="Delete"
                                            CssClass="btn btn-danger" OnClick="deleteBtn_Click" OnClientClick="return confirm('Are you sure?')" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <hr />

            </div>

            <asp:Label ID="error_msg" runat="server" Text=""></asp:Label>


        </div>
    </div>

</asp:Content>
