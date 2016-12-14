Imports System.IO
Imports System.Web.Script.Services
Imports System.Web.Services

Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LOGGED_IN") = Nothing Then Response.Redirect("~/Default.aspx")
        Dim qs As String = Request.QueryString("did")
        If qs = Nothing Then

        Else
            TextBox2.Text = nottrip.Read(nottrip.articles, "drafts", "title", "id", qs)
            TextBox3.Text = nottrip.Read(nottrip.articles, "drafts", "tags", "id", qs)
            txtCKEditor.Text = nottrip.Read(nottrip.articles, "drafts", "text", "id", qs)
            DropDownList1.SelectedValue = nottrip.Read(nottrip.articles, "drafts", "cat", "id", qs)
        End If

    End Sub
    Sub Main()

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim artdate As String = Date.Today
        Dim autid As String = Session("USER_ID")
        Dim autname As String = nottrip.Read(nottrip.articles, "users", "fname", "id", autid)
        Dim maxid As Integer = nottrip.getnewid(nottrip.articles, "artid", "articlez")
        Dim editing As String
        If CheckBox1.Checked = True Then editing = "true" Else editing = "false"

        nottrip.Insert(nottrip.articles, {{"artid", maxid}, {"title", TextBox2.Text}, {"date", artdate}, {"author", autname}, {"cat", DropDownList1.SelectedValue}, {"tcat", DropDownList1.SelectedItem.Text}, {"autid", autid}, {"tags", TextBox3.Text}, {"editstatus", editing}, {"text", txtCKEditor.Text}}, "articlez")
        If CheckBox1.Checked = True Then
            Response.Redirect("~/Default.aspx")
        Else
            eml.sendmail("writetolaugh@gmail.com,cruce.signati95@gmail.com ", "New Article for Editing", "An article was submitted and awaits your edits. Also, programming is really easy. www.allegedgentlemen.com/account/edit.aspx?id=" & maxid, "pderham@gmail.com")
            Response.Redirect("~/read.aspx?id=" & maxid)

        End If

    End Sub


    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim autid As String = Session("USER_ID")
        Dim autname As String = nottrip.Read(nottrip.articles, "users", "fname", "id", autid)
        Dim artdate As String = Date.Today
        Dim maxid As Integer = nottrip.getnewid(nottrip.articles, "id", "drafts")
        If nottrip.HasRecords(nottrip.articles, "drafts", {"title"}, {TextBox2.Text}) = True Then
            nottrip.Update(nottrip.articles, "drafts", {{"title", TextBox2.Text}, {"date", artdate}, {"cat", DropDownList1.SelectedValue}, {"tags", TextBox3.Text}, {"text", txtCKEditor.Text}}, "title", TextBox2.Text)
        Else
            nottrip.Insert(nottrip.articles, {{"id", maxid}, {"title", TextBox2.Text}, {"date", artdate}, {"cat", DropDownList1.SelectedValue}, {"autid", autid}, {"tags", TextBox3.Text}, {"text", txtCKEditor.Text}}, "drafts")
        End If

        Button2.Text = "Save Draft (Saved " & DateTime.Now & ")"
    End Sub
End Class