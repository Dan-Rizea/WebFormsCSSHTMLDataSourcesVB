<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TransactionHistory.aspx.vb" Inherits="BankingProject.WebForm2" %>

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
        .SettingsTable {
            align-self:center;
        }
        .auto-style2 {
            width: 185px;
        }
        .MyAccountDiv {
            padding-top: 2%;
            background:linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align:center;
            margin-left:10%;
            margin-right:10%;
            padding-bottom:5%;
        }
        .FilterTbl {
            padding-top: 2%;
            background:linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align:center;
            margin-left:10%;
            margin-right:10%;
            padding-bottom:5%;
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
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TransactionId" DataSourceID="TransactionHistoryDS" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="TransactionId" HeaderText="TransactionId" InsertVisible="False" ReadOnly="True" SortExpression="TransactionId" />
                <asp:BoundField DataField="TransactionType" HeaderText="TransactionType" SortExpression="TransactionType" />
                <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="AccountId" HeaderText="AccountId" SortExpression="AccountId" />
                <asp:BoundField DataField="Explanation" HeaderText="Explanation" SortExpression="Explanation" />
                <asp:BoundField DataField="ExternalCounterpartID" HeaderText="ExternalCounterpartID" SortExpression="ExternalCounterpartID" />
            </Columns>
        </asp:GridView>
        
        <asp:SqlDataSource ID="TransactionHistoryDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT TransactionId, TransactionType, TransactionDate, Amount, AccountId, Explanation, ExternalCounterpartID FROM AccountTransactions WHERE (AccountId = @AccountId) AND (TransactionType = @TransactionType)">
            <SelectParameters>
                <asp:SessionParameter Name="AccountId" SessionField="accountID" Type="Int32" />
                <asp:ControlParameter ControlID="DropDownList1" Name="TransactionType" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class ="FilterTbl">
        <table class="SettingsTable">
                <thead>
                    <tr>
                        <th class="auto-style2">Please select a filter</th>
                        <th>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TransactionType" DataValueField="TransactionType" AutoPostBack="True">
                            </asp:DropDownList>
                            </th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
         </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT DISTINCT [TransactionType] FROM [AccountTransactions]"></asp:SqlDataSource>      
    </form>
</body>
</html>
