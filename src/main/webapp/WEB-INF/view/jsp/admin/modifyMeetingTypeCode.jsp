<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>

	<form id="modifyMTCForm" action="" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<div class="modal fade" id="modifyMTCModal">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-body">
					
					<div class="form-group">
						<div class="input-group">
						  <input type="hidden" class="form-control" name="meetingTypeID" id="meetingTypeID" size="100" />
						</div>
					</div>
					
						<div class="form-group">
							<label for="meetingTypeCodeName" class="cols-sm-2 control-label">Code Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<!-- <span class="input-group-addon"><i class="fa fa-lock fa-lg"></i></span> -->
									<!-- 이전창에서 name & desc 받아와서 띄워야댐 -->
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
									<input type="text" class="form-control" name="codeColor" id="codeColorMod" size="100"/>
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

//Getting data from config1.jsp
$('#modifyMTCModal').on('show.bs.modal', function(e){
	var meetingTypeID = $(e.relatedTarget).data('id');
	var meetingTypeNM = $(e.relatedTarget).data('nm');
	var meetingTypeDesc = $(e.relatedTarget).data('desc');
	var codeColor = $(e.relatedTarget).data('color');
	$(e.currentTarget).find('input[name="meetingTypeID"]').val(meetingTypeID);
	$(e.currentTarget).find('input[name="meetingTypeNM"]').val(meetingTypeNM);
	$(e.currentTarget).find('input[name="meetingTypeDesc"]').val(meetingTypeDesc);
	
	$('#codeColorMod').colorpicker({"color": codeColor});
	$(e.currentTarget).find('input[name="codeColor"]').val(codeColor);
	$('#codeColorMod').colorpicker({
    format: null
  });
});

$(document).ready(function() {
	//삭제
	$("#mtDeleteBtn").click(function(){
		$("#modifyMTCForm").attr("action", "/admin/delete").submit();
	});
	
	//수정
	$("#mtUpdateBtn").click(function(){
		$("#modifyMTCForm").attr("action", "/admin/update").submit();
	});

  
});


</script>
</html>