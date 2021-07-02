Public Class SimulatedLoan
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim customer As String
        Dim simulationValue As Integer
        customer = Request.QueryString("qsSimulationUserNameVar")
        simulationValue = Request.QueryString("qssimulationValue")
        Dim applicationNumber As Integer
        applicationNumber += 1
        Dim time As Date
        time = DateAndTime.Now
        SimulationTxt.Text = "Dear customer " & customer & ", we inform you that, according to the data from the credit application no. " & applicationNumber & " from " _
        & time & " the value of the monthly payment is: " & simulationValue
    End Sub

End Class