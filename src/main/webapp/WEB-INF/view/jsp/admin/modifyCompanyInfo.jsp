<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

	<form id="modifyCompanyForm" action="" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="modal fade" id="modifyCompanyModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
					
					<div class="form-group">
						<div class="input-group">
						  <input type="hidden" class="form-control" name="companyID" id="companyID" size="100" />
						</div>
					</div>
					
						<div class="form-group">
							<label for="companyNM" class="cols-sm-2 control-label">Company Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="companyNM" id="companyNM" size="100"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="address" class="cols-sm-2 control-label">Company Address</label>
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
							<button id="mtUpdateBtn" type="submit" name="submit" value="submit" class="btn btn-lg btn-block login-button">Submit</button>
						</div>
						<div class="form-group">
							<button id="mtDeleteBtn" type="submit" name="delete" value="delete" class="btn btn-lg btn-block login-button">Delete</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<script>

//Getting Data
$('#modifyCompanyModal').on('show.bs.modal', function(e){
	var companyID = $(e.relatedTarget).data('id');
	var companyNM = $(e.relatedTarget).data('nm');
	var address = $(e.relatedTarget).data('address');
	var tel = $(e.relatedTarget).data('tel');
	$(e.currentTarget).find('input[name="companyID"]').val(companyID);
	$(e.currentTarget).find('input[name="companyNM"]').val(companyNM);
	$(e.currentTarget).find('input[name="address"]').val(address);
	$(e.currentTarget).find('input[name="tel"]').val(tel);
});

$(document).ready(function() {
	//삭제
	$("#mtDeleteBtn").click(function(){
		$("#modifyCompanyForm").attr("action", "/admin/deleteCompany").submit();
	});
	
	//수정
	$("#mtUpdateBtn").click(function(){
		$("#modifyCompanyForm").attr("action", "/admin/updateCompany").submit();
	});
});

</script>
</html>