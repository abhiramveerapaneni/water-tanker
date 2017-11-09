<!DOCTYPE html>
<html>
<title>Water Booking</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">




  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<head>
<style type="text/css">
.w3-myfont {
    font-family: "Comic Sans MS", cursive, sans-serif;
}

</style>

</head>
<body id="myPage">



<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a style="text-decoration: none;" href="index.html" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Home</a>
  <a style="float: right;text-decoration: none;" href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white ">Contact Us</a>
  <a style="float: right;text-decoration: none;" href="<%=request.getContextPath()%>/UserController?action=invalidate" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Sign Out</a>
  

 
 
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
    <a  style="text-decoration: none;" href="#contact" class="w3-bar-item w3-button">Contact Us</a>
    <a  style="text-decoration: none;" href="<%=request.getContextPath()%>/UserController?action=invalidate" class="w3-bar-item w3-button">Sign Out</a>
    
  </div>
</div>




<!-- Team Container -->

<div class="container">
<div class="w3-container w3-padding-64 w3-center w3-container w3-myfont" id="team">
    <h1 style="font-weight: bolder;"><p style="color: grey" class="w3-xxxlarge">Your Order was Confirmed. Click <a href="<%=request.getContextPath()%>/UserController?action=bookingg">here</a> to Book other Tanker</h1>
 </div>

</div>


<!-- Work Row -->
<div class="w3-row-padding w3-padding-64 w3-theme-l1" id="work">

<div  class="w3 text-center">

</div>


<div class="w3-col m2">
<div style="visibility: hidden; ">@fff-jfff i_+</div> 
    </div>
 <div class="w3-col m8">

     
 
   
 </div>
</div>



   
    
    </div>

<!-- Contact Container -->
<div class="w3-container w3-padding-64 w3-theme-l5" id="contact">
  <div class="w3-row">
    <div class="w3-col m12 text-center">
    <div class="w3-padding-16"><span class="w3-xlarge w3-border-teal w3-bottombar"><font style="color: darkorange">Contact Us</font></span></div>
      <h3>Address</h3>
      <p> Share your valuable feedback with us.</p>
      <p><i class="fa fa-map-marker w3-text-teal w3-xlarge"></i>  Q-City Hyderabad</p>
      <p><i class="fa fa-phone w3-text-teal w3-xlarge"></i> +00 1515151515</p>
      <p><i class="fa fa-envelope-o w3-text-teal w3-xlarge"></i>  feedback@tcs.com</p>
    </div>
   
  </div>
</div>

<!-- Google Maps -->
<div>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3806.673180676569!2d78.32943931443953!3d17.42746498805461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb937bc7999783%3A0x77ddedcaeb1fa496!2sTCS+ILP+%2CQ-CITY+NANAKRAM+GUDA!5e0!3m2!1sen!2sin!4v1507885129130" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</div>
<script>
function myMap()
{
  myCenter=new google.maps.LatLng(41.878114, -87.629798);
  var mapOptions= {
    center:myCenter,
    zoom:12, scrollwheel: false, draggable: false,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions);

  var marker = new google.maps.Marker({
    position: myCenter
  });
  marker.setMap(map);
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<!-- Footer -->
<footer class="w3-container w3-padding-32 w3-theme-d1 w3-center">
  <h4>Follow Us</h4>
  <a class="w3-button w3-large w3-teal" href="javascript:void(0)" title="Facebook"><i class="fa fa-facebook"></i></a>
  <a class="w3-button w3-large w3-teal" href="javascript:void(0)" title="Twitter"><i class="fa fa-twitter"></i></a>
  <a class="w3-button w3-large w3-teal" href="javascript:void(0)" title="Google +"><i class="fa fa-google-plus"></i></a>
  <a class="w3-button w3-large w3-teal" href="javascript:void(0)" title="Google +"><i class="fa fa-instagram"></i></a>
  <a class="w3-button w3-large w3-teal w3-hide-small" href="javascript:void(0)" title="Linkedin"><i class="fa fa-linkedin"></i></a>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>

  <div style="position:relative;bottom:100px;z-index:1;" class="w3-tooltip w3-right">
    <span class="w3-text w3-padding w3-teal w3-hide-small">Go To Top</span>   
    <a class="w3-button w3-theme" href="#myPage"><span class="w3-xlarge">
    <i class="fa fa-chevron-circle-up"></i></span></a>
  </div>
</footer>

<script>
// Script for side navigation


// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
    var x = document.getElementById("navDemo");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else { 
        x.className = x.className.replace(" w3-show", "");
    }
}
</script>

</body>
</html>
