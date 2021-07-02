<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewTransaction.aspx.vb" Inherits="BankingProject.NewTransaction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background:black;
        }

        .MyAccountDiv {
            padding-top: 2%;
            background:linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align:center;
            margin-left:10%;
            margin-right:10%;
            padding-bottom:5%;
        }
        #NewT {
            padding-right: 20px;
        }

        #THistory {
            padding-right: 20px;
        }

        #ASettings {
            padding-right: 20px;
        }

        #GBankAccount {
            padding-right: 20px;
        }

        .auto-style1 {
            text-align: center;
            height: 21px;
        }
        .AccountSettings {
            margin-left: 10%;
            margin-right: 10%;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align:center;
            display: flex;
            justify-content: center;
        }
        .SettingsTable {
            align-self: center;
        }
        .InitTransBut {
            margin-left: 10%;
            margin-right: 10%;
            padding-top: 2%;
            padding-bottom: 5%;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align: center;
            display: flex;
            justify-content: center;
        }

        .auto-style2 {
            width: 185px;
        }

        .auto-style3 {
            width: 185px;
            height: 26px;
        }

        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body style="margin-top: 75px">
    <form id="form1" runat="server">
        <div>
        <div class ="MyAccountDiv">
            <asp:HyperLink ID="NewT" runat="server" NavigateUrl="NewTransaction.aspx">New Transaction</asp:HyperLink>
            <asp:HyperLink ID="THistory" runat="server" NavigateUrl="TransactionHistory.aspx">Transaction History</asp:HyperLink>
            <asp:HyperLink ID="ASettings" runat="server" NavigateUrl="MyAccount.aspx">Account Settings</asp:HyperLink>
            <asp:HyperLink ID="AStatement" runat="server" NavigateUrl="AccountStatementSelecter.aspx">Account Statement</asp:HyperLink>
            <asp:HyperLink ID="GBankAccount" runat="server" NavigateUrl="GenerateBankAccount.aspx">Generate Bank Account</asp:HyperLink>
            <asp:Button ID="LogOut" runat="server" BorderStyle="None" Text="Log Out" />
        </div>
        </div>

        <div class="AccountSettings" dir="auto">

            <br />
            <br />

            <br />
            <table class="SettingsTable">
                <thead>
                    <tr>
                        <th class="auto-style2">Transaction Type</th>
                        <th>
            <asp:TextBox ID="NTTransactionType" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="auto-style2">Transaction Date</th>
                        <th><asp:TextBox ID="NTTransactionDate" runat="server" Width="210px" TextMode="DateTime"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Amount</th>
                        <th><asp:TextBox ID="NTAmount" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Explanation</th>
                        <th><asp:TextBox ID="NTExplanation" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Counterpart ID</th>
                        <th><asp:TextBox ID="NTCounterpart" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style3">Fee Amount</th>
                        <th class="auto-style4"><asp:TextBox ID="TextBox7" runat="server" Width="440px"></asp:TextBox>
                        </th>
                    </tr>
                </tbody>
            </table>
            <asp:SqlDataSource ID="NewTransactionDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" InsertCommand="INSERT INTO AccountTransactions(TransactionType, TransactionDate, Amount, AccountId, Explanation, ExternalCounterpartID) VALUES (@TransactionType,@TransactionDate,@TAmount,@AccountID,@Explanation,@CounterpartID)" SelectCommand="SELECT * FROM [AccountOwners]">
                <InsertParameters>
                    <asp:ControlParameter ControlID="NTTransactionType" Name="TransactionType" PropertyName="Text" />
                    <asp:ControlParameter ControlID="NTAmount" Name="Amount" PropertyName="Text" />
                    <asp:SessionParameter Name="AccountID" SessionField="accountID" />
                    <asp:ControlParameter ControlID="NTExplanation" Name="Explanation" PropertyName="Text" />
                    <asp:ControlParameter ControlID="NTCounterpart" DefaultValue="" Name="CounterpartID" PropertyName="Text" />
                    <asp:ControlParameter ControlID="NTTransactionDate" DefaultValue="" Name="TransactionDate" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
        <div class="InitTransBut">
            <br />
            <asp:Button ID="InitTransaction" runat="server" Text="Initiate Transaction" />
            <br />
        </div>

    </form>
</body>
</html>
