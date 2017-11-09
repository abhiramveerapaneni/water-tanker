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
 <div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-hover-white w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a style="float: right;text-decoration: none;" href="<%=request.getContextPath()%>/AdminController?action=admin_out" class="w3-bar-item w3-button w3-hide-small w3-hover-white">Sign Out</a>
  

 
 
  </div> 

  <!-- Navbar on small screens -->
  <div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium">
    <a  style="text-decoration: none;" href="<%=request.getContextPath()%>/AdminController?action=admin_out" class="w3-bar-item w3-button">Sign Out</a>
    
  </div>  
</div>

<div class="w3-container w3-padding-64 w3-center well" id="team" >
    <h3><font style="color:teal ;float: left;display: block;">Welcome Admin ! we are &#9786; you are here...</font></h3>
       
   </div>
 <form action="AdminController" method="post">
<div class="container well">
<h2>Find Different Areas Deliveries</h2>
  <br>
  <table class="table table-bordered table-striped">
  <thead>
      <tr>
        <th>Select Zone</th>
        <th>Choose</th>
      </tr>
      </thead>
      <tbody id="myTable">
     
       <tr>
        <td>North</td>
        <td>
        <label class="switch"> 
        <span class="slider round"></span> 
        <input  type="radio" name="zone" value="North" >
        <span class="slider round"></span> 
        </label> 
        </td>
      </tr>
      
       <tr>
        <td>South</td>
        <td>
        <label class="switch"> 
        <span class="slider round"></span> 
        <input  type="radio" name="zone" value="South" >
        <span class="slider round"></span> 
        </label> 
        </td>
      </tr>
      
       <tr>
        <td>East</td>
        <td>
        <label class="switch"> 
        <span class="slider round"></span> 
        <input  type="radio" name="zone" value="East" >
        <span class="slider round"></span> 
        </label> 
        </td>
      </tr>
      
       <tr>
        <td>West</td>
        <td>
        <label class="switch"> 
        <span class="slider round"></span> 
        <input  type="radio" name="zone" value="West" >
        <span class="slider round"></span> 
        </label> 
        </td>
      </tr>
      
      </tbody>
  </table>

 
  <input type="hidden" name="action" value="ShowData">
  <input style="width: 190px;height: 40px;" type="submit" class="btn btn-info btn-lg pull-left" value="Show Data">
  <input style="width: 190px;height: 40px; margin-left: 3%;" type="reset" class="btn btn-info btn-lg pull-left" value="Reset">
  
  
</div> 
 </form>
  

<!-- Work Row -->


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





</body>
</html>

