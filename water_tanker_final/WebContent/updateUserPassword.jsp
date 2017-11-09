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
.alert {
    padding: 20px;
    background-color: #f44336;
    color: white;
    border-radius:5px;
    width:65%;
	}

.closebtn {
    margin-left: 15px;
    color: white;
    font-weight: bold;
    float: right;
    font-size: 22px;
    line-height: 20px;
    cursor: pointer;
    transition: 0.3s;
}

.closebtn:hover {
    color: black;
}
</style>

</head>
<body id="myPage">

<!-- Sidebar on click -->
<nav class="w3-sidebar w3-bar-block w3-white w3-card-2 w3-animate-left w3-xxlarge" style="display:none;z-index:2" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
    <i class="fa fa-remove"></i>
  </a>
  <a href="#" class="w3-bar-item w3-button">Link 1</a>
  <a href="#" class="w3-bar-item w3-button">Link 2</a>
  <a href="#" class="w3-bar-item w3-button">Link 3</a>
  <a href="#" class="w3-bar-item w3-button">Link 4</a>
  <a href="#" class="w3-bar-item w3-button">Link 5</a>
</nav>

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a style="text-decoration: none;" href="index.html" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Home</a>
  <a style="float: right;text-decoration: none;" href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white ">Contact Us</a>
  <a style="float: right;text-decoration: none;" href="register_process.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Register</a>
  <a style="float: right;text-decoration: none;" href="login_process.jsp" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Login</a>
  

 
 
  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
    <a  style="text-decoration: none;" href="login_process.jsp" class="w3-bar-item w3-button">Login</a>
    <a  style="text-decoration: none;" href="register_process.jsp" class="w3-bar-item w3-button">Register</a>
    <a  style="text-decoration: none;" href="#contact" class="w3-bar-item w3-button">Contact Us</a>
    
  </div>
</div>


<!-- Modal -->
<div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-card-4 w3-animate-top">
    <header class="w3-container w3-teal w3-display-container"> 
      <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-teal w3-display-topright"><i class="fa fa-remove"></i></span>
      <h4>Oh snap! We just showed you a modal..</h4>
      <h5>Because we can <i class="fa fa-smile-o"></i></h5>
    </header>
    <div class="w3-container">
      <p>Cool huh? Ok, enough teasing around..</p>
      <p>Go to our <a class="w3-text-teal" href="#">Water Tutorial</a> to learn more!</p>
    </div>
    <footer class="w3-container w3-teal">
      <p>Modal footer</p>
    </footer>
  </div>
</div>

<!-- Team Container -->

<div>
<div class="w3-container w3-padding-64 w3-center w3-container w3-myfont" id="team">
<h1 style="font-weight: bolder;"><p class="w3-xxxlarge">Update Password</p></h1>
 </div>

</div>


<!-- Work Row -->
<div class="w3-row-padding w3-padding-64 w3-theme-l1" id="work">

<div  class="w3 text-center">

<!-- <h2 style="padding-bottom: 15px;margin-top: 1px;" >Login In </h2> -->

</div>

<%String errormessage=(String)request.getAttribute("errormessage"); %>


<%if(errormessage!=null){ %>
 <div class="alert" style="margin-left: 17%;">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <%=errormessage %>
</div>
<%}
else{
%>
<div >
</div>
<%} %>
<div class="w3-col m2">
<div style="visibility: hidden; ">@fff-jfff i_+</div> 
    </div>
 <div class="w3-col m8">

 
      <form class="w3-container w3-card-4 w3-padding-16 w3-white" action="UserController" >
      <div class="w3-section">      
        <label>User Aadhaar Number <font color="red">*</font></label>
        <input class="w3-input" type="text" name="user_aadhar" placeholder="enter your aadhar number" required>
      </div>
      <div class="w3-section">      
        <label>Password <font color="red">*</font></label>
        <input class="w3-input" type="password" name="user_password"  placeholder="enter your new password" required>
      </div>
       <div class="w3-section">      
        <label>Confirm Password <font color="red">*</font></label>
        <input class="w3-input" type="password" name="confirm_user_password"  placeholder="confirm your new password" required>
      </div>
      
      
     <div class="container"></div>
  
    
      <input type="hidden" name="action" value="updateUserPassword">
      <button type="submit" class="w3-button w3-right w3-theme">Update Password</button>
      </form>
    </div>

</div>



<!-- Pricing Row -->
<div class="w3-row-padding w3-center w3-padding-64" id="pricing">
    <h2><font style="color: darkorange">--NOTE--</font></h2>
   
    
    <div  class="list-group">
    <a style="border:none"  class="list-group-item"><font color="red"> * </font>star marked fields are mandatory</a>
    <a style="border:none" href="#" class="list-group-item">Try remembering Username when you forgot password.</a>
    <a style="border:none" href="#" class="list-group-item">Access with your Aadhar Card makes it easy to recover your password.For further assistance visit Settings page</a>
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
