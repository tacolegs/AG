<%@ Page Title="Categories - The Alleged Gentlemen" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="categories.aspx.vb" Inherits="WebApplication1.categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
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
        <h2><%= getcat()%></h2>
    
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <ItemTemplate>
            <span style="">
                <div class="white" style="border-bottom:solid black 2px;padding:5px">
                <h4><asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></h4>
                <asp:Label Text='<%# Eval("tcat") %>' runat="server" ID="tcatLabel" /><br />
                <h5>By <%# Eval("author") %>, on <%# Eval("date") %></h5>
                
                <a class="btn red darken-4" style="margin-left:5px;" href="/read.aspx?id=<%# Eval("artid") %>">Read</a>
                <br />
                </div>
            </span>
        </ItemTemplate>
        </ItemTemplate>
    </asp:ListView>
    
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT * FROM [articlez] WHERE ([cat] = @cat) AND ([editstatus] = @editstatus) ORDER BY [date] DESC">
        <SelectParameters>
            <asp:QueryStringParameter  DefaultValue="true" Name="editstatus" Type="String"></asp:QueryStringParameter>
            <asp:QueryStringParameter QueryStringField="cat" DefaultValue="1" Name="cat" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
