<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tagtest.aspx.vb" Inherits="WebApplication1.tagtest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server"></asp:ListView>
    <%= gettags() %>
</asp:Content>
