<%@ Page Title="The Alleged Gentlemen" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication1._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    


    <div class="row">

    <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>

        

                <div class="row" style="margin-bottom:0px;">

        <div class="col l2 hagpic">
            <img src="/images/hag/<%= rndm() %>.jpg" class="responsive-img" />
        </div>

        <div class="col l8 s12">

      <div class="slider">
    <ul class="slides  z-depth-3">
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                   <li>
        <img src="images/slider/article/<%# Eval("artid") %>.jpg" style="filter: brightness(60%);"> <!-- random image -->
        <div class="caption left-align">
          <a class="btn red darken-4 white-text" href="read.aspx?id=<%# Eval("artid") %>"><%# Eval("title") %></a>
             <h3 class="light grey-text text-lighten-3" style=" font-family:Fontin;font-size: 30px">"<%# Eval("syn") %>"</h3>
        </div>
      </li>
            </ItemTemplate>
        </asp:ListView>



      
    </ul>
  </div>
        </div>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [artid], [title], [date], [author], [cat], [tcat], [autid], [editstatus], [slider], [syn] FROM [articlez] WHERE ([editstatus] = @editstatus) AND ([slider] = @slider) ORDER BY [date] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="editstatus" Type="String"></asp:Parameter>
            <asp:Parameter DefaultValue="true" Name="slider" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
       
        <div class="col l2 hagpic">
            <img src="/images/hag/<%=  rndm() %>.jpg" class="responsive-img" />
        </div>

        </div>





    </div>
    <div class="row">
        <div class="col l12 s12" style="text-align:center;">
            <h1 style="font-family:Fontin;margin-top:5px;">Welcome to The Alleged Gentlemen</h1>
            
        </div>
            <script type="text/javascript" src="js/jquery.js"></script>
      <script type="text/javascript" src="js/materialize.min.js"></script>
        <script src="js/match/dist/jquery.matchHeight.js" type="text/javascript"></script>
       

    </div>




    <style>
       
        .this {
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }
        @media only screen and (max-width: 768px) {
            /* For mobile phones: */
            .hagpic {
                width: 0px;
                height: 0px;
                display: none;
            }
            .this {
                width: 100%;
            margin-left: 0px;
            margin-right: 0px;
            align-content: center;
            }

        }
        .row .col {
            padding: 0px;
            margin-bottom: 0px;
        }
        

       
    </style>

    <div class="row red darken-4 z-depth-3 this" style="border-radius:3px;">
        
        <div class="col l8 s12" style="margin-left:0px;">
            <h4 style="text-align:center;color:white;">Here are our latest articles...</h4>
          
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                
        <AlternatingItemTemplate>
            <span style="">
                <div class="white" style="border-bottom:solid black 2px;padding:5px">
                <h4><asp:Label Text='<%# Eval("title") %>' runat="server" ID="titleLabel" /></h4>
                <asp:Label Text='<%# Eval("tcat") %>' runat="server" ID="tcatLabel" /><br />
                <h5>By <%# Eval("author") %>, on <%# Eval("date") %></h5>

                <a class="btn red darken-4" style="margin-left:5px;" href="/read.aspx?id=<%# Eval("artid") %>">Read</a>
                <br />
                    </div>
            </span>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <span>No comments yet.</span>
        </EmptyDataTemplate>
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
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
           <asp:DataPager ID="dpListView" runat="server" PageSize="4" />
        </LayoutTemplate>
    </asp:ListView>
              <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [artid], [title], [date], [author], [cat], [tcat], [autid], [editstatus] FROM [articlez] WHERE ([editstatus] = @editstatus) ORDER BY [date] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="editstatus" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
        </div>
        <div class="col l4 s12 white-text" style="background-color:#B71C1C;padding:10px;border-radius:3px;">
            <div class="row"style="border-radius:3px;">
                <div class="col s12 l12" >
                    <h4 style="color:white;">What is this?</h4>
                </div>
                <div class="col s12 l12">
                     <p style="color:white;">This is a website dedicated to the pursuit of the intellectual life. Our articles touch on modern culture, political issues, theology, and the art of the complete life.</p>
                </div>
                <div class="col s12 l12 center-align">
                    <a class="waves-effect waves-red btn btn-default white" style="color:#B71C1C;font-weight:bold" href="About.aspx">Learn More</a>
                </div>
            </div>
            <div class="row">
                <div class="col s12 l12">
                    <h4>Subscribe</h4>
                </div>
                <div class="col s12 l2">
                    <h5>Email</h5>
                </div>
                <div class="col s12 l10">

                    <asp:TextBox ID="TextBox1" style="font-size:100%" cssclass="input-field textarea" runat="server"></asp:TextBox>
                </div>
                <div class="col s12  l12 center-align">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        <asp:Button ID="Button1" class="btn btn-default white" Style="color:#B71C1C;font-weight:bold" runat="server" Text="Submit" />
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                            </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
           
            
            
            
            
            
        </div>
    </div>
    



    
   
   <script>

       $(document).ready(function () {
           $('.slider').slider({height: 444});
       });

   </script>
    <meta name="description" content="The Alleged Gentlemen is a website dedicated to 
        the pursuit of intellectualism and the discussion of important topics like 
        Theology, Moderntiy, Politics, Traditionalism, Family, Media, and Hedonism. It is a Christian and conservative website. "/>


</asp:Content>
