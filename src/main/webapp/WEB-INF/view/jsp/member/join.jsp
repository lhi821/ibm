<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- join form -->
	<form id="newJoinForm" action="/member/create" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<!-- new post Modal -->
		<div class="modal fade" id="newJoinModal" role="dialog">
		  <div class="modal-dialog modal-sm">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-body">
		      
						<div class="form-group">
							<label for="MemberName" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
									<input type="text" class="form-control" name="MemberName" id="MemberName"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="emailAddr" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa"></i></span>
									<input type="text" class="form-control" name="emailAddr" id="emailAddr"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phoneNumber" class="cols-sm-2 control-label">Phone Number</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone fa"></i></span>
									<input type="text" class="form-control" name="phoneNumber" id="phoneNumber"/>
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
		      </div>

		    </div>
		  </div>
		</div>
	</form>

</body>
</html>