<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="dotnet_project.lecturer.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row mt-3">

            <div class="col" id="subjectList">

                <asp:Label ID="welcomeMsg" runat="server" Text="Label" CssClass="fs-2"></asp:Label>
                <hr />

                <div class="card" runat="server">

                    <div class="card-header">
                        <b class="fs-4">Subject Name</b>
                    </div>

                    <div class="card-body">

                        <table class="table">

                            <thead>
                                <tr>
                                    <th style="text-align: center;">No</th>
                                    <th style="text-align: left;">Title</th>
                                    <th style="text-align: left;">Filename</th>
                                    <th style="text-align: center;">Content</th>
                                    <th style="text-align: center;">Submission</th>
                                    <th style="text-align: center;">Delete</th>
                                </tr>
                            </thead>

                            <tbody>
                                <% 
                                    for (int x = 0; x < 5; x++)
                                    {
                                %>
                                <tr>
                                    <th style="text-align: center;">
                                        <% Response.Write(x + 1); %>
                                    </th>
                                    <td>
                                        Assignment <% Response.Write(x + 1); %> 
                                    </td>
                                    <td>
                                        Assignment <% Response.Write(x + 1); %>.docx
                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                </tr>

                                <% } %>
                            </tbody>

                        </table>
                    </div>


                </div>
            </div>

        </div>
</asp:Content>

<%-- Lecturer --%>
