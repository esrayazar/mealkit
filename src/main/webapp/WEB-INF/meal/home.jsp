<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/home.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>
	<a class="contact" href="">Contact us</a> | <a class="signup" href="/register">Sign up</a> | <a class="signin" href="/login">Sign in</a> | <a class="logout" href="/logout">Logout</a>
	<div>
	<form action="/search" method="get">
	<input name="term">
	 <select name="by"> 
	 <option value="name" >by food name</option>
	 <option value="ing" >by ingredients</option>
	</select>
	<button class="search" type= "submit">Search</button>
	</form>
	</div>
	
	<hr>
	<div class="container">
	<div class="row">
	<form action="/searchByCountry" method="get">
	<select name="country">
		<c:forEach items="${apiAreas.areas}" var="area">
		<option value="${area.strArea}">${area.strArea}</option>
		</c:forEach>
		
		</select>
		<button type ="submit">SUBMIT</button>
		</form>
	</div>
	

	
	<div class="row text-center">
		<h3>
			Feeling hungry?
		</h3>

		<a href="/details/"><button class="randommeal" id="meal">Get a random meal</button></a>


	</div>

	

</div>
<div>
<footer class="footer">
        <div class="footer__addr">
              
   
          <address>
            5534 Somewhere In. The World 22193-10212<br>
                
            <a class="footer__btn" href="mailto:example@gmail.com">Email Us</a>
          </address>
        </div>
        
        <ul class="footer__nav">
          <li class="nav__item">
            <h4 class="nav__title">Media</h4>
      
            <ul class="nav__ul">
              <li>
                <a href="#">Online</a>
              </li>
      
              <li>
                <a href="#">Print</a>
              </li>
                  
              <li>
                <a href="#">Alternative Ads</a>
              </li>
            </ul>
          </li>
          
          <li class="nav__item nav__item--extra">
            <h4 class="nav__title">Technology</h4>
            
            <ul class="nav__ul nav__ul--extra">
              <li>
                <a href="#">Hardware Design</a>
              </li>
              
              <li>
                <a href="#">Software Design</a>
              </li>
              
              <li>
                <a href="#">Digital Signage</a>
              </li>
              
              <li>
                <a href="#">Automation</a>
              </li>
              
              <li>
                <a href="#">Artificial Intelligence</a>
              </li>
              
              <li>
                <a href="#">IoT</a>
              </li>
            </ul>
          </li>
          
          <li class="nav__item">
            <h4 class="nav__title">Legal</h4>
            
            <ul class="nav__ul">
              <li>
                <a href="#">Privacy Policy</a>
              </li>
              
              <li>
                <a href="#">Terms of Use</a>
              </li>
              
              <li>
                <a href="#">Sitemap</a>
              </li>
            </ul>
          </li>
        </ul>
        
        <div class="legal">
          <p>&copy; 2022 BestTeamEver. All rights reserved.</p>
          
          <div class="legal__links">
            <span>Made with <span class="heart">♥</span> remotely!</span>
          </div>
        </div>
      </footer>
</div>
	
	<script src="/js/home.js"></script>
</body>
</html>