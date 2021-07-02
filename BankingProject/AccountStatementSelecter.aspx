<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AccountStatementSelecter.aspx.vb" Inherits="BankingProject.AccountStatementSelecter" %>

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
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align: center;
            margin-left: 10%;
            margin-right: 10%;
            padding-bottom: 5%;
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

        #AStatement {
            padding-right: 20px;
        }
        #GBankAccount {
            padding-right:20px;
        }
        .auto-style1 {
            margin-bottom: 0px;
        }
        #AccountStatement {
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);;
            text-align:center;
            margin-left:10%;
            margin-right:10%;
        }
        .auto-style2 {
            height: 26px;
            width: 297px;
        }

        .auto-style5 {
            width: 309px;
        }
        .auto-style8 {
            width: 297px;
            height: 25px;
        }
        .auto-style9 {
            margin-left: 200px;
        }
        .auto-style10 {
            width: 309px;
            height: 25px;
        }
        </style>
</head>
<body>
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
        <div id ="AccountStatement">

            <br />

            <asp:Label ID="Label1" runat="server" Text="Account Statement" Font-Size="X-Large"></asp:Label>
            <br />
            <br />
            Please insert two dates<br />
            Starting date:<asp:TextBox ID="SDate" runat="server" CssClass="auto-style1" TextMode="Date"></asp:TextBox>
            <br />
            Closing date:<asp:TextBox ID="CLDate" runat="server" TextMode="Date"></asp:TextBox>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="GridViewDS" HorizontalAlign="Center">
                <Columns>
                    <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" />
                    <asp:BoundField DataField="TransactionType" HeaderText="TransactionType" SortExpression="TransactionType" />
                    <asp:BoundField DataField="Explanation" HeaderText="Explanation" SortExpression="Explanation" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="GridViewDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT [TransactionDate], [TransactionType], [Explanation], [Amount] FROM [AccountTransactions] WHERE (([AccountId] = @AccountId) AND ([TransactionDate] &gt;= @TransactionDate) AND ([TransactionDate] &lt;= @TransactionDate2))">
                <SelectParameters>
                    <asp:SessionParameter Name="AccountId" SessionField="accountID" Type="Int32" />
                    <asp:ControlParameter ControlID="SDate" Name="TransactionDate" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="CLDate" Name="TransactionDate2" PropertyName="Text" Type="DateTime" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="GenerateStatement" runat="server" Text="Generate the account statement" />
            <br />               

            <table class="auto-style9">
                <thead>
                    <tr>
                        <th class="auto-style8">Total Credit In Lei</th>
                        <th class="auto-style10">
            <asp:Label ID="TCredit" runat="server" Text="Total Credit In Lei"></asp:Label>
               
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="auto-style2">Total Debit In Lei</th>
                        <th class="auto-style5">
               
            <asp:Label ID="TDebit" runat="server" Text="Total Debit In Lei"></asp:Label>
             
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Total Debit/Credit</th>
                        <th class="auto-style5">
             
            <asp:Label ID="TDC" runat="server" Text="Total Debit/Credit"></asp:Label>

                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </form>
</body>
</html>
