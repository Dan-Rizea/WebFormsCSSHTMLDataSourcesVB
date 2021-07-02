Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click1(sender As Object, e As EventArgs) Handles Button1.Click
        Dim simulationValue As Integer
        Dim simulationUserNameVar As String
        simulationUserNameVar = simulationUserName.Text
        Dim annualInterestRate As Double
        annualInterestRate = TypeOfLoan.SelectedValue * CreditPeriod.SelectedValue
        simulationValue = (ProposedSum.Text * annualInterestRate * ((1 + annualInterestRate) ^ CreditPeriod.SelectedValue)) / (1 - ((1 + annualInterestRate) ^ CreditPeriod.SelectedValue))
        Response.Redirect("SimulatedLoan.aspx?qsSimulationUserNameVar=" & simulationUserNameVar & "&qssimulationValue=" & simulationValue)
    End Sub
End Class