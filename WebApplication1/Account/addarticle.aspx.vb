Public Class addarticle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Shared articles As New String("Data Source=INTERSERVER\SQLEXPRESS;Initial Catalog=AG;Integrated Security=True")
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
    End Sub
End Class