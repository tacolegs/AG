Public Class editdash
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("ROLL_ID") <> "2" Then Response.Redirect("~/default.aspx")
    End Sub

End Class