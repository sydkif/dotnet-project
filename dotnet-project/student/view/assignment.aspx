<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="assignment.aspx.cs" Inherits="dotnet_project.student.view.assignment" EnableEventValidation="false"%>
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
                                Response.Write(Request.QueryString["name"].ToString());
                            %>
                        </b>
                    </div>
                    <div class="card-body">               
                        
                        <asp:FileUpload ID="FileUpload1" runat="server" />

                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table">
                            <Columns>
                                
                                <asp:BoundField HeaderText="Assignment/Tutorial/Lab" DataField="title" />
                                <asp:BoundField HeaderText="" DataField="filename"
                                    ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                <asp:BoundField HeaderText="Your File" DataField="student_file"  />
                                <asp:TemplateField HeaderText="Download Task">
                                    <ItemTemplate>
                                        <asp:Button ID="Button11" runat="server" Text="Download" 
                                            CssClass="btn btn-dark" OnClick="viewAss_click" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Submission">
                                    <ItemTemplate>                       
                                        <asp:Button ID="Button1" runat="server" Text="Upload" CssClass="btn btn-dark" OnClick="submitAss_click" />
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

