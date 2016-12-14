Imports Microsoft.VisualBasic

Public Class FMT

    Public Shared Function s(o As Object)
        If IsNothing(o) Then Return ""
        Return IIf(IsDBNull(o), "", o.ToString)
    End Function

End Class
