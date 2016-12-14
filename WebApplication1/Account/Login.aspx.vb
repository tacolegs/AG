Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.Owin.Security
Imports Owin

Partial Public Class Login
    Inherits Page
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim pword As String = nottrip.Read(nottrip.articles, "users", "pword", "uname", TextBox1.Text)
        Dim uid As String = nottrip.Read(nottrip.articles, "users", "id", "uname", TextBox1.Text)
        Dim rollid As String = nottrip.Read(nottrip.articles, "users", "rollid", "uname", TextBox1.Text)
        Dim worthiness As String = nottrip.Read(nottrip.articles, "users", "council", "uname", TextBox1.Text)
        If TextBox1.Text <> Nothing And TextBox2.Text <> Nothing Then
            If TextBox2.Text = pword Then
                Session("LOGGED_IN") = "True"
                Session("USER_ID") = uid
                Session("ROLL_ID") = rollid
                Session("COUNCIL") = worthiness
                Response.Redirect("~/Default.aspx")
            Else
                Label3.Text = "Wrong username or password... I guess. IDK. Too lazy to write code to check."
            End If
        Else
            Label3.Text = "Type things. It's not hard."
        End If

    End Sub
End Class
