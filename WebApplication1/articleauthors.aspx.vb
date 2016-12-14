Public Class articleauthors
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("autid") = Nothing Then Response.Redirect("~/default.aspx")
    End Sub

    Public Function getaut() As String
        Dim connstring As String = "Data Source=INTERSERVER\SQLEXPRESS;Initial Catalog=AG;Integrated Security=True"
        Dim this As String = Request.QueryString("autid")
        Dim autname As String = nottrip.Read(connstring, "articlez", "author", "autid", this)
        Return autname
    End Function

End Class