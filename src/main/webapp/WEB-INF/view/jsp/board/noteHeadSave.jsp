<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>

</style>
</head>
<body>
	<div class="modal fade" id="noteHeadSaveModal" role="dialog">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
      				<h4 class="margin-top-none margin-bottom-none grayscale">Save Information</h4>
      			</div>
      			
						<div class="modal-body">
							<div class="row">
									  <div class="col-xs-3">
									    <div class="form-group">
									      <select id="selectType" class="selectpicker form-control" data-live-search="true" title="<i class='fas fa-tags grayscale input-icon'></i>Type">
									      	<c:forEach items="${meetingTypes}" var="meetingType">
									        	<option title="<i class='fas fa-tag grayscale input-icon'></i>${meetingType.meetingTypeNM}">${meetingType.meetingTypeNM}</option>
									        </c:forEach>
									      </select>
									    </div>
									  </div>
									  <div class="col-xs-9">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-map-pin grayscale"></i></div>
													<input id="locationInput" type="text" class="form-control" placeholder="Location">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
													<input id="titleInput" type="text" class="form-control" placeholder="Title">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div id="attendantsDiv" class="input-group stylish-input-group-both">
													<div class="input-group-addon cursor"><i class="fas fa-user-plus grayscale"></i></div>
													<input id="attendantsInput" type="text" disabled class="form-control cursor" placeholder="Attendants">
													<div class="input-group-addon cursor"><i class="fas fa-search grayscale"></i></div>
									      </div>
									    </div>
									  </div>
									</div>
						</div>
					
						<div class="modal-footer">
							sDF
						</div>
    		</div>
		</div>
	</div>
</body>
<script>

$( document ).ready(function() {
 
});

</script>
</html>