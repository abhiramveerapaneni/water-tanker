
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

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
 <head>
<style type="text/css">


</style>

</head>
<body id="myPage">

<!-- Sidebar on click -->
<nav class="w3-sidebar w3-bar-block w3-white w3-card-2 w3-animate-left w3-large" style="display:none;z-index:2" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-display-topright w3-text-teal">Close
    <i class="fa fa-remove"></i>
  </a>
  <a href="#" style="text-decoration: none;" class="w3-bar-item w3-button">Visakhapatnam</a>
  <a href="#" style="text-decoration: none;" class="w3-bar-item w3-button">Patna</a>
  <a href="#" style="text-decoration: none;" class="w3-bar-item w3-button">Chennai</a>
  <a href="#" style="text-decoration: none;" class="w3-bar-item w3-button">Banglore</a>
  <a href="#" style="text-decoration: none;" class="w3-bar-item w3-button">Mumbai</a>
</nav>

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a style="text-decoration: none;" href="index.html" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Home</a>
  <a style="float: right;text-decoration: none;" href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white ">Contact Us</a>
  <a style="float: right;text-decoration: none;" href="#pricing" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Price</a>
  <a style="float: right;text-decoration: none;" href="<%=request.getContextPath()%>/UserController?action=invalidate" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Sign out</a>

  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
    <a  style="text-decoration: none;" href="#contact" class="w3-bar-item w3-button">Contact Us</a>
    <a  style="text-decoration: none;" href="#pricing" class="w3-bar-item w3-button">Price</a>
    <a  style="text-decoration: none;" href="<%=request.getContextPath()%>/UserController?action=invalidate" class="w3-bar-item w3-button">Sign out</a>
    
  </div>
</div>

<div>
<div class="w3-container w3-padding-64 w3-center well" id="team">
<div class="container well" style="border: none;">
<%String name=(String) request.getAttribute("name");
Integer count=(Integer) request.getAttribute("govtcount");
%>

    <h3><font style="color:darkorange ;float: left;display: block;">Welcome <%=name %> ! we are &#9786; you are here...</font></h3>
   </div>
<!-- <p>Meet the team - our office rats:</p> -->

<div class="w3-row">

<div class="w3">
   <div class="container">
  
   <div class="w3-container">
  
  
       <div style="width: 100%" class="w3-bar w3-black container">
       
    
    <button class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event,'London')" >Government Bookings</button>
        
    
    
    <button class="w3-bar-item w3-button tablink " onclick="openCity(event,'Paris')" style="margin-left:30%;"> Booking Status</button>
    
    
    <button class="w3-bar-item w3-button tablink pull-right" onclick="openCity(event,'Tokyo')">Private Bookings</button>
  </div>
  
  <div id="London" class=" w3-half w3-container w3-bottombar city well">
     
    <div class="container">
  
   <%if(count>=2){ %>
    <h4 style="text-align: left">You Already Booked Two Government Tankers Please <br> book Private Tanker</h4>
    
    <p style="text-align: left">To Avail this offer click on Book now below. Our representatives will assist you.</p>
    
  <button style="width: 190px;height: 40px;" type="button" class="btn btn-info btn-lg pull-left" data-toggle="modal" data-target="#myModal" disabled>Book Now</button>
    <%} 
    else { %>
     <h4 style="text-align: left">Book 2 Tankers under Government Authorities</h4>
    
    <p style="text-align: left">To Avail this offer click on Book now below. Our representatives will assist you.</p>
    
    <button style="width: 190px;height: 40px;" type="button" class="btn btn-info btn-lg pull-left" data-toggle="modal" data-target="#myModal">Book Now</button>
  
    <%} %>
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Do you wish to continue with the same address you have provided during registration? If not please mention the address below :</h4>
        </div>
        <div class=" container modal-body">
          
  <form action="UserController" method="post">
    <div class="form-group ">
        <label class="pull-left"  for="usr">Mention your address :</label>
        <input class="pull-left col-sm-4" type="text"  name="address"><br/><br/>
        
   
  <div class="form-group pull-left ">
  <b>Select Zone:</b>
   
  <select id="zone" name="zone">
  <option value="north" >North</option>
  <option value="south" >south</option>
  <option value="east" >east</option>
  <option value="west" >west</option>
</select>
</div>
        
        
         <input type="hidden" name="action" value="user_govt_booking">
        <input style="width: 190px;height: 40px; margin-left: 10%;" type="submit" class="btn btn-info btn-lg pull-left" value="Book">

       
    </div>
  </form>
</div>
        </div>
    
      </div>
      
    </div>
  </div>
  
</div>
  </div>
  <div id="Paris" class="w3-full  w3-container w3-bottombar city well" style="display:none">
    <div class="container" >
  <form action="UserController">
   <input type="hidden" name="action" value="user_booked_status">
  <input style="width: 190px;height: 40px;" type="submit" class="btn btn-info btn-lg " value="Status">

  </form>
  </div>
  
</div>
    
    
  </div>

  <div id="Tokyo" class=" w3-half pull-right w3-container w3-bottombar city well" style="display:none">
   <h4 style="text-align: left" >Book Unlimited Tankers</h4>
    
     <p style="text-align: left" >To Avail this offer click on Book now below. Our representatives will assist you.</p>
    
     
     
    <div class="container">
  
  <!-- Trigger the modal with a button -->
  <form action="UserController" method="post">
 <input type="hidden" name="action" value="show_next_page">
   <input style="width: 190px;height: 40px;" type="submit" class="btn btn-info btn-lg pull-left">Book Now</button>
