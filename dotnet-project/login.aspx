<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="dotnet_project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
        integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
        crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
        integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/login.css" />

</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="loginCard" class="col col-sm-5 col-xl-4 form-box shadow" style="margin: auto; text-align: center;">
                <img src="/img/logo.png" alt="" />
                <hr />
                <asp:TextBox ID="user" runat="server" class="form-control"
                    name="user" placeholder="User ID" required="required"></asp:TextBox>
                <br />
                <asp:TextBox ID="pass" runat="server" class="form-control"
                    name="pass" TextMode="Password" placeholder="Password" required="required"></asp:TextBox>
                <hr />
                <asp:Button ID="loginBtn" runat="server" type="submit" class="btn btn-custom btn-block login-btn"
                    Text="Login" OnClick="loginBtn_Click" />
                <br />

                <%-- untuk testing --%>
                <asp:Label ID="tempLabel" runat="server" Text=""></asp:Label>

            </div>

        </div>
    </form>
</body>
</html>
