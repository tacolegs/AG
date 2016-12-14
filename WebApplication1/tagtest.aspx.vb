Public Class tagtest
    Inherits System.Web.UI.Page
    Public Shared Function gettags() As String
        Dim tagss As String = nottrip.Read(nottrip.articles, "articlez", "tags", "artid", "4")
        Dim tags As Array = tagss.Split
        Dim i As String = " "
        For Each tag As String In tags
            tag = "<a href='Default.aspx?tag=" & tag & "'>" & tag & "</a>,  "
            i = i & tag
        Next
        Return i
    End Function
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

End Class