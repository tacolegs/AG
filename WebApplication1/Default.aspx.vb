Imports System.Threading
Public Class _Default
    Inherits Page
    Dim r As New Random
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Function rndm()
        Return r.Next(1, 24)
    End Function








    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        nottrip.Insert(nottrip.articles, {{"emails", TextBox1.Text}}, "subscribers")
        Button1.Text = "Success!"
        Button1.Enabled = False
    End Sub
End Class