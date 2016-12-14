<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Carousal.aspx.vb" Inherits="WebApplication1.Carousal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
  


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
   <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="/images/slider/article/2.jpg" alt="Chania" width="460" height="345">
      </div>

      <div class="item">
        <img src="/images/slider/article/3.jpg" alt="Chania" width="460" height="345">
      </div>
    
      <div class="item">
        <img src="/images/slider/article/4.jpg" alt="Flower" width="460" height="345">
      </div>

      <div class="item">
        <img src="/images/slider/article/5.jpg" alt="Flower" width="460" height="345">
      </div>
    </div>
     <style>
         .carousel-inner > .item {
             background-image: url("/images/slider/article/5.jpg");
         }
.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {

    position: center;
    align-content: center;
    width: 100%;
      
      overflow: hidden; 

  }

         .body-content {
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            align-content: center;
        }
         a:hover, a:focus {
             background-color: transparent;
             
         }
     </style>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</asp:Content>
