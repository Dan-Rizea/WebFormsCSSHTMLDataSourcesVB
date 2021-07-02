Public Class NewTransaction
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub InitTransaction_Click(sender As Object, e As EventArgs) Handles InitTransaction.Click
        NewTransactionDS.Insert()
    End Sub
End Class