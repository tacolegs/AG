<%@ Page Title="Authors - The Alleged Gentlemen" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="articleauthors.aspx.vb" Inherits="WebApplication1.articleauthors" %>
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
        <h1>Articles by <%= getaut()%></h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
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
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [artid], [title], [date], [tcat], [editstatus], [autid] FROM [articlez] WHERE (([autid] = @autid) AND ([editstatus] = @editstatus))">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="autid" DefaultValue="1" Name="autid" Type="String"></asp:QueryStringParameter>
            <asp:Parameter DefaultValue="true" Name="editstatus" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
