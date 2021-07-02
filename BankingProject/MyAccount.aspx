<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MyAccount.aspx.vb" Inherits="BankingProject.MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            background:black;
        }

        .MyAccountDiv {
            padding-top:2%;
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
            padding-right:20px;
        }
        #AStatement {
            padding-right:20px;
        }
        #GBankAccount {
            padding-right:20px;
        }
        .AccountSettings {
            text-align:center;
            display: flex;
            justify-content: center;
        }
        .SettingsTable {
            align-self: center;
        }

        .SettingsSaveButtonDiv {
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            margin-left: 10%;
            margin-right: 10%;
            align-self: center;
            text-align: center;
            padding-bottom: 5%;
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
        .auto-style5 {
            padding-bottom: 5%;
            margin-left: 10%;
            margin-right: 10%;
            background: linear-gradient(90deg, rgba(228,255,5,1) 0%, rgba(39,199,36,1) 54%, rgba(0,212,255,1) 100%);
            text-align: center;
            display: flex;
            justify-content: center;
        }
        </style>
</head>
<body style="height: 541px; margin-top: 64px">
    <form id="form1" runat="server">
        <div class ="MyAccountDiv">
            <asp:HyperLink ID="NewT" runat="server" NavigateUrl="NewTransaction.aspx">New Transaction</asp:HyperLink>
            <asp:HyperLink ID="THistory" runat="server" NavigateUrl="TransactionHistory.aspx">Transaction History</asp:HyperLink>
            <asp:HyperLink ID="ASettings" runat="server" NavigateUrl="MyAccount.aspx">Account Settings</asp:HyperLink>
            <asp:HyperLink ID="AStatement" runat="server" NavigateUrl="AccountStatementSelecter.aspx">Account Statement</asp:HyperLink>
            <asp:HyperLink ID="GBankAccount" runat="server" NavigateUrl="GenerateBankAccount.aspx">Generate Bank Account</asp:HyperLink>
            <asp:Button ID="LogOut" runat="server" BorderStyle="None" Text="Log Out" />
        </div>
        <div class="auto-style5" dir="auto">

            <br />
            <br />

            <br />
            <table class="SettingsTable">
                <thead>
                    <tr>
                        <th class="auto-style2">Last Name</th>
                        <th>
            <asp:TextBox ID="MALastNameTxt" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="auto-style2">First Name</th>
                        <th><asp:TextBox ID="MAFirstNameTxt" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Date of Birth</th>
                        <th><asp:TextBox ID="MADateOfBirthTxt" runat="server" Width="210px" TextMode="Date"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">ID Card</th>
                        <th><asp:TextBox ID="MAIdCardTxt" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Owner PIN</th>
                        <th><asp:TextBox ID="MAOwnerPinTxt" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Locality</th>
                        <th><asp:TextBox ID="MALocalityTxt" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style3">Address</th>
                        <th class="auto-style4"><asp:TextBox ID="MAAddressTxt" runat="server" Width="440px"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th class="auto-style2">Phone</th>
                        <th>
            <asp:TextBox ID="MAPhoneTxt" runat="server" Width="210px"></asp:TextBox>
                        </th>
                    </tr>
                </tbody>
            </table>
            <br />
            <br />
             
            <asp:SqlDataSource ID="AccountOwnerSessionDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT [OwnerId], [FirstName] FROM [AccountOwners] WHERE ([UserID] = @UserID)">
                <SelectParameters>
                    <asp:SessionParameter Name="UserID" SessionField="userID" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1AccountIdSessionDS" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT [AccountId], [AccountIBAN] FROM [BankAccounts] WHERE ([OwnerId] = @OwnerId)">
                <SelectParameters>
                    <asp:SessionParameter Name="OwnerId" SessionField="ownerID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
        <div class ="auto-style5">
        <table class="SettingsTable">
                <thead>
                    <tr>
                        <th class="auto-style2">Please select an owner</th>
                        <th>
            <asp:DropDownList ID="OwnerSelected" runat="server" AutoPostBack="True" DataSourceID="AccountOwnerSessionDS" DataTextField="FirstName" DataValueField="OwnerId">
            </asp:DropDownList>
                        </th>
                        <th>
            <asp:Button ID="OwnerSelecter" runat="server" Text="Select this owner" />
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th class="auto-style2">Please select an account</th>
                        <th><asp:DropDownList ID="SelectedAccount" runat="server" DataSourceID="SqlDataSource1AccountIdSessionDS" DataTextField="AccountIBAN" DataValueField="AccountId">
            </asp:DropDownList>
                        </th>
                        <th>
            <asp:Button ID="AccountSelecter" runat="server" Text="Select this account" />
                        </th>
                    </tr>
                </tbody>
            </table>
            </div>
        <div class ="SettingsSaveButtonDiv">
            <asp:SqlDataSource ID="MyAccountDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:WebAppTempProjConnectionString %>" SelectCommand="SELECT * FROM [AccountOwners]" UpdateCommand="UPDATE AccountOwners 
SET LastName =@LastName, FirstName =@FirstName, DateOfBirth =@DateOfBirth, IDCard =@IDCard, OwnerPIN =@OwnerPIN, Locality =@Locality, Address =@Address, Phone =@Phone
WHERE UserID = @UserID" InsertCommand="INSERT INTO AccountOwners (LastName, FirstName, DateOfBirth, IDCard, OwnerPIN, Locality, Address, Phone, UserID)
VALUES (@LastName, @FirstName, @DateOfBirth, @IDCard, @OwnerPIN, @Locality, @Address, @Phone, @UserID)
">
                <InsertParameters>
                    <asp:ControlParameter ControlID="MALastNameTxt" Name="LastName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAFirstNameTxt" Name="FirstName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MADateOfBirthTxt" Name="DateOfBirth" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAIdCardTxt" Name="IDCard" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAOwnerPinTxt" Name="OwnerPIN" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MALocalityTxt" Name="Locality" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAAddressTxt" Name="Address" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAPhoneTxt" Name="Phone" PropertyName="Text" />
                    <asp:SessionParameter Name="UserID" SessionField="userID" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="MALastNameTxt" Name="LastName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAFirstNameTxt" Name="FirstName" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MADateOfBirthTxt" Name="DateOfBirth" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAIdCardTxt" Name="IDCard" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAOwnerPinTxt" Name="OwnerPIN" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MALocalityTxt" Name="Locality" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAAddressTxt" Name="Address" PropertyName="Text" />
                    <asp:ControlParameter ControlID="MAPhoneTxt" Name="Phone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="AccountData" Name="UserID" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Button ID="SettingsSaveButton" runat="server" Text="Save your settings" />
        </div>
    </form>
</body>
</html>
