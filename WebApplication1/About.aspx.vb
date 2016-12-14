Public Class About
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
    Public Function getbio(user As String) As String
        Return nottrip.Read(nottrip.articles, "users", "bio", "id", user)
    End Function
End Class