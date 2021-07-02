<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="GenerateBankAccount.aspx.vb" Inherits="BankingProject.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        body {
            background:black;
        }

        .auto-style1 {
            text-align: center;
            height: 21px;
        }
        #NewT {
            padding-right:20px;
        }
        #THistory {
            padding-right:20px;
        }
        #ASettings {
            padding-right:20px;
        }
        .AccountSettings {
            padding-top: 2%;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align: center;
            margin-left: 10%;
            margin-right: 10%;
            padding-bottom: 5%;
            text-align: center;
            display: flex;
            justify-content: center;
        }

        .SettingsTable {
            align-self: center;
        }

        .auto-style2 {
            width: 185px;
        }
        .auto-style3 {
            margin-left: 40px;
        }
    
        .MyAccountDiv {
            padding-top: 2%;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align: center;
            margin-left: 10%;
            margin-right: 10%;
            padding-bottom: 2%;
        }
        .GAccBtn {
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align: center;
            margin-left: 10%;
            margin-right: 10%;
            padding-bottom: 2%;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class ="MyAccountDiv">
            <asp:HyperLink ID="NewT" runat="server" NavigateUrl="NewTransaction.aspx">New Transaction</asp:HyperLink>
            <asp:HyperLink ID="THistory" runat="server" NavigateUrl="TransactionHistory.aspx">Transaction History</asp:HyperLink>
            <asp:HyperLink ID="ASettings" runat="server" NavigateUrl="MyAccount.aspx">Account Settings</asp:HyperLink>
            <asp:HyperLink ID="AStatement" runat="server" NavigateUrl="AccountStatementSelecter.aspx">Account Statement</asp:HyperLink>
            <asp:HyperLink ID="GBankAccount" runat="server" NavigateUrl="GenerateBankAccount.aspx">Generate Bank Account</asp:HyperLink>
            <asp:Button ID="LogOut" runat="server" BorderStyle="None" Text="Log Out" />
        </div>
        
        <div class="AccountSettings" dir="auto">

            <br />
            <br />

            <br />
            <table class="SettingsTable">
                <thead>
                    <tr>
                        <th class="auto-style2">Account IBAN</th>
                        <th>
            <asp:TextBox ID="GBAIBAN" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="auto-style2">Account Type</th>
                        <th class="auto-style3">
                            <asp:DropDownList ID="GBAAccountType" runat="server" Width="210px">
                                <asp:ListItem>Pension account</asp:ListItem>
                                <asp:ListItem>Salary account</asp:ListItem>
                                <asp:ListItem>Regular deposit USD</asp:ListItem>
                                <asp:ListItem>Regular deposit Euro</asp:ListItem>
                                <asp:ListItem>Regular deposit RON</asp:ListItem>
                                <asp:ListItem>Student deposit</asp:ListItem>
                            </asp:DropDownList>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Opening Date</th>
                        <th><asp:TextBox ID="GBAOpeningDate" runat="server" Width="210px" TextMode="Date"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Interest Rate</th>
                        <th><asp:TextBox ID="GBAInterestRate" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                </tbody>
            </table>
            <br />
            <asp:SqlDataSource ID="DSBankAccGen" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" InsertCommand="INSERT INTO BankAccounts(AccountIBAN, AccountType, OpeningDate, InterestRate, OwnerId) VALUES (@AccountIBAN,@AccountType,@OpeningDate,@InterestRate,@OwnerId)" SelectCommand="SELECT * FROM [AccountOwners]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="GBAIBAN" Name="AccountIBAN" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GBAAccountType" Name="AccountType" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="GBAOpeningDate" DefaultValue="" Name="OpeningDate" PropertyName="Text" />
                    <asp:ControlParameter ControlID="GBAInterestRate" Name="InterestRate" PropertyName="Text" />
                    <asp:SessionParameter DefaultValue="" Name="OwnerId" SessionField="ownerID" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div class =" GAccBtn">
            <asp:Button ID="GenerateBankAccountBtn" runat="server" Text="Generate Bank Account" />
        </div>
    </form>
</body>
</html>
