<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" validateRequest="false" CodeBehind="Post.aspx.vb" Inherits="WebApplication1.WebForm1" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <%--<script type="text/javascript" src='<%=ResolveUrl("~/Scripts/tinymce/js/tinymce/tinymce.min.js") %>'>--%>
     <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>

<script type="text/javascript" src="ckeditor/adapters/jquery.js"></script>


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"></script>
    <style>
        .mce-container {
            height:100%
        }        .body-content {
            width: 60%;
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
        .heck {
            width: 60%;
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
     border-bottom: 1px solid #fff;
     box-shadow: 0 1px 0 0 #fff;
   }
    </style>
    <h2 class="center-align"><a href="ArticleRules.aspx">Rules for Writing</a></h2>
    <div class="row red darken-4 white-text z-depth-3" >
        <div class="col l3 s12">
            <asp:Label ID="Label1" runat="server" Text="Title"></asp:Label>
            <asp:TextBox ID="TextBox2" style="font-size:100%" CssClass="input-field input" runat="server"></asp:TextBox>
        </div>
        <div class="col l3 s12">
            <asp:Label ID="Label2" runat="server" Text="Tags"></asp:Label>
            <asp:TextBox ID="TextBox3" style="font-size:100%" runat="server"></asp:TextBox>
        </div>
        <div class="col l3 s12">
            <asp:Label ID="Label3" runat="server" Text="Topic"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" style="width:100px;display:inline;color:#B71C1C">
            <asp:ListItem Value="1">Theology</asp:ListItem>
            <asp:ListItem Value="2">Modernity</asp:ListItem>
            <asp:ListItem Value="3">Politics</asp:ListItem>
            <asp:ListItem Value="4">Hedonism</asp:ListItem>
        </asp:DropDownList>
        </div>
        <div class="col l3 s12">
            <asp:CheckBox ID="CheckBox1" Text="Publish without editing" runat="server" style="font-size:100%;display:inline;width:10px;" ForeColor="Black" />
        </div>
    </div>
<p style="width:100%;height:100%;margin-left:auto;margin-right:auto;" class="center-align z-depth-3">
<asp:TextBox ID="txtCKEditor" runat="server" TextMode="MultiLine" Columns="60" Rows="10" class="ckeditor"></asp:TextBox>

            
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Button ID="Button2" runat="server" class="btn red darken-4 center-align" text="Save Draft" />
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:Button ID="Button1" runat="server" class="btn red darken-4 center-align" text="Submit" />
</p>

    
<%--<script type="text/javascript">
 tinymce.init({
        selector: ".tinymce",
        theme: "modern",
        plugins: [
          'advlist autolink lists link image charmap print preview hr anchor pagebreak',
          'searchreplace wordcount visualblocks visualchars code fullscreen',
          'insertdatetime media nonbreaking save table contextmenu directionality',
          'emoticons template paste textcolor colorpicker textpattern imagetools codesample'
        ],
        height: "80",
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


</script>--%>


</asp:Content>
