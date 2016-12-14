<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="rules.aspx.vb" Inherits="WebApplication1.rules" %>
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
            margin-top: 190px;
        }
        .row {
         margin-top: 10px;
         margin-left: auto;
         margin-right: auto;
        }
        .heck {
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
    <div class="row">
        <div class="col s12 l4">
            <h1>Pending</h1>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <span style="">
                <div class="white z-depth-3" style="border:solid black 2px;padding:5px">
                <h4><asp:Label Text='<%# Eval("id") %>' runat="server" ID="titleLabel" /></h4>
                <asp:Label Text='<%# Eval("text") %>' runat="server" ID="tcatLabel" /><br />
                    <h5>Proposed by: <%# Eval("pby") %></h5> <br />
                <h5>For: <%# Eval("yes") %> Against: <%# Eval("no") %></h5>
                <br />
                </div>
            </span>
        </ItemTemplate>
    </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT * FROM [issues] WHERE ([result] IS NULL)">
        </asp:SqlDataSource>
            
            <div class="row">
                <div class="col s4 l4">
                    <asp:DropDownList ID="DropDownList1" runat="server" style="display:block;" DataSourceID="SqlDataSource2" DataTextField="id" DataValueField="id"></asp:DropDownList>
                </div>
                <div class="col s4 l4">
                    <asp:Button ID="Button1" CssClass="btn red darken-4 white-text" Style="width:100%" runat="server" Text="Yes" />
                </div>
                <div class="col s4 l4">
                    <asp:Button ID="Button2" CssClass="btn red darken-4 white-text" Style="width:100%" runat="server" Text="No" />
                </div>
            </div>
    
    
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>'>
        </asp:SqlDataSource>
        </div>
        <div class="col s12 l4">
             <h1>Approved</h1>
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
        <ItemTemplate>
            <span style="">
                <div class="white z-depth-3" style="border:solid black 2px;padding:5px">
                <h4><asp:Label Text='<%# Eval("id") %>' runat="server" ID="titleLabel" /></h4>
                <asp:Label Text='<%# Eval("text") %>' runat="server" ID="tcatLabel" /><br />
                    <h5>Proposed by: <%# Eval("pby") %></h5> <br />
                <h5>For: <%# Eval("yes") %> Against: <%# Eval("no") %> <br />
                    Approved: <%# Eval("result") %></h5>
                
                </div>
            </span>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT * FROM [issues] WHERE ([result] = @result)">
    <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="result" Type="Boolean"></asp:Parameter>
                </SelectParameters>    
    </asp:SqlDataSource>
        </div>
        <div class="col s12 l4">
             <h1>Rejected</h1>
            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource4">
        <ItemTemplate>
            <span style="">
                <div class="white z-depth-3" style="border:solid black 2px;padding:5px">
                <h4><asp:Label Text='<%# Eval("id") %>' runat="server" ID="titleLabel" /></h4>
                <asp:Label Text='<%# Eval("text") %>' runat="server" ID="tcatLabel" /><br />
                    <h5>Proposed by: <%# Eval("pby") %></h5> <br />
                <h5>For: <%# Eval("yes") %> Against: <%# Eval("no") %> <br />
                    Approved <%# Eval("result") %></h5>
                
                </div>
            </span>
        </ItemTemplate>
    </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT * FROM [issues] WHERE ([result] = @result)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="False" Name="result" Type="Boolean"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col l4 s4">
            <h4>New item:</h4>
            
        </div>
        <div class="col l4 s4">
            <asp:TextBox ID="TextBox1" style="width:100%" runat="server" TextMode="MultiLine"></asp:TextBox>
            
        </div>
        <div class="col l4 s4">
            
            <asp:Button ID="Button3" CssClass="btn red darken-4 white-text" style="width:100%" runat="server" Text="Submit" />
        </div>
    </div>
    

    
    


</asp:Content>
