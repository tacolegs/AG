<%@ Page Title="" Language="vb" AutoEventWireup="false" validateRequest="false"  MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.vb" Inherits="WebApplication1.WebForm2" %>
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
<script type="text/javascript" src='<%=ResolveUrl("~/Scripts/tinymce/js/tinymce/tinymce.min.js") %>'>
    </script>
    <p style="height:100%;margin-left:auto;margin-right:auto;" class="center-align">
    <asp:TextBox ID="textbox1" class="center-align" runat="server" ClientIDMode="Static"
        TextMode="MultiLine" Rows="80" style="width:800px;height:100%;" CssClass="tinymce" />
    <asp:Button ID="Button1" runat="server" class="btn red darken-4 center-align"  text="Publish" />
        <asp:Button ID="Button2" runat="server" class="btn red darken-4 center-align" Text="Save" OnClientClick="tinymce.triggerSave();" />
</p>

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
