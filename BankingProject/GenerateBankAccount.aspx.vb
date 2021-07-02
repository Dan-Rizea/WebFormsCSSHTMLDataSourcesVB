Public Class WebForm3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GenerateBankAccountBtn_Click(sender As Object, e As EventArgs) Handles GenerateBankAccountBtn.Click
        DSBankAccGen.Insert()
    End Sub
End Class