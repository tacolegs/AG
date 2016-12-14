<%@ Page Title="Log in - The Alleged Gentlemen" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.vb" Inherits="WebApplication1.Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
            <style>
        .body-content {
            width: 40%;
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


           @media only screen and (max-width: 768px) {
    /* For mobile phones: */
    .body-content {
        width: 100%;
    }
            .heck {
            width: 100%;
        }
}
           .input-field input[type=text]:focus {
     border-bottom: 1px solid #fff;
     box-shadow: 0 1px 0 0 #fff;
   }
              .input-field input[type=text].valid {
     border-bottom: 1px solid #fff;
     box-shadow: 0 1px 0 0 #fff;
   }
   /* invalid color */
   .input-field input[type=text].invalid {
     border-bottom: 1px solid #fff;
     box-shadow: 0 1px 0 0 #fff;
   }


</style>
       <h2 class="center-align">Log in</h2>
    <asp:Panel ID="p" runat="server" DefaultButton="Button1">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class=" red darken-4 white-text  z-depth-3" style="border-radius:3px;">

    <div class="row center-align">
        <div class="input-field col s12 l12">
            <asp:Label ID="Label1" runat="server" Text="Label">Username</asp:Label>
            <asp:TextBox ID="TextBox1" style="font-size:100%" CssClass="input-field input[type=text]" runat="server"></asp:TextBox>
        </div>
    </div>
    <div class="row center-align">
        <div class="input-field col s12 l12">
            <asp:Label ID="Label2" style="font-size:100%" runat="server" Text="Label">Password</asp:Label>
            <asp:TextBox ID="TextBox2" CssClass="input-field input[type=password]" runat="server" TextMode="Password"></asp:TextBox>
        </div>
    </div>
    <div class="row center-align">
        <div class="col s12 l12">
           <asp:Label ID="Label3" style="font-size:100%" runat="server" Text=""></asp:Label>
        </div>
    </div>
    </div>
         <asp:Button ID="Button1" runat="server" Text="Login" cssclass="btn btn-default red darken-4 white-text" style="width:100%"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
