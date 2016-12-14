Public Class rules
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("LOGGED_IN") = Nothing Then Response.Redirect("Default.aspx")
        Dim voteid As String = "vote" & Session("USER_ID")
        SqlDataSource2.SelectCommand = "SELECT * FROM [issues] WHERE ([" & voteid & "] IS NULL)"
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim voteid As String = "vote" & Session("USER_ID")

        Dim yes As Integer = nottrip.Read(nottrip.articles, "issues", "yes", "id", DropDownList1.SelectedValue)
        yes = yes + 1
        nottrip.Update(nottrip.articles, "issues", {{"yes", yes}}, "id", DropDownList1.SelectedValue)
        nottrip.Update(nottrip.articles, "issues", {{voteid, "True"}}, "id", DropDownList1.SelectedValue)

        Dim yesres As Integer = nottrip.Read(nottrip.articles, "issues", "yes", "id", DropDownList1.SelectedValue)
        Dim nores As Integer = nottrip.Read(nottrip.articles, "issues", "no", "id", DropDownList1.SelectedValue)
        If yesres + nores = 7 Then
            If yesres > nores Then
                nottrip.Update(nottrip.articles, "issues", {{"result", "True"}}, "id", DropDownList1.SelectedValue)
            Else
                nottrip.Update(nottrip.articles, "issues", {{"result", "false"}}, "id", DropDownList1.SelectedValue)
            End If
        End If
        ListView1.DataBind()
        ListView2.DataBind()
        ListView3.DataBind()
        DropDownList1.DataBind()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim voteid As String = "vote" & Session("USER_ID")

        Dim no As Integer = nottrip.Read(nottrip.articles, "issues", "no", "id", DropDownList1.SelectedValue)
        no = no + 1
        nottrip.Update(nottrip.articles, "issues", {{"no", no}}, "id", DropDownList1.SelectedValue)
        nottrip.Update(nottrip.articles, "issues", {{voteid, "False"}}, "id", DropDownList1.SelectedValue)

        Dim yesres As Integer = nottrip.Read(nottrip.articles, "issues", "yes", "id", DropDownList1.SelectedValue)
        Dim nores As Integer = nottrip.Read(nottrip.articles, "issues", "no", "id", DropDownList1.SelectedValue)
        If yesres + nores = 7 Then
            If yesres > nores Then
                nottrip.Update(nottrip.articles, "issues", {{"result", "True"}}, "id", DropDownList1.SelectedValue)
            Else
                nottrip.Update(nottrip.articles, "issues", {{"result", "false"}}, "id", DropDownList1.SelectedValue)
            End If
        End If
        ListView1.DataBind()
        ListView2.DataBind()
        ListView3.DataBind()
        DropDownList1.DataBind()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim fname As String = nottrip.Read(nottrip.articles, "users", "fname", "id", Session("USER_ID"))
        Dim newid As String = nottrip.getnewid(nottrip.articles, "id", "issues")
        nottrip.Insert(nottrip.articles, {{"id", newid}, {"text", TextBox1.Text}, {"yes", 0}, {"no", 0}, {"pby", fname}}, "issues")
        TextBox1.Text = Nothing
        ListView1.DataBind()
        ListView2.DataBind()
        ListView3.DataBind()
        DropDownList1.DataBind()
    End Sub
End Class