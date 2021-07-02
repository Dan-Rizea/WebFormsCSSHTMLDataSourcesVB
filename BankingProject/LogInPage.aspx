<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LogInPage.aspx.vb" Inherits="BankingProject.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background:black;
        }
        .LogInDiv {
            text-align:center;
        }
        .auto-style2 {
            text-align: center;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            margin-top: 15%;
            margin-left: 30%;
            margin-right: 30%;
            padding-top:5%;
            padding-bottom:5%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class ="auto-style2">
            LOG IN SCREEN<br />
            <br />
            Please provide us with your username<br />
            <asp:TextBox ID="LogInUserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="LogInUserNameRFV" runat="server" ControlToValidate="LogInUserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Please provide us with your password<br />
            <asp:TextBox ID="LogInPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="LogInPasswordRFV" runat="server" ControlToValidate="LogInPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="LogInBtn" runat="server" Text="Log In" Width="62px" />
        </div>
    </form>
</body>
</html>
