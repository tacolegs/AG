<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ArticleRules.aspx.vb" Inherits="WebApplication1.ArticleRules" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
        <style>
                .body-content {
            width: 50%;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }
        .row {
         margin-top: 10px;
         margin-left: auto;
         margin-right: auto;
        }


           @media only screen and (max-width: 768px) {
    /* For mobile phones: */
    .body-content {
        width: 100%;
    }

}
    </style>
    <h1 class="center-align">Rules for Writing</h1>
    <div class="red darken-4 z-depth-3" style="border-radius:3px;">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="white" style="font-weight:bold;padding:5px;margin:5px;margin-top:1px;margin-bottom:10px;color:#b71c1c;">
               <h4 style="font-weight:bold;"><%# Container.DataItemIndex + 1 %></h4>
            <h5 style="font-weight:bold;"><%# Eval("text") %></h5>
            </div>
        </ItemTemplate>
    </asp:ListView>
        </div>
        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [id], [text], [result] FROM [issues] WHERE ([result] = @result)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="result" Type="Boolean"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
