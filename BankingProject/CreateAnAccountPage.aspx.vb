Public Class CreateAnAccountPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub CreateAnAccountBtn_Click(sender As Object, e As EventArgs) Handles CreateAnAccountBtn.Click
        CreateAccountDS.Insert()
    End Sub

    Protected Sub CreateAccountDS_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles CreateAccountDS.Selecting

    End Sub
End Class