Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not IsPostBack) Then textbox1.Text = nottrip.Read(nottrip.articles, "articlez", "text", "artid", Request.QueryString("id"))

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        nottrip.Update(nottrip.articles, "articlez", {{"editstatus", "true"}, {"text", textbox1.Text}, {"date", DateTime.Now}}, "artid", Request.QueryString("id"))
        Dim uid As String = nottrip.Read(nottrip.articles, "articlez", "autid", "artid", Request.QueryString("id"))
        Dim umail As String = nottrip.Read(nottrip.articles, "users", "email", "id", uid)
        Dim title As String = nottrip.Read(nottrip.articles, "articlez", "title", "artid", Request.QueryString("id"))
        Dim editor As String = nottrip.Read(nottrip.articles, "users", "fname", "id", Session("USER_ID"))
        eml.sendmail(umail, title & " was just published!", "Your article has been published. It was edited by " & editor & ". www.allegedgentlemen.com/read?id=" & Request.QueryString("id"), "pderham@gmail.com")
        Response.Redirect("~/read.aspx?id=" & Request.QueryString("id"))
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        nottrip.Update(nottrip.articles, "articlez", {{"text", textbox1.Text}}, "artid", Request.QueryString("id"))
        Response.Redirect("~/account/editdash.aspx")
    End Sub

    Public Function getarticle() As String

        Return nottrip.Read(nottrip.articles, "articlez", "text", "artid", 4)
    End Function
End Class