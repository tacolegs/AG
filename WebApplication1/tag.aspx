<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tag.aspx.vb" Inherits="WebApplication1.tag" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <style>
                .body-content {
            width: 50%;
            margin-left: auto;
            margin-right: auto;
        }
           @media only screen and (max-width: 768px) {
    /* For mobile phones: */
    .body-content {
        width: 100%;
    }
            .heck {
            width: 100%;
        }
}

    </style>
        <h1>Articles with <%= Request.QueryString("tag")%></h1>
    
    <asp:GridView ID="GridView1" runat="server"  BackColor="White" 0 AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
             <asp:HyperLinkField DataTextField="title" DataNavigateUrlFields="artid" DataNavigateUrlFormatString="~/read.aspx?Id={0}" HeaderText="Title">
                <controlstyle ForeColor="#B71C1C"></controlstyle>
            </asp:hyperlinkfield>

            <asp:BoundField DataField="tcat" HeaderText="Category" SortExpression="tcat"></asp:BoundField>

            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#B71C1C" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [artid], [title], [date], [author], [cat], [tcat], [autid], [editstatus], [tags] FROM [articlez] WHERE (([editstatus] = @editstatus) AND ([tags] LIKE '%' + @tags + '%'))">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="editstatus" Type="String"></asp:Parameter>
            <asp:QueryStringParameter QueryStringField="tag" Name="tags" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
