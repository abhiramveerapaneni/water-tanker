<%-- 
    Document   : after_login_user
    Created on : Oct 14, 2017, 11:17:32 PM
    Author     : GAUTHAM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
 <head>
<style>
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
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
  <a style="text-decoration: none;" href="#" class="w3-bar-item w3-button w3-teal"><i class="fa fa-home w3-margin-right"></i>Home</a>
  <a style="float: right;text-decoration: none;" href="#contact" class="w3-bar-item w3-button w3-hide-small w3-hover-white ">Contact Us</a>
  <a style="float: right;text-decoration: none;" href="#pricing" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Price</a>
  <a style="float: right;text-decoration: none;" href="<%=request.getContextPath()%>/UserController?action=invalidate" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Sign out</a>

  </div>

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
    <a  style="text-decoration: none;" href="#pricing" class="w3-bar-item w3-button">Price</a>
    <a  style="text-decoration: none;" href="#contact" class="w3-bar-item w3-button">Contact Us</a>
    <a  style="text-decoration: none;" href="<%=request.getContextPath()%>/UserController?action=invalidate" class="w3-bar-item w3-button">Sign out</a>
    
  </div>
</div>

<!-- Image Header -->


<!-- Modal -->

<!-- Team Container -->
<div>
<div class="w3-container w3-padding-64 w3-center well" id="team">
<%String name=(String) request.getAttribute("name"); %>
    <h3><font style="color:teal ;float: left;display: block;">Welcome <%=name %> ! we are &#9786; you are here...</font></h3>
       
   </div>
 <form action="UserController" method="post">
<div class="container well">
<h2>Find Different Suppliers</h2>
 <p>Type something in the input field to search the table for names of the company:</p>  
 <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
  <thead>
      <tr>
        <th>Suppliers name</th>
        <th>Price</th>
        <th>Address</th>
        <th>Choose</th>
      </tr>
      </thead>
      <tbody id="myTable">
      <%ResultSet rs=(ResultSet)request.getAttribute("company"); 
      while(rs.next()){
      %>
       <tr>
        <td><%=rs.getString(1) %></td>
        <td><%=rs.getString(2) %></td>
        <td><%=rs.getString(3) %></td>
        
        <td>
        <label class="switch"> 
        <%String com=rs.getString(1);
        if(com.equals("Government")){
        %>
  <input  type="radio" name="company_name" value="<%=rs.getString(1)%>" disabled>
   <span class="slider round"></span> 
  <%}
        else{%>
        <input  type="radio" name="company_name" value="<%=rs.getString(1)%>" >
        <span class="slider round"></span> 
        <%} %>
  
</label> 
        </td>
      </tr>
      <%} %>
      </tbody>
  </table>
  <div class="container well" style="width: 97%;">
 <b> Enter your address: </b>     <font><font color="red">*</font> please enter if address differ from aadhar address</font> <input class="form-control" type="text" name="address" id="address" placeholder="enter address" ">
 
 <div class="form-group pull-left ">
  <b>Select Zone:</b>
   
  <select id="zone" name="zone" style="margin-top: 15%;">
  <option value="north" >North</option>
  <option value="south" >south</option>
  <option value="east" >east</option>
  <option value="west" >west</option>
</select>
</div>
 
 </div>
 
  <input type="hidden" name="action" value="Private_Booking">
  <input style="width: 190px;height: 40px;" type="submit" class="btn btn-info btn-lg pull-left" value="Book Now">
  <input style="width: 190px;height: 40px; margin-left: 3%;" type="reset" class="btn btn-info btn-lg pull-left" value="Reset">
  
  
</div> 
 </form>
  <!-- <form>
<div class="container well">
  <h2>Find Different Suppliers</h2>
  <p>Type something in the input field to search the table for names of the company:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Suppliers name</th>
        <th>Price</th>
        <th>Choose</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td>xyz</td>
        <td>300</td>
        <td>
        <label class="switch">
  <input type="radio" name="radio">
  <span class="slider round"></span>
</label>
        </td>
      </tr>
      
      <tr>
        <td>abc</td>
        <td>330</td>
        <td>
         <label class="switch">
  <input type="radio" name="radio">
  <span class="slider round"></span>
</label>
        </td>
      </tr>
     
     <tr>
        <td>dlf</td>
        <td>240</td>
        <td>
         <label class="switch">
  <input type="radio" name="radio">
  <span class="slider round"></span>
</label>
        </td>
      </tr>
    </tbody>
  </table>
  
  <input type="submit" value="submit">
  <input type="reset" value="reset">
</div>
</form>

 -->



<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

  
  
  
  
  
  
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

