<%@ Page Title="Editing  - The Alleged Gentlemen" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="editdash.aspx.vb" Inherits="WebApplication1.editdash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
    <style>
                .body-content {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }
        .heh {
            margin-top: 130px;
        }
        .row {
         margin-top: 10px;
         margin-left: auto;
         margin-right: auto;
        }
        .heck {
            width: 60%;
        }
        #share-buttons img {
            width: 35px;
            padding: 5px;
            border: 0;
            box-shadow: 0;
            display: inline;
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
    <h2>Articles that need editing...</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:HyperLinkField DataTextField="title" DataNavigateUrlFields="artid" DataNavigateUrlFormatString="~/account/edit.aspx?Id={0}" HeaderText="Title" />

            <asp:BoundField DataField="author" HeaderText="author" SortExpression="author"></asp:BoundField>

            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date"></asp:BoundField>



            <asp:BoundField DataField="tcat" HeaderText="tcat" SortExpression="tcat"></asp:BoundField>


        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [title], [date], [author], [tcat], [artid] FROM [articlez] WHERE ([editstatus] = @editstatus) ORDER BY [date] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="false" Name="editstatus" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
