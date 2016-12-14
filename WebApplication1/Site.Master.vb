Imports Microsoft.AspNet.Identity

Public Class SiteMaster
    Inherits MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' The code below helps to protect against XSRF attacks
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        Dim requestCookieGuidValue As Guid
        If requestCookie IsNot Nothing AndAlso Guid.TryParse(requestCookie.Value, requestCookieGuidValue) Then
            ' Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value
            Page.ViewStateUserKey = _antiXsrfTokenValue
        Else
            ' Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N")
            Page.ViewStateUserKey = _antiXsrfTokenValue

            Dim responseCookie = New HttpCookie(AntiXsrfTokenKey) With {
                 .HttpOnly = True,
                 .Value = _antiXsrfTokenValue
            }
            If FormsAuthentication.RequireSSL AndAlso Request.IsSecureConnection Then
                responseCookie.Secure = True
            End If
            Response.Cookies.[Set](responseCookie)
        End If

        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub

    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Set Anti-XSRF token
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)
        Else
            ' Validate the Anti-XSRF token
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
            End If
        End If
    End Sub


    Protected Sub Unnamed_LoggingOut(sender As Object, e As LoginCancelEventArgs)
        Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Session("LOGGED_IN") = "True" Then
            button1.Visible = True
            button5.Visible = True
            button7.Visible = True
            button8.Visible = False
            button2.Visible = True
            button3.Visible = False
            button9.Visible = True
            button10.Visible = True
            userdrop.Visible = True
        End If


        If Session("ROLL_ID") = "2" Then
            dammit.Visible = True
            button6.Visible = True
        End If


        'If Session("COUNCIL") = True Then Li1.Visible = True


        If Session("ROLL_ID") = "2" Then
            Dim editcount As Integer = nottrip.RowsAffectedCount()
            If editcount > 0 Then
                button4.InnerText = "Edit (" & editcount & ")"
                button6.InnerText = "Edit (" & editcount & ")"

            Else
                button4.InnerText = "Edit"
                button6.InnerText = "Edit"
            End If
        End If


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

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles button2.ServerClick, button7.ServerClick
        Session("LOGGED_IN") = Nothing
        Session("USER_ID") = Nothing
        Session("ROLL_ID") = Nothing
        Response.Redirect("~/Default.aspx")
    End Sub


    Public Function getemail() As String
        If Session("USER_ID") = Nothing Then
            Return Nothing
        Else
            Dim email As String = nottrip.Read(nottrip.articles, "users", "email", "id", Session("USER_ID"))
            Return email
        End If


    End Function

End Class