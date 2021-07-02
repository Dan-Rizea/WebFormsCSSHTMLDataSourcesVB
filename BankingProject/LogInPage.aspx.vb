Imports System.Data.SqlClient

Public Class LogInPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LogInBtn_Click(sender As Object, e As EventArgs) Handles LogInBtn.Click
        Dim objConnection As SqlConnection = New SqlConnection("Data Source=DESKTOP-FBOPS8T\SQLEXPRESS;Initial Catalog=WebAppTempProj;Integrated Security=True")
        objConnection.Open()
        Dim selectStatement As String = "SELECT * FROM Users WHERE UserName ='" + LogInUserName.Text + "' AND " +
        "Password = '" + LogInPassword.Text + "'"
        Dim objCommand As SqlCommand = New SqlCommand(selectStatement, objConnection)
        Dim reader As SqlDataReader = objCommand.ExecuteReader
        If reader.Read Then
            Session("username") = LogInUserName.Text
            Response.Redirect("MyAccount.aspx")
        Else
            MsgBox("Invalid username or password", MsgBoxStyle.Information, "Error")
        End If
    End Sub

    Protected Sub LogInUserName_TextChanged(sender As Object, e As EventArgs)

    End Sub
End Class