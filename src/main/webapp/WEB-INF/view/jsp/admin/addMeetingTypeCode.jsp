<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

	<form id="addMTCForm" action="/admin/create" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="modal fade" id="addMTCModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
					
						<div class="form-group">
							<label for="meetingTypeCodeName" class="cols-sm-2 control-label">Code Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<input type="text" class="form-control" name="meetingTypeNM" id="meetingTypeNM" size="100"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="meetingTypeCodeDesc" class="cols-sm-2 control-label">Code Description</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<input type="text" class="form-control" name="meetingTypeDesc" id="meetingTypeDesc" size="100"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="codeColor" class="cols-sm-2 control-label">Code Color</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<input type="text" class="form-control" name="codeColor" id="codeColor" size="100"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<button type="submit" value="Save" class="btn btn-lg btn-block login-button">Submit </button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


</body>
</html>