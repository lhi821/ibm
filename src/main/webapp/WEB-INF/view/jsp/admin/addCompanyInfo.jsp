<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

	<form id="addMTCForm" action="/admin/createCompany" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="modal fade" id="addCompanyModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
					
						<div class="form-group">
							<label for="companyNM" class="cols-sm-2 control-label">Company Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<input type="text" class="form-control" name="companyNM" id="companyNM" size="100"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="address" class="cols-sm-2 control-label">Address</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<input type="text" class="form-control" name="address" id="address" size="100"/>
								</div>
							</div>
						</div>
						
							<div class="form-group">
							<label for="tel" class="cols-sm-2 control-label">Tel</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<input type="text" class="form-control" name="tel" id="tel" size="100"/>
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