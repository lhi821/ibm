<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/css/member/login.css">
	<link rel="stylesheet" type="text/css" href="/css/member/join.css">
	<!-- JS -->
	<script src="/js/member/login.js"></script>
	
</head>
<body>
	<div class="container modal fade" id="loginModal">
        <div class="card card-container">
        
        	<!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="/img/eyebeem.png" />
            <p id="profile-name" class="profile-name-card"></p>
            <form id="login-form" class="form-signin" method="post" action="/member/login">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="Email" name="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <input type="password" id="Password" name="inputPassword" class="form-control" placeholder="Password" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" >Sign in</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          
            
            <div class="forgot-password">
                <a href="#" >Forgot the password?</a>
            </div>
            <div class="join">
               <a href="#" id="register-form-link"> Join</a>
            </div>
            </form>
            
      
            <form id="register-form" class="form-join" method="post" action="/member/create" method="post" style="display: none;">
                
                 <div class="input-group">
				<span class="input-group-addon"><i class="fa fa-envelope fa"></i></span>
                <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                </div>
                
                <div class="input-group">
                <span class="input-group-addon""><i class="fa fa-lock"></i></span>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
 				</div>
 				
 				<div class="input-group">
 				<span class="input-group-addon"><i class="fa fa-lock"></i></span>
 				<input type="password" id="inputConfirmPassword" name="inputConfirmPassword" class="form-control" placeholder="Confirm Password" required>
				</div>
                
                <div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
                <input type="text" id="inputMemberNm" name="inputMemberNm" class="form-control" placeholder="Name" required>
                </div>
                
                <div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
                <input type="text" id="inputCompany" name="inputCompany" class="form-control" placeholder="Company">
                </div>
                
                <div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
                <input type="text" id="inputDept" name="inputDept" class="form-control" placeholder="Department">
                </div>
                
                <div class="input-group">
				<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
                <input type="text" id="inputJobs" name="inputJobs" class="form-control" placeholder="Role">
                </div>
                
                <div class="input-group">
				<span class="input-group-addon"><i class="fa fa-phone fa"></i></span>
                <input type="text" id="inputPhone" name="inputPhone" class="form-control" placeholder="Phone Number">
                </div>
                
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
				<div class="form-group form-group-join">
				<button type="submit" class="btn btn-lg btn-primary btn-block btn-join">Join</button>
				</div>
				
            </form>
        
            
        </div><!-- /card-container -->
    </div><!-- /container -->
    
	
    
</body>
</html>