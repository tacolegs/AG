<%@ Page Title="User Dashboard" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="uBoard.aspx.vb" validateRequest="false" Inherits="WebApplication1.uBoard" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src='<%=ResolveUrl("~/Scripts/tinymce/js/tinymce/tinymce.min.js") %>'></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
    <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
    <style>
        .input-field input[type=text]:focus {
            border-bottom: 1px solid #fff;
            box-shadow: 0 1px 0 0 #fff;
        }

        label {
            font-size: 100%;
            color: white;
        }
        input {
            font-size: 100%;
        }
                .body-content {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }

        .row {
         margin-top: 10px;
         margin-left: auto;
         margin-right: auto;
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
     border-bottom: 1px solid #B71C1C;
     box-shadow: 0 1px 0 0 #B71C1C;
   }

    </style>
    <h1 class="center-align">Welcome, <%= getname("full") %></h1>
    <div class="row red darken-4 white-text">
        <div class=" center-align col s12 l12">
            <a href="#!user"><img class=" responsive-img circle center-align" src="../images/profiles/<%= getpic() %>.jpg"></a>
        </div>
    </div>

    <div class="row red darken-4 white-text">
        <div class="col s12 l6">
            <label>Email:</label>
        </div>
        <div class="col s12 l6">
            <asp:TextBox ID="TextBox1" style="font-size:100%" CssClass="input-field input" runat="server"></asp:TextBox>
        </div>
    </div>

        <div class="row red darken-4 white-text">
        <div class="col s12 l6">
            <label>Password:</label>
        </div>
        <div class="col s12 l6">
            <asp:TextBox ID="TextBox2" style="font-size:100%" runat="server"></asp:TextBox>
        </div>
    </div>
      <div class="row red darken-4 white-text center-align">
        <div class="col s12 l12">
            <h3>Bio</h3>
        </div>
        <div class="col s12 l12">
                <p style="height:100%;margin-left:auto;margin-right:auto;" class="center-align">
    <asp:TextBox ID="textbox3" class="center-align" runat="server" ClientIDMode="Static"
        TextMode="MultiLine" Rows="80" style="width:800px;height:100%;" CssClass="tinymce" />
        </div>
    </div>


    <div class="row">
        <div class="col l12 s12 center-align">
            <asp:Button ID="Button1" class="btn white-text red darken-4" runat="server" Text="Save" />
        </div>
    </div>
    <h3 class="center-align">Published Articles</h3>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
           
            <asp:HyperLinkField DataTextField="Title"  DataNavigateUrlFields="artid" DataNavigateUrlFormatString="~/article.aspx?Id={0}" HeaderText="Title"></asp:HyperLinkField>
            
            
            
            <asp:BoundField DataField="tcat" HeaderText="Category" SortExpression="tcat"></asp:BoundField>
            
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#B71C1C" Font-Bold="False" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="White" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [artid], [title], [date], [author], [cat], [tcat], [autid], [editstatus] FROM [articlez] WHERE (([autid] = @autid) AND ([editstatus] = @editstatus))">
        <SelectParameters>
            <asp:SessionParameter SessionField="USER_ID" DefaultValue="5" Name="autid" Type="String"></asp:SessionParameter>
            <asp:Parameter DefaultValue="true" Name="editstatus" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <h3 class="center-align">Pending Articles</h3>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
              <asp:HyperLinkField DataTextField="Title"  DataNavigateUrlFields="artid" DataNavigateUrlFormatString="~/article.aspx?Id={0}" HeaderText="Title"></asp:HyperLinkField>
            
            
            
            <asp:BoundField DataField="tcat" HeaderText="Category" SortExpression="tcat"></asp:BoundField>
            
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date"></asp:BoundField>
        </Columns>

        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#B71C1C" Font-Bold="False" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="White" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:AGConnectionString %>' SelectCommand="SELECT [artid], [title], [date], [author], [cat], [tcat], [autid], [editstatus] FROM [articlez] WHERE (([autid] = @autid) AND ([editstatus] = @editstatus))">
        <SelectParameters>
            <asp:SessionParameter SessionField="USER_ID" DefaultValue="5" Name="autid" Type="String"></asp:SessionParameter>
            <asp:Parameter DefaultValue="false" Name="editstatus" Type="String"></asp:Parameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <h3 class="center-align">Calendar</h3>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <contenttemplate>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" ShowGridLines="True" Width="100%">
        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px"></DayHeaderStyle>

        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC"></NextPrevStyle>

        <OtherMonthDayStyle ForeColor="#CC9966"></OtherMonthDayStyle>

        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True"></SelectedDayStyle>

        <SelectorStyle BackColor="#FFCC66"></SelectorStyle>

        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC"></TitleStyle>

        <TodayDayStyle BackColor="#FFCC66" ForeColor="White"></TodayDayStyle>
    </asp:Calendar>
        </contenttemplate>
    </asp:UpdatePanel>

    
    <script type="text/javascript">
    tinymce.init({
        selector: ".tinymce",
        theme: "modern",
        plugins: [
          'advlist autolink lists link image charmap print preview hr anchor pagebreak',
          'searchreplace wordcount visualblocks visualchars code fullscreen',
          'insertdatetime media nonbreaking save table contextmenu directionality',
          'emoticons template paste textcolor colorpicker textpattern imagetools codesample'
        ],
        toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        toolbar2: 'print preview media | forecolor backcolor emoticons | codesample',
        image_advtab: true,
        templates: [
          { title: 'Test template 1', content: 'Test 1' },
          { title: 'Test template 2', content: 'Test 2' }
        ],
        content_css: [
          '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
          '//www.tinymce.com/css/codepen.min.css'
        ]
    });
    tinymce.init({
        selector: ".tinymce",
        setup: function (editor) {
            editor.on('change', function () {
                editor.save();
            });
        }
    });

</script>
</asp:Content>
