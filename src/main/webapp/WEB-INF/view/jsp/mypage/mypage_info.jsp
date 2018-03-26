<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String usrId = (String)session.getAttribute("id");  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.9.1.js"  type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/board/index.css">
</head>

<script type="text/javascript">
	
	$(function(){
		
		$('#name').val('${userName}');
		$('#company').val('${userCompany}');
		$('#dept').val('${userDept}');
		$('#position').val('${userJobs}');
		$('#phone').val('${userPhone}');
		$('#email').val('${userEmail}');
	
		
	})
	
</script>

<body>

	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	
	<!-- sidebar -->
	<jsp:include page="../layout/sidebar.jsp"></jsp:include>
	
	<!-- posts area -->
	<div class="col-xs-10 affix-content">
		<div class="container affix-container">
			<form action="/mypage/editInfo.do" method="get" >
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="memberid" value="${userId}"/>
				
				<div class="row">
					<div class="container">
					<!-- 여기가 화면 -->
					<ul class="nav nav-tabs">
						<li><a href="/mypage/main" class="a"><i class="far fa-calendar-alt"></i> Calendar </a></li>
						<li><a href="/mypage/history" class="a"><i class="fas fa-history"></i> History </a></li>
						<li class="active"><a href="/mypage/info" class="a"><i class="fas fa-info"></i> Information </a></li>
					</ul>
					
					<div id="contentsDiv" style="padding-top: 20px;">
					<div class="panel panel-default">
						<div class="panel-heading"><h4 class="text-muted">You can edit your personal information.</h4>
						</div>
						<div class="panel-body">
						<div class="form-group">
								<label for="MemberName" class="cols-sm-2 control-label">Your Name</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user fa"></i></span>
										<input type="text" class="form-control" name="name" id="name" disabled/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Company</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fas fa-building"></i></span>
										<input type="text" class="form-control" name="company" id="company"/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Department</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fas fa-archive"></i></span>
										<input type="text" class="form-control" name="dept" id="dept"/>
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Position</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fas fa-users"></i></span>
										<input type="text" class="form-control" name="position" id="position"/>
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
								<label for="emailAddr" class="cols-sm-2 control-label">Your Email</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-envelope fa"></i></span>
										<input type="text" class="form-control" name="email" id="email"/>
									</div>
								</div>
							</div>

	
							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">Password</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span>
										<button type="button" class="btn" data-toggle="modal" data-target="#changePasswordModal">Change Password</button>
										<!-- <input type="password" class="form-control" name="password" id="password"/> -->
									</div>
								</div>
							</div>
	
						<!-- 	<div class="form-group">
								<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span>
										<input type="password" class="form-control" name="confirmPass" id="confirmPass"/>
									</div>
								</div>
							</div> -->
							
							</div>
						</div>
						<div class="form-group">
       						<div class="col-sm-12 text-center">
           						<button class="btn btn-defualt" type="submit"> Submit <i class="fa fa-check spaceLeft"></i></button>
           						<button class="btn" type="button">Cancel <i class="fa fa-times spaceLeft"></i></button>
					         </div>
					   </div>
					</div>
					<!-- 여기가 끝 -->
					</div>
				</div>
			
			</form>
		
		<!-- footer -->		
		<div class="row">
			<div class="container">
				<jsp:include page="../layout/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
<!-- Modal -->
<jsp:include page="../mypage/changePassword.jsp"></jsp:include>

</body>

</html>