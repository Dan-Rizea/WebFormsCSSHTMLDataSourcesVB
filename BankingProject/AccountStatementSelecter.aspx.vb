Imports System.Data.SqlClient

Public Class AccountStatementSelecter
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GenerateStatement_Click(sender As Object, e As EventArgs) Handles GenerateStatement.Click
        Dim objConnection As SqlConnection = New SqlConnection("Data Source=DESKTOP-FBOPS8T\SQLEXPRESS;Initial Catalog=WebAppTempProj;Integrated Security=True")
        objConnection.Open()
        Dim selectStatement As String = "SELECT SUM(Amount) AS Amount FROM AccountTransactions WHERE TransactionDate >= '" + SDate.Text + "' AND TransactionDate <= '" + CLDate.Text + "' AND (TransactionType = 'Account opening' OR TransactionType = 'Cash deposit EURO/USD' OR TransactionType = 'Cash deposit RON') AND AccountID ='" + Session("accountID") + "'"
        Dim selectStatement1 As String = "  SELECT SUM(Amount) AS Amount FROM AccountTransactions WHERE TransactionDate >= '" + SDate.Text + "' AND TransactionDate <= '" + CLDate.Text + "' AND (TransactionType = 'Account closing' OR TransactionType = 'Card payment' OR TransactionType = 'Cash withdrawal (ATM)- RON' OR TransactionType = 'Cash withdrawal (counter) - RON' OR TransactionType = 'Funds transfer') AND AccountID ='" + Session("accountID") + "'"
        Dim objCommand As SqlCommand = New SqlCommand(selectStatement, objConnection)
        Dim objCommand1 As SqlCommand = New SqlCommand(selectStatement1, objConnection)
        Dim reader As SqlDataReader = objCommand.ExecuteReader
        If reader.Read Then
            TCredit.Text = reader("Amount")
        Else
            MsgBox("Session not found", MsgBoxStyle.Information, "Error")
        End If
        reader.Close()
        Dim reader1 As SqlDataReader = objCommand1.ExecuteReader
        If reader1.Read Then
            TDebit.Text = reader1("Amount")
        Else
            MsgBox("Session not found", MsgBoxStyle.Information, "Error")
        End If
        TDC.Text = TCredit.Text - TDebit.Text
    End Sub
End Class