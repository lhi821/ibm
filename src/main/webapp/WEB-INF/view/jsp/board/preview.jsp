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
	<div class="modal fade" id="previewModal" role="dialog">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
      			<div class="modal-header">
      				<h4 class="margin-top-none grayscale">preview</h4>
      			</div>
      			
						<div class="modal-body">
							<form id="previeModal" action="/board/create" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="row">
								<div class="left-padding">
					    		<div class="col-xs-12 small grayscale">
					    			<span class="cursor"><i class="fas fa-folder-open"></i> Proejct 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span class="cursor"><i class="far fa-folder-open"></i> Sub menu 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span><i class="far fa-file-alt"></i> ${resultMap.result.meetingNote.MEETINGNOTEID}</span>
					    		</div>
				    		</div>
				    	</div>
				    	<div class="panel panel-default">
					    	<div class="panel-heading">
						    	<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<label class="grayscale">Main Point</label>
												<textarea readonly id="previewMainPoint" placeholder="Main Point" class="form-control context-menu" rows="2" >${resultMap.result.meetingNote.MAINPOINT}</textarea>
									    </div>
									  </div>
									</div>
									<div id="previewActionItemRows">
								    <div class="row">
											<div class="col-xs-12">
												<div class="form-group">
														<label class="grayscale">Action Item</label>
													<div class="input-group stylish-input-group-left">
														<div class="input-group-addon"><i class="fas fa-exclamation grayscale input-icon-action context-menu"></i></div>
														<input readOnly value='${actionItem.ACTIONITEM}' type="text" class="form-control action-item context-menu" placeholder="Action Item">
										      </div>
										    </div>
										  </div>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
											<label class="grayscale">key Word</label>
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fab fa-slack-hash grayscale"></i></div>
													<input readOnly value='${resultMap.result.hashTag}' id="previewKeyWordInput" type="text" class="form-control context-menu" placeholder="Key Word">
									      </div>
									    </div>
									  </div>
									</div>
						    </div>
					    </div>
						    	
							<div class="panel panel-default">
						    <div class="panel-heading bg-gray">
						    	<div class="row">
									  <div class="col-xs-2">
									    <div class="form-group">
									      <div class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="fas fa-tag grayscale"></i></div>
											    <input id="preveiwSelectType" class="form-control context-menu left-padding" readonly value="${resultMap.result.meetingNote.MODDATE}">
											  </div>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="far fa-calendar-alt grayscale"></i></div>
											    <input id="preveiwDateInput" class="form-control context-menu left-padding" readonly value="${resultMap.result.meetingNote.MODDATE}">
											  </div>
											</div>
									  </div>
									   <div class="col-xs-2">
									    <div class="form-group">
									     	<div class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="far fa-clock grayscale"></i></div>
											    <input id="preveiwStartTime" class="form-control context-menu left-padding" readonly value="${resultMap.result.meetingNote.MODDATE}">
											  </div>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
									  		<div class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="fas fa-clock grayscale"></i></div>
											    <input id="preveiwEndTime" class="form-control context-menu left-padding" readonly value="${resultMap.result.meetingNote.MODDATE}">
											  </div>
								    	</div>
									  </div>
									  <div class="col-xs-4">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-map-pin grayscale"></i></div>
													<input readonly value='${resultMap.result.meetingNote.LOCATION}' id="preveiwLocationInput" type="text" class="form-control context-menu" placeholder="Location">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-10">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
													<input readonly id="preveiwTitleInput" type="text" class="form-control context-menu" placeholder="Title" value='${resultMap.result.meetingNote.TITLE}'>
									      </div>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
									      <select id="preveiwMtnVersion" class="selectpicker form-control" title="<i class='fas fa-code-branch grayscale input-icon'></i>Version">
									        <option selected data-subtext="Version" title="<i class='fas fa-code-branch grayscale input-icon'></i>1">1</option>
												</select>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div id="preveiwAttendantsDiv" class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="fas fa-user-plus grayscale"></i></div>
													<input readonly value='${resultMap.result.attendant}' id="previewAttendantsInput" type="text" disabled class="form-control context-menu" placeholder="Attendants">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-6 text-left">
								    	<input id="previewToggle-event" class='context-menu' type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="Dialogue" data-off="Plan Text" data-onstyle="default">
								    	<input id="previewHiddenToggle" class='context-menu' type="hidden" value ='${resultMap.result.contentsList[0].SPEAKERID}'>
									  </div>
									  <div class="col-xs-6 text-right">
									  </div>
									</div>
						    </div>
						    <div class="panel-body">
									<div id="preveiwPainTextBox" class="row display-none">
										<div class="col-xs-12">
											<div class="form-group">
													<textarea readonly id="previewPlanContents" placeholder="Please fill out the Meeting Note..." class="form-control border-none" rows="10" >
														${planContents}
													</textarea>
									    </div>
									  </div>
								  </div>
								  <div id='previewDialogueBox'>
									  <div class="row">
										  <div class="col-xs-12">
								  			<div class="col-xs-1 padding-left-small">
													<div class="text-right">
														<span class="grayscale context-menu chooseUser"><i class="fas fa-user-circle chat-user"></i><span id='previewChooseUserNm0' class='chooseUserNm'> ${contents.MEMBERNM}</span></span>
													</div>
												</div>
												<div class="col-xs-11">
													<div class="bubble">
														<textarea id='previewDialogueContents' placeholder="Please fill out the Meeting Note..." class="form-control border-none dialogueContents" rows="5">
															${contents.CONTENTS}
														</textarea>
														<div class="text-right">
															<!-- <i class="fas fa-comment-alt grayscale context-menu chat-icon addDialogue"></i> -->
														</div>
													</div>
												</div>
										  </div> 
										</div>
									</div>
						    </div>
						  </div>
						  
						</form>			
						</div>
					
						<div class="modal-footer">
							<div class="text-right">
								<button id="previewCancel" type="button" class="btn btn-default btn-sm">
									Cancel
								</button>
								<button id="previewSave" type="button" class="btn btn-default btn-sm">
									<i class="fas fa-save"></i> Save
								</button>
							</div>
						</div>
    		</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function(){
  $("#previewCancel").click(function(){
    $("#previewModal").modal("hide");
  });
  $("#previewSave").click(function(){
    $("#previewModal").modal("hide");
    saveMtn("save");
  });
})

</script>
</html>