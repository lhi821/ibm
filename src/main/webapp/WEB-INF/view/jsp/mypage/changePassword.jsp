<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="/lib/bootstrap-validator-master/js/validator.js"></script>
<script type="text/javascript"> 
$(function() {
	$("#changePassword").validate(); 
	
}); 
</script> 
<body>
	<div class="modal fade bs-example-modal-sm" id="changePasswordModal">
  		<div class="modal-dialog modal-sm">
   			 <div class="modal-content">
   			 	<div class="modal-header">
   			 		<h4 class="margin-top-none grayscale">Change Password</h4>
   			 	</div>
   			 	<div class="modal-body">
	   			 	<form id="changePassword" method="get" data-toggle="validator" role="form" action="/mypage/editPassword.do">
	   			 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			 			<div class="form-group">
			 				<div class="input-group">
				                <span class="input-group-addon""><i class="fa fa-lock"></i></span>
				                <input type="password" id="inputNewPassword" name="inputNewPassword" class="form-control" placeholder="New Password" required>
			 				</div>
			 			</div>
			 			<div class="form-group">
			 				<div class="input-group">
			               	 <span class="input-group-addon""><i class="fa fa-lock"></i></span>
			                	<input type="password" id="inputConfirmPassword" name="inputConfirmPassword" data-match="#inputNewPassword" data-match-error="Whoops, these don't match" placeholder="Confirm" class="form-control" placeholder="Confrim New Password" required>
			 				</div>
			 				<div class="help-block with-errors"></div>
			 			</div>
			 			<button class="btn btn-lg btn-block" type="submit">Confirm</button>
               			<!-- TODO 취소버튼만들기 -->
					</form>
				</div>
    		</div>
  		</div>
	</div>
</body>
</html>