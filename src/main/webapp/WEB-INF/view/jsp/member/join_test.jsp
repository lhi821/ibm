<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/css/member/join.css">
</head>
<body>

	<!-- join form -->
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<!-- new post Modal -->
		<div class="container modal fade" id="newJoinModal" >
		   <div class="card card-container">
            <form id="newJoinModal" class="form-join" method="post" action="/member/join" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
                <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> Remember me
                    </label>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" >Sign in</button>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            
						<div class="form-group">
							<label for="MemberName" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
									<input type="text" class="form-control" name="membernm" id="membernm"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="CompanyID" class="cols-sm-2 control-label">Company</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
									<input type="text" class="form-control" name="companyid" id="companyid"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="Department" class="cols-sm-2 control-label">Department</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
									<input type="text" class="form-control" name="dept" id="dept"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="Jobs" class="cols-sm-2 control-label">Jobs</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
									<input type="text" class="form-control" name="jobs" id="jobs"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="emailAddr" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa"></i></span>
									<input type="text" class="form-control" name="email" id="email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phoneNumber" class="cols-sm-2 control-label">Phone Number</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone fa"></i></span>
									<input type="text" class="form-control" name="phone" id="phone"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span>
									<input type="password" class="form-control" name="password" id="password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"/>
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit" class="btn btn-lg btn-block login-button">Join</button>
						</div>
		   
            </form><!-- /form -->
            </div>
            </div>

</body>
</html>