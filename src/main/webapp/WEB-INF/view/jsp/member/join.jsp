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
                
                <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address" required>
                <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
 				<input type="password" id="inputPassword" name="inputComfirmPassword" class="form-control" placeholder="Confirm Password" required>
                <input type="text" id="inputMemberNm" name="inputMemberNm" class="form-control" placeholder="Name" required autofocus>
                <input type="text" id="inputCompany" name="inputCompany" class="form-control" placeholder="Company" required>
                <input type="text" id="inputDept" name="inputDept" class="form-control" placeholder="Department" required>
                <input type="text" id="inputJobs" name="inputJobs" class="form-control" placeholder="Role" required>
                <input type="text" id="inputPhone" name="inputPhone" class="form-control" placeholder="Phone Number" required>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                
						<div class="form-group ">
							<button type="submit" class="btn btn-lg btn-block Join-button">Join</button>
						</div>
		   
            </form><!-- /form -->
            </div>
            </div>

</body>
</html>