<%@ Page Title="About - The Alleged Gentlemen" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="WebApplication1.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="js/match/dist/jquery.matchHeight.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
        <style>
            .collapsible-body {
                color: #b71c1c;
                background-color: white;
            }
            .collapsible-body p {
                font-weight: bold;
                padding-top: 0px;
            }
            h3 {
                margin-top: 10px;
            }
            .collapsible-header i {
                float: right;
                margin-right: 0px;
            }
            .collapsible-header {
                margin-right: 0px;
            }
            .material-icons {
                margin-right: 5px;
            }
            .collapsible-header i {
                margin-right: 5px;
                width: 5rem;
                font-size: 24px;
            }

        </style>

    
  <div class="row">
      <div class="col l6 s12" style="height:100%">
          <h1 class="center-align">What We do</h1>
          <p class="red darken-4 white-text shorter z-depth-3" style="padding:10px;">
              The Alleged Gentlemen began in the Autumn of  2016. It was created by a group of college students, who wished to write on a wide range of topics, and to construct a forum for that discussion. The writers at Alleged Gentlemen believe that a return to Tradition, and the idea of  Full and Complete Life is necessary if  the Restoration of Culture is to have any meaning.  The Alleged Gentlemen believe that every part of a man's life must involve a healthy sense of Tradition and of True Culture. Our division of our material into Theology, Modernity, Politics and Hedonism reflects this belief. Thank you for reading, and welcome to the conversation.
          </p>

      </div>

    <div class="col s12 l6">
        <h1 class="center-align">Who We Are</h1>
    <ul class="collapsible popout white-text shorter" data-collapsible="accordion">
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <li class="red darken-4">
      <div class="collapsible-header red darken-4 white-text"><%#Eval("fname") %> <i class="material-icons"> <%#Eval("icons") %></i></div>
      <div class="collapsible-body z-depth-3">
          <div class="row">
              
                  <div class="col l3 s3">
                    <img class="circle responsive-img" src="images/profiles/<%#Eval("id") %>.jpg" />
                  </div>
                  <div class="l9 s9">
                      <h3><b><%#Eval("fname") %></b></h3>
                      <p><i><%#Eval("titles") %></i></p>
                      <%#Eval("bio") %>
                  </div>
              
          </div>
      </div>
    </li>
            </ItemTemplate>
        </asp:ListView>

        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT * FROM [users] WHERE ([complete] = @complete) ORDER BY [id]">
            <SelectParameters>
                <asp:Parameter DefaultValue="y" Name="complete" Type="String"></asp:Parameter>
            </SelectParameters>
        </asp:SqlDataSource>
        



                      
    </ul>
    </div>

    


    

  </div>
    

    <script>

        $(document).ready(function () {
            $('.collapsible').collapsible({
            });
            $('.shorter').matchHeight();
            });
        




    </script>
</asp:Content>
