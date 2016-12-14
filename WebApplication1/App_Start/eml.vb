Imports System.Net.Mail
Imports System.Web.Mail

Public Class eml
    Public Shared Sub sendmail(recipient As String, subject As String, msgBody As String, cc As String)
        Dim Mail As New Net.Mail.MailMessage
        Dim SMTP As New SmtpClient("smtp.gmail.com")

        Mail.Subject = subject
        Mail.From = New MailAddress("allegedgentlemen@gmail.com")
        SMTP.Credentials = New System.Net.NetworkCredential("allegedgentlemen@gmail.com", "661287Pgd")

        Mail.To.Add(recipient)

        Mail.Body = msgBody
        Mail.CC.Add(cc)
        SMTP.EnableSsl = True
        SMTP.Port = "587"
        SMTP.Send(Mail)
    End Sub

End Class
