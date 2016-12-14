Public Class uBoard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LOGGED_IN") = Nothing Then
            Response.Redirect("~/Default.aspx")
        End If
        Dim uid As String = Session("USER_ID")
        If (Not IsPostBack) Then
            TextBox1.Text = nottrip.Read(nottrip.articles, "users", "email", "id", uid)
            TextBox2.Text = nottrip.Read(nottrip.articles, "users", "pword", "id", uid)
            textbox3.Text = nottrip.Read(nottrip.articles, "users", "bio", "id", uid)
        End If




    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        nottrip.Update(nottrip.articles, "users", {{"email", TextBox1.Text}, {"pword", TextBox2.Text}, {"bio", textbox3.Text}}, "id", Session("USER_ID"))
    End Sub

    Public Function getname(state As String) As String
        If Session("USER_ID") = Nothing Then
            Return Nothing
        Else
            Dim uid As String = Session("USER_ID")
            Dim fname As String = nottrip.Read(nottrip.articles, "users", "fname", "id", uid)
            If state = "first" Then
                Dim first As Array = Split(fname)
                Return "Hey, " & first(0) & "!"
            Else
                Return fname
            End If
        End If

    End Function

    Public Function getpic() As String
        If Session("USER_ID") = Nothing Then
            Return Nothing
        Else
            Return Session("USER_ID")
        End If


    End Function

End Class