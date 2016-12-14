<%@ Page Title="Something" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="read.aspx.vb" Inherits="WebApplication1.read" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <style>
        .body-content {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }
        .heh {
            margin-top: 190px;
        }
        .row {
         margin-top: 10px;
         margin-left: auto;
         margin-right: auto;
        }
        .heck {
            background-size: cover;
            background-position: center;
            margin-bottom: 130px;
            width: 60%;
        }

        #share-buttons img {
            width: 35px;
            padding: 5px;
            border: 0;
            box-shadow: 0;
            display: inline;
        }
         .title {
                font-size: large;
            }
   @media only screen and (max-width: 768px) {
    /* For mobile phones: */
    .body-content {
        width: 100%;
    }
            .heck {
            width: 100%;
        }
            .heh {
            margin-top: 160px;
        }
            .title {
                font-size: medium;
            }
            .btn {
                width:100%;
                margin-top:5px;
            }


}
   a {
       color: black;
   }
   a:hover {
       color: white;
   }
   .what {
       background-color: white;
       color: #B71C1C;
       border-radius: 2px;
       -webkit-transition: color .1s;
       transition: color .1s;
       -webkit-transition: background-color .2s;
       transition: background-color .2s;
       padding: 2px;
   }
   .what:hover {
       background-color: #B71C1C;
       color: white;
       text-decoration: none;
   }

    </style>

<div class="row pinned darken-3 white-text z-depth-3 heck">
    <div class="col s4 l2">
        <img class="circle responsive-img" src="../images/profiles/<%= getpic() %>.jpg">
    </div>
    <div class="col s8 l10">
        <h5 class="title"><%=gettitle() %></h5>
        <h6>By <%=getauthor() %></h6>
        <p>Published <%=getdate() %></p>
         <%= gettags() %>
    </div>

</div>
 
    <div class="row" style="margin-top:10px;">
            <div runat="server" id="article" class=" col s12 l12 heh white-text red darken-4 z-depth-3" style="padding:10px;">
           <%--<%= gettext() %>--%>
        </div>
    </div>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
                <div class="row">
        <div class="col l12 s12">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
                        <span style="">
                            <div style="border-bottom: solid black 2px;background-color: white;padding:10px;">
                <h4 style="margin-bottom:0px;"><%# Eval("uname") & " says:"%></h4>
                <p><%# Eval("comment") %></p>
                <p><%# Eval("date") %></p>
              
                                </div>
            </span>
        </AlternatingItemTemplate>
        
        <EmptyDataTemplate>
            <span style="text-align:center;"><h5>No comments.</h5></span>
        </EmptyDataTemplate>
       
        <ItemTemplate>
            <span style="">
                <div style="border-bottom: solid black 2px;background-color: white;padding:10px;">
                    <h4 style="margin-bottom:0px;"><%# Eval("uname") & " says:"%></h4>
                <p><%# Eval("comment") %></p>
                <p><%# Eval("date") %></p>
                
                                </div>
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
            <div style="">
            </div>
        </LayoutTemplate>
       
    </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT * FROM [comments] WHERE ([artid] = @artid) ORDER BY [date] DESC">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="id" DefaultValue="1" Name="artid" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col s12 l2">
            <asp:Label ID="Label2" runat="server" Text="Name:"></asp:Label>
        </div>
        <div class="col s12 l3">
            
            <asp:TextBox ID="TextBox2" Class="white" style="font-size:100%;border: solid #B71C1C 1px;" runat="server"></asp:TextBox>
        </div>
        <div class="col s12 l2">
            <asp:Label ID="Label1" runat="server" Text="Comment:"></asp:Label>
        </div>
        <div class="col s12 l3">
            
            <asp:TextBox ID="TextBox1" Class="white" style="font-size:100%;border: solid #B71C1C 1px;" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>
        <div class="col s12 l2">
            <asp:Button ID="Button1" class="btn red darken-4 white-text" runat="server" Text="Add Comment" />
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        $(document).ready(function () {
            $('.tabs-wrapper .row').pushpin({ top: $('.tabs-wrapper').offset().top });
        });


    </script>
    <meta name="description" content="Welcome to The Alleged Gentlemen! This is an article! <%= getmeta() %>"/>
</asp:Content>
