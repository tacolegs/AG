Imports System.Data.SqlClient
Imports Microsoft.VisualBasic


Public Class nottrip
    Public Shared articles As New String("Data Source=INTERSERVER\SQLEXPRESS;Initial Catalog=AG;Integrated Security=True")
    Public Shared Function Read(connstr As String, table As String, field As String, confield As String, conitem As String)
        Dim conn As New SqlConnection(connstr)
        Dim cmd As New SqlCommand("SELECT " & field & " FROM " & table & " WHERE " & confield & "=@p0", conn)
        cmd.Parameters.AddWithValue("@p0", conitem)
        Dim res As String = Nothing
        conn.Open()
        res = IIf(IsDBNull(cmd.ExecuteScalar()), "", cmd.ExecuteScalar())
        conn.Close()
        Return res
    End Function

    Public Shared Function getnewid(connstr As String, field As String, table As String)
        Dim conn As New SqlConnection(connstr)
        Dim cmd As New SqlCommand("SELECT MAX(" & field & ") FROM " & table, conn)

        Dim res As String = Nothing
        conn.Open()
        res = IIf(IsDBNull(cmd.ExecuteScalar()), "", cmd.ExecuteScalar())
        conn.Close()
        Dim newid As Integer = res + 1
        Return newid
    End Function


    Public Shared Function SortTable(dt As DataTable, colname As String, direction As String) As DataTable
        Dim x As New DataView(dt)
        x.Sort = " " & colname & " " & IIf(IsNothing(direction), "ASC", direction)
        Return x.ToTable
    End Function

    Public Shared Sub Insert(connstr As String, insert_array(,) As Object, table_name As String)
        Dim conn As New SqlConnection(connstr)
        Dim pararr, fldarr As New ArrayList
        Dim v, f As String
        Dim vals As String = Nothing
        Dim flds As String = Nothing
        For i = 0 To CInt(insert_array.Length / 2) - 1
            v = IIf(IsNothing(insert_array(i, 1)) Or FMT.s(insert_array(i, 1)) = "", "NULL", insert_array(i, 1))
            If Not IsNothing(insert_array(i, 0)) Then f = insert_array(i, 0) Else Exit Sub
            If i > 0 Then
                flds &= ", "
                vals &= ", "
            End If
            flds &= f
            vals &= "@" & f
            fldarr.Add("@" & f)
            pararr.Add(v)
        Next
        Dim cmd As New SqlCommand("INSERT INTO " & table_name & " (" & flds & ") VALUES (" & vals & ");", conn)
        conn.Open()
        For i = 0 To pararr.Count - 1
            cmd.Parameters.AddWithValue(fldarr(i), pararr(i))
        Next
        cmd.ExecuteNonQuery() : conn.Close()
        'If table_name <> "log" Then DBS.Log("Record Inserted", "Record inserted into table " & table_name & " with ID " & insert_array(0, 1))
    End Sub

    Public Shared Sub FillListbox(connstr As String, table As String, lb As Object, confields() As String, conitems() As String, text_field As String, Optional value_field As String = Nothing, Optional sortcol As String = Nothing, Optional sortdir As String = Nothing)
        Dim conn As New SqlConnection(connstr)
        lb.Items.Clear() : Dim x As String
        If conitems(0) = "" Then
            nottrip.lbfit(lb)
            Exit Sub ' if the conitem is empty (i.e. the textbox has no query text) then don't bother putting anything in.
        End If
        Dim cmd As New SqlCommand("SELECT * FROM " & table, conn)
        If Not confields Is Nothing Then
            Dim conditions As String = IIf(Right(confields(0), 4) = "LIKE", confields(0) & " '%' + @p0 + '%'", confields(0) & " @p0")
            For i = 1 To confields.Length - 1
                x = confields(i)
                If Right(x, 4) = "LIKE" Then conditions &= IIf(Left(x, 3) = "OR ", " ", " AND ") & x & " '%' + @p" & i & " + '%'" Else conditions &= IIf(Left(x, 3) = "OR ", " ", " AND ") & x & "@p" & i
            Next
            cmd = New SqlCommand("SELECT * FROM " & table & " WHERE " & conditions, conn)
            For i = 0 To confields.Length - 1
                cmd.Parameters.AddWithValue("@p" & i, conitems(i))
            Next
        End If
        Dim adapter As New SqlDataAdapter(cmd)
        Dim dt As DataTable = New DataTable
        adapter.Fill(dt)
        If Not IsNothing(sortcol) Then lb.DataSource = SortTable(dt, sortcol, sortdir) Else lb.DataSource = dt
        lb.DataTextField = text_field
        lb.DataValueField = IIf(IsNothing(value_field), text_field, value_field)
        lb.DataBind()
        dt.Clear()
        If TypeOf (lb) Is ListBox Then nottrip.lbfit(lb)
    End Sub




    Public Shared Sub lbfit(lb As Object)
        If lb.Items.Count > 0 Then : Dim i As Integer = IIf(lb.Items.Count < 20, (lb.Items.Count * 24 + 20), 500) : lb.Height = i
        ElseIf lb.Items.Count = 0 Then : lb.Height = 78 : End If
    End Sub

    Public Shared Sub Update(connstr As String, table As String, update_array As Array, confield As String, conitem As String)
        Dim conn As New SqlConnection(connstr)
        Dim vals As String = Nothing
        Dim pararr, fldarr As New ArrayList
        Dim f, v As String
        For i = 0 To CInt(update_array.Length / 2) - 1
            v = IIf(IsDBNull(update_array(i, 1)), "", update_array(i, 1))
            If Not IsNothing(update_array(i, 0)) Then f = update_array(i, 0) Else Exit Sub
            If i > 0 Then vals &= ", "
            vals &= "[" & f & "] = @" & f
            fldarr.Add("@" & f)
            pararr.Add(IIf(IsNothing(v) Or v = "", DBNull.Value, v))
        Next
        Dim cmd As New SqlCommand("UPDATE " & table & " SET " & vals & " WHERE " & confield & "=@p0", conn)
        cmd.Parameters.AddWithValue("@p0", conitem)
        conn.Open()
        For i = 0 To pararr.Count - 1
            cmd.Parameters.AddWithValue(fldarr(i), pararr(i))
        Next
        cmd.ExecuteNonQuery() : conn.Close()
        'DBS.Log("Record Updated", "Record updated in table " & table & " where " & confield & " = " & conitem)
    End Sub

    Public Shared Function getcount(connstr As String)
        Dim conn As New SqlConnection(connstr)
        Dim cmd As New SqlCommand("SELECT COUNT(artid) FROM articlez")

        Dim res As String = Nothing
        conn.Open()
        res = IIf(IsDBNull(cmd.ExecuteScalar()), "", cmd.ExecuteScalar())
        conn.Close()
        Return res
    End Function

    Public Shared Function RowsAffectedCount() As Integer
        Dim connetionString As String
        Dim connection As SqlConnection
        Dim command As SqlCommand
        Dim sql As String
        connetionString = nottrip.articles
        sql = "Select count(*) from articlez WHERE editstatus='false'"
        connection = New SqlConnection(connetionString)
        Try
            connection.Open()
            command = New SqlCommand(sql, connection)
            Dim sqlReader As SqlDataReader = command.ExecuteReader()
            While sqlReader.Read()
                Return sqlReader.Item(0)
            End While
            sqlReader.Close()
            command.Dispose()
            connection.Close()
        Catch ex As Exception
            MsgBox("Can not open connection ! ")
        End Try
    End Function
    Public Shared Function getpic(userid As String)
        If userid = Nothing Then
            Return Nothing
        Else
            Return "<img class='circle responsive-img' src='../images/profiles/" & userid & ".jpg'>"
        End If
    End Function

    Public Shared Function HasRecords(connstr As String, table As String, confields() As String, conitems() As String) As Boolean
        Dim dt As DataTable = GetTable(connstr, table, confields, conitems)
        Return (dt.Rows.Count > 0)
    End Function
    Public Shared Function GetTable(connstr As String, table_name As String, Optional confields() As Object = Nothing, Optional conitems() As Object = Nothing, Optional sortcol As String = Nothing, Optional sortdir As String = Nothing, Optional distinct As Boolean = False, Optional d As String = Nothing)
        Dim sql As String = "SELECT " & IIf(distinct, "DISTINCT " & d, "*") & " FROM " & table_name
        If Not IsNothing(confields) Then
            If Right(confields(0), 4) = "LIKE" Then sql &= " WHERE " & confields(0) & " '%' + @p0 + '%'" Else sql &= " WHERE " & confields(0) & " @p0"
            For i As Integer = 1 To confields.Length - 1
                If Right(confields(i), 4) = "LIKE" Then sql &= " AND " & confields(i) & " '%' + @p" & i & " + '%'" Else sql &= " AND " & confields(i) & " @p" & i
            Next
        End If
        Dim conn As New SqlConnection(connstr)
        Dim cmd As New SqlCommand(sql, conn)
        If Not conitems Is Nothing Then
            For i As Integer = 0 To conitems.Length - 1
                cmd.Parameters.AddWithValue("@" & "p" & i, conitems(i))
            Next
        End If
        Dim dt As New DataTable(table_name)
        Dim adp As New SqlDataAdapter(cmd)
        adp.Fill(dt) : conn.Close() : dt.TableName = table_name
        If dt.Rows.Count = UniqueRowCount(connstr, table_name, confields, conitems) Then
            dt.PrimaryKey = {dt.Columns("ID")}
        End If

        If Not IsNothing(sortcol) Then Return SortTable(dt, sortcol, sortdir) Else Return dt
    End Function
    Public Shared Function UniqueRowCount(connstr As String, table_name As String, confields() As Object, conitems() As Object)
        Dim sql As String = "SELECT DISTINCT ID FROM " & table_name
        If Not IsNothing(confields) Then
            If Right(confields(0), 4) = "LIKE" Then sql &= " WHERE " & confields(0) & " '%' + @p0 + '%'" Else sql &= " WHERE " & confields(0) & " @p0"
            For i As Integer = 1 To confields.Length - 1
                If Right(confields(i), 4) = "LIKE" Then sql &= " AND " & confields(i) & " '%' + @p" & i & " + '%'" Else sql &= " AND " & confields(i) & " @p" & i
            Next
        End If
        Dim conn As New SqlConnection(connstr)
        Dim cmd As New SqlCommand(sql, conn)
        If Not conitems Is Nothing Then
            For i As Integer = 0 To conitems.Length - 1
                cmd.Parameters.AddWithValue("@" & "p" & i, conitems(i))
            Next
        End If
        Dim dt As New DataTable(table_name)
        Dim adp As New SqlDataAdapter(cmd)
        adp.Fill(dt) : conn.Close() : dt.TableName = table_name
        Return dt.Rows.Count
    End Function
End Class
