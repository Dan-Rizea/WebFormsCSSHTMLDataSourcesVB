<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="HomePage.aspx.vb" Inherits="BankingProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="MainCSS.css" rel="stylesheet" />
    <style type="text/css">
        body {
            font-family:Helvetica Neue;
            background: black;
        }
        .auto-style3 {
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            margin-left:15%;
            margin-right:15%;
            height: 36px;
            margin-top: 0px;
            font-size:1.2em;
        }
        .auto-style4 {
            float: right;
        }

        .credittext1 {
            font-size: 2em;
        }
        .auto-style9 {
            margin-left: 15%;
            margin-right: 15%;
            text-align: center;
            font-size: 1.6em;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            /*color:white;*/
        }

        .homeimages {
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            margin-left: 15%;
            margin-right: 15%;
        }
    </style>
</head>
<body >
        <form id="form1" runat="server">
        <div class="auto-style3">
            <asp:HyperLink ID="CreateAccount" runat="server" CssClass="auto-style4" Width="178px" NavigateUrl="CreateAnAccountPage.aspx">Create an Account</asp:HyperLink>
            <asp:HyperLink ID="LogIn" runat="server" CssClass="auto-style4" Width="69px" NavigateUrl="LogInPage.aspx">Log In</asp:HyperLink>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LeftMenu1" runat="server" Text="Label">Strada Spinis nr.23</asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="LeftMenu2" runat="server" Text="Label">BancaEtc@gmail.com</asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="LeftMenu3" runat="server" Text="Label">0770409325</asp:Label>
        </div>
        <div class ="homeimages">
        <br />
        <asp:ImageButton ID="ImageButton3" runat="server" CssClass="auto-style8" Height="451px" ImageUrl="https://picz.in/data/media/4/World_Bank_building_at_Washington.jpg" Width="100%" />
        <br />
        </div>
        <div class="auto-style9">
            <asp:Label ID="Label1" runat="server" Text="Credit Simulator" CssClass="credittext1" Font-Bold="True"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Here is a sample of a calculation that you can customize with your own personal data thus finding the total proceedings"></asp:Label>
            <br />
            Name<br />
            <asp:TextBox ID="SimulationUserName" runat="server"></asp:TextBox>
            <br />
            Proposed sum<br />
            <asp:TextBox ID="ProposedSum" runat="server"></asp:TextBox>
            <br />
            Credit period<br />
            <asp:DropDownList ID="CreditPeriod" runat="server" Height="18px" Width="125px">
                <asp:ListItem Value="1">1 year</asp:ListItem>
                <asp:ListItem Value="2">2 years</asp:ListItem>
                <asp:ListItem Value="3">3 years</asp:ListItem>
                <asp:ListItem Value="4">4 years</asp:ListItem>
                <asp:ListItem Value="5">5 years</asp:ListItem>
            </asp:DropDownList>
            <br />
            Type of Loan<br />
            <asp:DropDownList ID="TypeOfLoan" runat="server" Height="16px" Width="127px">
                <asp:ListItem Value="0.1">LoanType1</asp:ListItem>
                <asp:ListItem Value="0.12">LoanType2</asp:ListItem>
                <asp:ListItem Value="0.16">LoanType3</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Calculate" />
            <br />
            </div>
        <br />
        </form>
</body>
</html>
