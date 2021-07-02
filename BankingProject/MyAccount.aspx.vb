Imports System.Data.SqlClient

Public Class MyAccount
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim objConnection As SqlConnection = New SqlConnection("Data Source=DESKTOP-FBOPS8T\SQLEXPRESS;Initial Catalog=WebAppTempProj;Integrated Security=True")
        objConnection.Open()
        Dim selectStatement As String = "SELECT UserID FROM Users WHERE UserName ='" + Session("username") + "'"
        Dim objCommand As SqlCommand = New SqlCommand(selectStatement, objConnection)
        Dim reader As SqlDataReader = objCommand.ExecuteReader
        If reader.Read Then
            Session("userID") = reader("UserID")
        Else
            MsgBox("Session not found", MsgBoxStyle.Information, "Error")
        End If
    End Sub

    Protected Sub SettingsSaveButton_Click(sender As Object, e As EventArgs) Handles SettingsSaveButton.Click
        MyAccountDataSource.Insert()
    End Sub

    Protected Sub OwnerSelecter_Click(sender As Object, e As EventArgs) Handles OwnerSelecter.Click
        Session("ownerID") = OwnerSelected.SelectedValue
    End Sub

    Protected Sub AccountSelecter_Click(sender As Object, e As EventArgs) Handles AccountSelecter.Click
        Session("accountID") = SelectedAccount.SelectedValue
    End Sub

    Protected Sub LogOut_Click(sender As Object, e As EventArgs) Handles LogOut.Click
        Session.Clear()
        Response.Redirect("HomePage.aspx")
    End Sub
End Class