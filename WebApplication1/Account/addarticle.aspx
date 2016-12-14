<%@ Page Title="Post  - The Alleged Gentlemen" Language="vb" AutoEventWireup="false"  validateRequest="false"  MasterPageFile="~/Site.Master" CodeBehind="addarticle.aspx.vb" Inherits="WebApplication1.addarticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">

    <div class="col l12 s4">
        <asp:Label ID="Label1" runat="server" Text="Label">Title</asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    </div>

    <div class="col l12 s4">
        <asp:Label ID="Label6" runat="server" Text="Label" ValidateRequestMode="Disabled">Edit URL</asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:CheckBox ID="CheckBox1" Text="Publish without editing" runat="server" style="display:inline;width:10px;" ForeColor="Black" />
    </div>

    <div class="col l12 s4">
         <asp:Label ID="Label2" runat="server" Text="Label" ValidateRequestMode="Disabled">URL</asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>

        <div class="col l12 s4">
        
        <asp:Label ID="Label3" runat="server" Text="Label">Topic</asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" style="width:100px;display:inline;">
            <asp:ListItem Value="1">Theology</asp:ListItem>
            <asp:ListItem Value="2">Modernity</asp:ListItem>
            <asp:ListItem Value="3">Politics</asp:ListItem>
            <asp:ListItem Value="4">Hedonism</asp:ListItem>
        </asp:DropDownList>
    </div>

        <div class="col l12 s4">
        <asp:Label ID="Label4" runat="server" Text="Label">Tags</asp:Label>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </div>

        <div class="col l12 s4">
        
    </div>

        <div class="col l12 s4">
        
    </div>

        <div class="col l12 s4">
        
    </div>

    <div class="row">
        <div class="col l12 s12">
            <asp:Button ID="Button1" runat="server" Text="Submit" cssclass="btn btn-default red darken-4" style="width:100%"/>
    </div>
    </div>

</div>

</asp:Content>