</form>
  <!-- Modal -->
  <div class="modal fade" id="myModals" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button> 
          <h4 class="modal-title">Do you wish to continue with the same address you have provided during registration? If not please mention the address below :</h4>
        </div>
        <div class=" container modal-body">
          
  <form>
    <div class="form-group ">
        <label class="pull-left"  for="usr">Mention your address :</label>
        <input class="pull-left col-sm-4" type="text" id="usr2">
       <span class=" btn btn-info btn-lg glyphicon glyphicon-home"></span> 
    </div>
  </form>
</div>
          
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
          <button type="button" class="btn btn-default" data-dismiss="modal">Proceed</button>
       
        </div>
      </div>
      
    </div>
  </div>
  
</div>

     
     
     
     </div>
</div>

   
   
       
   </div>
  
</div>




<!-- Work Row -->


<!-- Container -->





<!-- Pricing Row -->

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3806.673180676569!2d78.32943931443953!3d17.42746498805461!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb937bc7999783%3A0x77ddedcaeb1fa496!2sTCS+ILP+%2CQ-CITY+NANAKRAM+GUDA!5e0!3m2!1sen!2sin!4v1507885129130" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>


<div class="w3-row-padding w3-center w3-padding-64" id="pricing">
    <h2><font style="color: darkorange">Price Chart</font></h2>
    <p>Choose a pricing plan that fits your needs.</p><br>
   
 
 <div class="w3-half w3-margin-bottom">
      <ul class="w3-ul w3-border w3-hover-shadow">
        <li class="w3-theme-l2">
          <p class="w3-xlarge">Government</p>
        </li>
         <li class="w3-padding-16"><b>Govt funded Water Supply</b> </li>
        <li class="w3-padding-16"><b>Underground Water with UV Treatement</b> </li>
        <li class="w3-padding-16"><b>Available in various quantities</b> </li>
        <li class="w3-padding-16"><b>Limited by 2</b> </li>
        <li class="w3-padding-16">
          <h2 class="w3-wide"><i class="fa fa-rupee"></i> 20</h2>
          <span class="w3-opacity">per litre</span>
        </li>
        <li class="w3-theme-l5 w3-padding-24">
          <button class="w3-button w3-teal w3-padding-large"><i class="fa fa-check"></i> Book</button>
        </li>
      </ul>
    </div>
 
 
    <div class="w3-half w3-margin-bottom">
      <ul class="w3-ul w3-border w3-hover-shadow">
        <li class="w3-theme-l2">
          <p class="w3-xlarge">Private</p>
        </li>
         <li class="w3-padding-16"><b>Private funded Water Supply</b> </li>
        <li class="w3-padding-16"><b>Underground water with UV Treatement</b> </li>
        <li class="w3-padding-16"><b>Available in various quantities</b> </li>
        <li class="w3-padding-16"><b>Unlimited Supply based on availability</b> </li>
        <li class="w3-padding-16">
          <h2 class="w3-wide"><i class="fa fa-rupee"></i> 50</h2>
          <span class="w3-opacity">per litre</span>
        </li>
        <li class="w3-theme-l5 w3-padding-24">
          <button class="w3-button w3-teal w3-padding-large"><i class="fa fa-check"></i> Book</button>
        </li>
      </ul>
    </div>

   
</div>

<!-- Contact Container -->
<div class="w3-container w3-padding-64 w3-theme-l5" id="contact">
  <div class="w3-row">
    <div class="w3-col m5">
    <div class="w3-padding-16"><span class="w3-xlarge w3-border-teal w3-bottombar"><font style="color: darkorange">Contact Us</font></span></div>
      <h3>Address</h3>
      <p>Share your valuable feedback with us.</p>
      <p><i class="fa fa-map-marker w3-text-teal w3-xlarge"></i>  Q-City Hyderabad</p>
      <p><i class="fa fa-phone w3-text-teal w3-xlarge"></i>  +00 1515151515</p>
      <p><i class="fa fa-envelope-o w3-text-teal w3-xlarge"></i> feedback@tcs.com</p>
    </div>
    <div class="w3-col m7">
      <form class="w3-container w3-card-4 w3-padding-16 w3-white" action="/action_page.php" target="_blank">
      <div class="w3-section">      
        <label>Name</label>
        <input class="w3-input" type="text" name="Name" required>
      </div>
      <div class="w3-section">      
        <label>Email</label>
        <input class="w3-input" type="text" name="Email" required>
      </div>
      <div class="w3-section">      
        <label>Message</label>
        <input class="w3-input" type="text" name="Message" required>
      </div>  
      
      <button type="submit" class="w3-button w3-right w3-theme">Send</button>
      </form>
    </div>
  </div>
</div>

<!-- Google Maps -->

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
  
  <p style="margin-top: 2%">Designed by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">TCS - ILP - HYDERABAD </a></p>

  <div style="position:relative;bottom:100px;z-index:1;" class="w3-tooltip w3-right">
    <span class="w3-text w3-padding w3-teal w3-hide-small">Go To Top</span>   
    <a class="w3-button w3-theme" href="#myPage"><span class="w3-xlarge">
    <i class="fa fa-chevron-circle-up"></i></span></a>
  </div>
</footer>

<script>
// Script for side navigation
function w3_open() {
    var x = document.getElementById("mySidebar");
    x.style.width = "300px";
    x.style.paddingTop = "10%";
    x.style.display = "block";
}

// Close side navigation
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
}

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


<script>
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " w3-red";
}
</script>



</body>
</html>

