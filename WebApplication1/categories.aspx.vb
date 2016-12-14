Public Class categories
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("cat") = Nothing Then Response.Redirect("~/default.aspx")
    End Sub
    Protected Function getcat() As String
        Dim connstring As String = "Data Source=INTERSERVER\SQLEXPRESS;Initial Catalog=AG;Integrated Security=True"
        Dim this As String = Request.QueryString("cat")
        Dim catname As String = nottrip.Read(connstring, "articlez", "tcat", "cat", this)
        Return catname
    End Function

End Class