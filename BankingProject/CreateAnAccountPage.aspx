<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateAnAccountPage.aspx.vb" Inherits="BankingProject.CreateAnAccountPage" %>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background:black;
        }
        .auto-style1 {
            margin-top: 15%;
            text-align:center;
            margin-left: 30%;
            margin-right: 30%;
            padding-top: 5%;
            padding-bottom: 5%;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            CREATE AN ACCOUNT<br />
            <br />
            Please insert a user name<br />
            <asp:TextBox ID="LogInUserName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LogInUserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Please insert a password<br />
            <asp:TextBox ID="LogInPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LogInPassword" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Please insert an e-mail address<br />
            <asp:TextBox ID="LogInEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="LogInEmail" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="CreateAnAccountBtn" runat="server" Text="Create Account" />
            <asp:SqlDataSource ID="CreateAccountDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT * FROM [AccountOwners]" InsertCommand="INSERT INTO Users(UserName, Password, email, locked) VALUES (@UserName,@Password,@Email,0)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="LogInUserName" Name="UserName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="LogInPassword" Name="Password" PropertyName="Text" />
                    <asp:ControlParameter ControlID="LogInEmail" Name="Email" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
