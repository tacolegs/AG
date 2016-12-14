Public Class read
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Title = nottrip.Read(nottrip.articles, "articlez", "title", "artid", Request.QueryString("id"))
        article.InnerHtml = nottrip.Read(nottrip.articles, "articlez", "text", "artid", Request.QueryString("id"))
        Literal1.Text = "<style>
                            .heck {
                               background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(../images/slider/article/" & Request.QueryString("id") & ".jpg);
                             }
                         </style>"
    End Sub
    Public Function gettext() As String
        Return nottrip.Read(nottrip.articles, "articlez", "text", "artid", Request.QueryString("id"))
    End Function
    Public Function getpic() As String
        Dim autid As String = nottrip.Read(nottrip.articles, "articlez", "autid", "artid", Request.QueryString("id"))
        Return autid


    End Function
    Public Function gettitle() As String
        Return nottrip.Read(nottrip.articles, "articlez", "title", "artid", Request.QueryString("id"))
    End Function

    Public Function getauthor() As String
        Dim autid As String = nottrip.Read(nottrip.articles, "articlez", "autid", "artid", Request.QueryString("id"))
        Return nottrip.Read(nottrip.articles, "users", "fname", "id", autid)
    End Function
    Public Function getdate() As String
        Return nottrip.Read(nottrip.articles, "articlez", "date", "artid", Request.QueryString("id"))
    End Function
    Public Function getmeta() As String
        Dim this As String = Request.QueryString("id")
        Dim tags = nottrip.Read(nottrip.articles, "articlez", "tags", "artid", this)
        Return tags
    End Function
    Public Function gettags() As String
        Dim tagss As String = nottrip.Read(nottrip.articles, "articlez", "tags", "artid", Request.QueryString("id"))
        Dim tags As Array = tagss.Split(New Char() {", "})
        Dim i As String = " "
        For Each tag As String In tags
            tag = "<a class='what' href='tag.aspx?tag=" & tag & "'>" & tag & "</a>  "
            i = i & tag
        Next
        Return i
    End Function
    Public Function geturl() As String
        Return "http://www.facebook.com/sharer.php?u=https://allegedgentlemen.com/read.aspx?id=" & Request.QueryString("id")
    End Function

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim newid As String = nottrip.getnewid(nottrip.articles, "id", "comments")
        nottrip.Insert(nottrip.articles, {{"id", newid}, {"artid", Request.QueryString("id")}, {"uname", TextBox2.Text}, {"comment", TextBox1.Text}, {"date", DateTime.Now}}, "comments")
        ListView1.DataBind()
        TextBox1.Text = Nothing
        TextBox2.Text = Nothing
    End Sub
    Public Function getimage()
        Return Request.QueryString("id")
    End Function


End Class