<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navbar -->
	<jsp:include page="../layout/navbar.jsp"></jsp:include>
	
	<!-- sidebar -->
	<jsp:include page="../layout/sidebar.jsp"></jsp:include>
	
	<!-- posts area -->
	<input id="userId" value='${usrId}' type="hidden">
	<div class="col-xs-10 affix-content">
		<div class="container affix-container">
			<div class="row">
				<div class="container">
						<!-- new post form -->
						<form id="newPostForm" action="/board/create" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="row">
								<div class="left-padding">
					    		<div class="col-xs-12 small grayscale">
					    			<span class="cursor"><i class="fas fa-folder-open"></i> Proejct 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span class="cursor"><i class="far fa-folder-open"></i> Sub menu 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span><i class="fas fa-pencil-alt"></i> New Post</span>
					    		</div>
				    		</div>
				    	</div>
						    	
							<div class="panel panel-default">
						    <div class="panel-heading bg-gray">
						    	<div class="row">
									  <div class="col-xs-2">
									    <div class="form-group">
									      <select id="selectType" class="selectpicker form-control" data-live-search="true" title="<i class='fas fa-tags grayscale input-icon'></i>Type">
									      	<c:forEach items="${meetingTypes}" var="meetingType">
									        	<option value="${meetingType.meetingTypeID}" title="<i class='fas fa-tag grayscale input-icon'></i>${meetingType.meetingTypeNM}">${meetingType.meetingTypeNM}</option>
									        </c:forEach>
									      </select>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon cursor"><i class="far fa-calendar-alt grayscale"></i></div>
											    <input id="dateInput" class="form-control cursor left-padding" readonly data-toggle="datepicker" placeholder="Date">
											  </div>
											</div>
									  </div>
									   <div class="col-xs-2">
									    <div class="form-group">
									      <select id="startTime" class="selectpicker form-control" data-live-search="true" title="<i class='far fa-clock grayscale input-icon'></i>Start Time">
										      <c:forEach var="HH" begin="0" end="9" step="1">
										      	<option title="<i class='far fa-clock grayscale input-icon'></i>0${HH}:00">0${HH}:00</option>
										      	<c:forEach var="MM" begin="10" end="50" step="10">
		            							<option title="<i class='far fa-clock grayscale input-icon'></i>0${HH}:${MM}">0${HH}:${MM}</option>
		            						</c:forEach>
		            					</c:forEach>
										      <c:forEach var="HH" begin="10" end="23" step="1">
										      	<option title="<i class='far fa-clock grayscale input-icon'></i>${HH}:00">${HH}:00</option>
										      	<c:forEach var="MM" begin="10" end="50" step="10">
		            							<option title="<i class='far fa-clock grayscale input-icon'></i>${HH}:${MM}">${HH}:${MM}</option>
		            						</c:forEach>
		            					</c:forEach>
		            					<option title="<i class='far fa-clock grayscale input-icon'></i>24:00">24:00</option>
												</select>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
									  		<select id="endTime" class="selectpicker form-control" data-live-search="true" title="<i class='fas fa-clock grayscale input-icon'></i>End Time">
										      <c:forEach var="HH" begin="0" end="9" step="1">
										      	<option title="<i class='fas fa-clock grayscale input-icon'></i>0${HH}:00">0${HH}:00</option>
										      	<c:forEach var="MM" begin="10" end="50" step="10">
		            							<option title="<i class='fas fa-clock grayscale input-icon'></i>0${HH}:${MM}">0${HH}:${MM}</option>
		            						</c:forEach>
		            					</c:forEach>
										      <c:forEach var="HH" begin="10" end="23" step="1">
										      	<option title="<i class='fas fa-clock grayscale input-icon'></i>${HH}:00">${HH}:00</option>
										      	<c:forEach var="MM" begin="10" end="50" step="10">
		            							<option title="<i class='fas fa-clock grayscale input-icon'></i>${HH}:${MM}">${HH}:${MM}</option>
		            						</c:forEach>
		            					</c:forEach>
		            					<option title="<i class='fas fa-clock grayscale input-icon'></i>24:00">24:00</option>
												</select>
								    	</div>
									  </div>
									  <div class="col-xs-4">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-map-pin grayscale"></i></div>
													<input id="locationInput" type="text" class="form-control" placeholder="Location">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-10">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
													<input id="titleInput" type="text" class="form-control" placeholder="Title">
									      </div>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
									      <select id="mtnVersion" class="selectpicker form-control" title="<i class='fas fa-code-branch grayscale input-icon'></i>Version">
									        <option selected data-subtext="Version" title="<i class='fas fa-code-branch grayscale input-icon'></i>1">1</option>
												</select>
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
									<div class="row">
										<div class="col-xs-6 text-left">
								    	<input id="toggle-event" type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="Dialogue" data-off="Plan Text" data-onstyle="default">
									  </div>
									  <div class="col-xs-6 text-right">
									  	<button id="getNoteHeadBtn" type="button" class="btn btn-default btn-xs">
									  		<i class="fas fa-cloud-download-alt grayscale"></i> Get Information
											</button>
									  	<button id="setNoteHeadBtn" type="button" class="btn btn-default btn-xs">
									  		<i class="fas fa-cloud-upload-alt grayscale"></i> Save Information
											</button>
									  </div>
									</div>
						    </div>
						    <div class="panel-body">
									<div id="painTextBox" class="row display-none">
										<div class="col-xs-12">
											<div class="form-group">
													<textarea id="planContents" placeholder="Please fill out the Meeting Note..." class="form-control border-none" rows="10" ></textarea>
									    </div>
									  </div>
								  </div>
								  <div id="dialogueBox" class="row">
									  <div class="col-xs-12">
							  			<div class="col-xs-1 padding-left-small">
												<div class="text-right">
													<span class="grayscale cursor chooseUser"><i class="fas fa-user-plus chat-user"></i><span id='chooseUserNm0' class='chooseUserNm'> </span></span>
												</div>
											</div>
											<div class="col-xs-11">
												<div class="bubble">
													<textarea id='dialogueContents0' placeholder="Please fill out the Meeting Note..." class="form-control border-none dialogueContents" rows="5"></textarea>
													<div class="text-right">
														<i class="fas fa-comment-alt grayscale cursor chat-icon addDialogue"></i>
													</div>
												</div>
											</div>
									  </div> 
									</div>
						    </div>
						    <div class="panel-footer bg-gray">
						    	<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<textarea id="mainPoint" placeholder="Main Point" class="form-control" rows="2" ></textarea>
									    </div>
									  </div>
									</div>
							    <div id="ActionItemRows" class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div class="input-group stylish-input-group-both">
													<div class="input-group-addon"><i class="fas fa-exclamation grayscale input-icon-action"></i></div>
													<input type="text" class="form-control action-item" placeholder="Action Item">
													<div class="input-group-addon cursor">
														<span class="plusActionItem"><i class="fas fa-plus-circle grayscale"></i></span>
													</div>
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div class="input-group stylish-input-group-both">
													<div class="input-group-addon"><i class="fab fa-slack-hash grayscale"></i></div>
													<input id="keyWordInput" type="text" class="form-control" placeholder="Key Word">
													<div class="input-group-addon cursor"><i class="fas fa-magic grayscale"></i></div>
									      </div>
									    </div>
									  </div>
									</div>
						    </div>
						  </div>
						  
						  <div class="row">
								<div class="col-xs-6 text-left">
									<button id='backBtn' type="button" class="btn btn-default">
							  		<i class="fas fa-arrow-circle-left grayscale"></i> Back
									</button>
							  </div>
							  <div class="col-xs-6 text-right">
							  	<button id="mtnPreview" type="button" class="btn btn-default">
							  		<i class="fas fa-desktop grayscale"></i> Preview
									</button>
									<button id="mtnTempSaveBtn" type="button" class="btn btn-default">
							  		<i class="fas fa-save grayscale"></i> Temporary
									</button>
							  	<button id="mtnSaveBtn" type="button" class="btn btn-default">
							  		<i class="fas fa-save"></i> Save
									</button>
							  </div>
							</div>
						</form>			
						
						<br>
						<!-- footer -->		
						<div class="row">
							<div class="container">
								<jsp:include page="../layout/footer.jsp"></jsp:include>
							</div>
						</div>
						
				</div>
			</div>
		</div>
		
	</div>
	
	<!-- Modal -->
	<jsp:include page="../mypage/user_search_pop.jsp"></jsp:include>
	<jsp:include page="noteHeadGet.jsp"></jsp:include>
	<jsp:include page="noteHeadSave.jsp"></jsp:include>
	<jsp:include page="preview.jsp"></jsp:include>
	
</body>
<script>

var gvDialougeID = 0;

$( document ).ready(function() {
  
  $("#backBtn").click(function(){
		window.history.back();
	});

  autosize($('.dialogueContents'));
  autosize($('#planContents'));
  
  var dt = new Date();
  var hour = dt.getHours().toString().length < 2 ? "0" + dt.getHours().toString() : dt.getHours().toString();
  var minute = dt.getMinutes().toString().length < 2 ? "0" + dt.getMinutes().toString() : dt.getMinutes().toString();
  minute = Math.round(minute / 10) * 10;
  minute = minute == 0 ? "00" : minute;
  
 	if(minute == 60 || minute == "60"){
 	 	minute = "00";
 	  hour = parseInt(hour) + 1;
  }
  
  $('#startTime').selectpicker('val',hour+':'+minute);
  $('#endTime').selectpicker('val',(parseInt(hour)+1)+':'+minute);
  
  $('[data-toggle="datepicker"]').datepicker('setDate', new Date());
  $('[data-toggle="datepicker"]').change(function() { 
    $('[data-toggle="datepicker"]').datepicker('hide');
  });
  
  $('#startTime').change(function() {
    var hour = parseInt($('#startTime').val().substring(0,2))+1
    hour = hour.toString().length < 2 ? "0"+hour : hour;
    $('#endTime').selectpicker('val',hour + $('#startTime').val().substring(2,5));
  });
  
  //Action Item 추가
  $('body').on('click', '.plusActionItem', function () {
    if ($(this).parentsUntil("stylish-input-group-both").children("input").val() == "") {
      bootbox.alert({
        message: "Please fill out Action Item",
        size: 'small',
        buttons: {
          ok: {
              label: "OK",
              className: 'btn'
          	}
      	}
    	});
      return false;
    }
    $('#ActionItemRows').append(
        "<div class='col-xs-12'>"+
	  			"<div class='form-group'>"+
	  				"<div class='input-group stylish-input-group-both'>"+
	  					"<div class='input-group-addon'><i class='fas fa-exclamation grayscale input-icon-action'></i></div>"+
	  					"<input type='text' class='form-control action-item' placeholder='Action Item'>"+
	  					"<div class='input-group-addon cursor'>"+
	  						"<span class='minusActionItem input-icon-action'><i class='fas fa-minus-circle grayscale'></i></span>"+
	  						"<span class='plusActionItem'><i class='fas fa-plus-circle grayscale'></i></span>"+
	  					"</div>"+
	  			  "</div>"+
	  			"</div>"+
				"</div>");
	});
  
  //Action Item 삭제
  $('body').on('click', '.minusActionItem', function () {
    var removeDiv = $(this).parentsUntil($(".col-xs-12"));
    bootbox.confirm({
		  size: "small",
		  title: "WARNING",
      message: "<font class='small'>Are you sure remove this <b class='big'>Action Item</b>?<br/>can not undo.<font>",
		  buttons: {
		    confirm: {
		      label: 'Yes',
		      className: 'btn-default btn-sm'
		    },
		    cancel: {
		      label: 'No',
		      className: 'btn btn-sm'
		    }
		  },
		  callback: function (result) {
		    if(result == true){
		      removeDiv.remove();
		    }else{
		    }
		  }
		});
	});
  
  //대화 추가
  $('body').on('click', '.addDialogue', function () {
    gvDialougeID += 1;
    $('#dialogueBox').append(
        "<div class='col-xs-12'>"+
	      	"<div class='col-xs-1 padding-left-small'>"+
	      		"<div class='text-right'>"+
	      			"<span class='grayscale cursor chooseUser'><i class='fas fa-user-plus chat-user'></i></i><span id='chooseUserNm"+gvDialougeID+"' class='chooseUserNm'> </span></span>"+
	      		"</div>"+
	      	"</div>"+
	      	"<div class='col-xs-11'>"+
	      		"<div class='bubble'>"+
	      			"<textarea id='dialogueContents"+gvDialougeID+"' placeholder='Please fill out the Meeting Note...' class='form-control border-none dialogueContents' rows='5'></textarea>"+
	      			"<div class='text-right'>"+
	      				"<i class='fas fa-trash-alt grayscale cursor chat-icon delDialogue'></i>"+
	      				"<i class='fas fa-comment-alt grayscale cursor chat-icon addDialogue'></i>"+
	      			"</div>"+
	      		"</div>"+
	      	"</div>"
    );
    autosize($('.dialogueContents'));
    chooseSpeaker();
    $("#chooseUserNm"+gvDialougeID).trigger( "click" );
	});
  
  //대화 삭제
  $('body').on('click', '.delDialogue', function () {
    var removeDiv = $(this).parentsUntil($("#dialogueBox"));
    bootbox.confirm({
		  size: "small",
		  title: "WARNING",
      message: "<font class='small'>Are you sure remove this <b class='big'>Dialogue</b>?<br/>can not undo.<font>",
		  buttons: {
		    confirm: {
		      label: 'Yes',
		      className: 'btn-default btn-sm'
		    },
		    cancel: {
		      label: 'No',
		      className: 'btn btn-sm'
		    }
		  },
		  callback: function (result) {
		    if(result == true){
		      removeDiv.remove();
		    }else{
		    }
		  }
		});
	});
  
  $('#toggle-event').change(function() {
    if($(this).prop('checked') == true){
      //Dialogue
			bootbox.confirm({
			  size: "small",
			  title: "WARNING",
        message: "<font class='small'>Are you sure Change to <b class='big'>Dialogue Format</b>?<br/>data can not be saved.<font>",
			  buttons: {
			    confirm: {
			      label: 'Yes',
			      className: 'btn-default btn-sm'
			    },
			    cancel: {
			      label: 'No',
			      className: 'btn btn-sm'
			    }
			  },
			  callback: function (result) {
			    if(result == true){
			      $("#painTextBox").hide();
			      $("#dialogueBox").show();
			    }else{
			      $('#toggle-event').prop('checked', false).bootstrapToggle('destroy').bootstrapToggle();
			    }
			  }
			});
      
    }else{
      //Plan Text
      bootbox.confirm({
        size: "small",
        title: "WARNING",
        message: "<font class='small'>Are you sure Change to <b class='big'>Plain Text format</b>?<br/>data can not be saved.<font>",
			  buttons: {
			    confirm: {
			      label: 'Yes',
			      className: 'btn-default btn-sm'
			    },
			    cancel: {
			      label: 'No',
			      className: 'btn btn-sm'
			    }
			  },
			  callback: function (result) {
			    if(result == true){
			      $("#dialogueBox").hide();
			      $("#painTextBox").show();
			    }else{
			      $('#toggle-event').prop('checked', true).bootstrapToggle('destroy').bootstrapToggle();
			    }
			  }
			});
      
    }
  });
  
  $('.fa-magic').click(function() {
    
    var dialogueContents = ""; 
    var text = "";
    if ($('#toggle-event').prop('checked')){
      $(".dialogueContents").each(function(){
        dialogueContents = dialogueContents + " " + $(this).val();
      });
      text = dialogueContents;
    }else{
      text = $("#planContents").val();
    }
    
    $.ajax({
      url: '/nlp/getKeyword',
      type: 'POST',
      data: JSON.stringify({"text" : text}),
  		contentType: "application/json",
      success: function(data) {
        if(data.message == "success"){
          $("#keyWordInput").val("");
          var dialog = bootbox.dialog({
            message: "<h4 id='hasTagTitle'>Maybe consider adding these?</h4>",
            buttons: {
              	hasTag1: {
                    label: "#"+$.trim(data.keyWordList[0]),
                    className: 'btn-default btn-sm hash-tag pull-left',
                    callback: function(){
                        return false;
                    }
                },
                hasTag2: {
                  label: "#"+$.trim(data.keyWordList[1]),
                  className: 'btn-default btn-sm hash-tag pull-left',
                  callback: function(){
                      return false;
                  }
              	},
              	hasTag3: {
                  label: "#"+$.trim(data.keyWordList[2]),
                  className: 'btn-default btn-sm hash-tag pull-left',
                  callback: function(){
                      return false;
                  }
              	},
              	hasTag4: {
                  label: "#"+$.trim(data.keyWordList[3]),
                  className: 'btn-default btn-sm hash-tag pull-left',
                  callback: function(){
                      return false;
                  }
              	},
              	hasTag5: {
                  label: "#"+$.trim(data.keyWordList[4]),
                  className: 'btn-default btn-sm hash-tag pull-left',
                  callback: function(){
                      return false;
                  }
              	},
                ok: {
                    label: "OK",
                    className: 'btn btn-sm pull-right',
                    callback: function(){
                      $(".hash-tag[value='checked']").each(function(){
                        $("#keyWordInput").val($("#keyWordInput").val()+" "+$(this).text());
              				});
                    }
                }
            }
          });
          
          var hashTagCnt = 0;
          $(".hash-tag").each(function(){
            if ($(this).text() == "#"){
              $(this).remove();
              hashTagCnt++;
            }
  				});
          
          if(hashTagCnt == 5){
            $("#hasTagTitle").text("No results")
          }
          
          $('.hash-tag').click(function() {
            if($(this).attr("value") == "checked"){
              $(this).removeClass("hastag-checked");
              $(this).attr("value", "unchecked");
            }else{
              $(this).addClass("hastag-checked");
              $(this).attr("value", "checked");
            }
          }); 
          
        } else {
          console.log(data);
        }
      }
    });
  });
  
  
  $('#setNoteHeadBtn').click(function() {
    if($("#selectType").val() == ""){
      bootbox.alert({
        message: "Please Select Types",
        size: 'small',
        buttons: {
          ok: {
              label: "OK",
              className: 'btn'
          	}
      	}
    	});
      return false;
    }
    if($("#locationInput").val() == ""){
      bootbox.alert({
        message: "Please fill out Location",
        size: 'small',
        buttons: {
          ok: {
              label: "OK",
              className: 'btn'
          	}
      	}
    	});
      return false;
    }
    if($("#titleInput").val() == ""){
      bootbox.alert({
        message: "Please fill out Title",
        size: 'small',
        buttons: {
          ok: {
              label: "OK",
              className: 'btn'
          	}
      	}
    	});
      return false;
    }
    if($("#attendantsInput").val() == ""){
      bootbox.alert({
        message: "Please select Attendants",
        size: 'small',
        buttons: {
          ok: {
              label: "OK",
              className: 'btn'
          	}
      	}
    	});
      return false;
    }
    $("#setModalType").val($("#selectType option:selected").text());
    $("#setModalLoc").val($("#locationInput").val());
    $("#setModalTitle").val($("#titleInput").val());
    $("#setModalAtt").val($("#attendantsInput").val());
    
    $("#noteHeadSaveModal").modal();
  });
  
  $('#attendantsDiv').click(function() {
    $("#userSearchPop").modal();
  });
  
  $('#mtnPreview').click(function() {
    
    $("#previewMainPoint").val($("#mainPoint").val());
    $("#previewKeyWordInput").val($("#keyWordInput").val());
    $("#previewActionItemRows").empty().append($("#ActionItemRows").clone());
    
    var actionitem = $("#ActionItemRows").clone();
    $("#previewActionItemRows").empty().append(actionitem);
    $("#previewActionItemRows").find(".minusActionItem ").each(function() { $(this).remove() } );
    $("#previewActionItemRows").find(".plusActionItem ").each(function() { $(this).remove() } );
    
    $("#preveiwSelectType").val($("#selectType").val());
    $("#preveiwDateInput").val($("#dateInput").val());
    $("#preveiwStartTime").val($("#startTime").val());
    $("#preveiwEndTime").val($("#endTime").val());
    $("#preveiwLocationInput").val($("#locationInput").val());
    $("#preveiwTitleInput").val($("#titleInput").val());
    
    $('#previewToggle-event').prop('disabled', function(i, v) { return !v; });
    $('#toggle-event').prop('checked',  $('#toggle-event').prop('checked')).bootstrapToggle('destroy').bootstrapToggle();
    
    //dialogue
    if($('#toggle-event').prop('checked')){
      $("#preveiwPainTextBox").hide();
      $("#previewDialogueBox").show();
      
      var dialogueBox = $("#dialogueBox").clone();
      $("#previewDialogueBox").empty().append(dialogueBox);
      $("#previewDialogueBox").find(".fa-comment-alt").each(function() { $(this).remove() } );
      $("#previewDialogueBox").find(".fa-trash-alt").each(function() { $(this).remove() } );
      $("#previewDialogueBox").find(".chooseUserNm").each(function() { $(this).addClass('small') } );
      
    }
    //plantext
    else{
      $("#preveiwPainTextBox").show();
      $("#previewDialogueBox").hide();
      
      $("#previewPlanContents").val($("#planContents").val());
    }
    
    
    $("#previewModal").modal();
  });
  
  $('#closeUserModal').click(function() {
    $("#userSearchPop").modal("hide");
  });
  
  $('#applyUserModal').click(function() {
    $("#userSearchPop").modal("hide");
    
    var attendantsText = ""
    for (var i=0; i<attendantsNmList.length; i++){
      attendantsText = attendantsText + attendantsNmList[i] + ", ";
    }
    attendantsText = attendantsText.slice(0, -2);
    $("#attendantsInput").val(attendantsText);
    
    chooseSpeaker();
    $("#chooseUserNm0").trigger( "click" );
  });
  
  bindFunctionBtn();
  
});

function saveMtn(saveType) {
  
  $('#mtnSaveBtn').unbind();
  $('#mtnTempSaveBtn').unbind();
  
  if($("#selectType").val() == ""){
    bootbox.alert({
      message: "Please Select Types",
      size: 'small',
      buttons: {
        ok: {
            label: "OK",
            className: 'btn'
        	}
    	}
  	});
    bindFunctionBtn();
    return false;
  }
  if($("#locationInput").val() == ""){
    bootbox.alert({
      message: "Please fill out Location",
      size: 'small',
      buttons: {
        ok: {
            label: "OK",
            className: 'btn'
        	}
    	}
  	});
    bindFunctionBtn();
    return false;
  }
  if($("#titleInput").val() == ""){
    bootbox.alert({
      message: "Please fill out Title",
      size: 'small',
      buttons: {
        ok: {
            label: "OK",
            className: 'btn'
        	}
    	}
  	});
    return false;
  }
  if($("#attendantsInput").val() == ""){
    bootbox.alert({
      message: "Please select Attendants",
      size: 'small',
      buttons: {
        ok: {
            label: "OK",
            className: 'btn'
        	}
    	}
  	});
    bindFunctionBtn();
    return false;
  }
  
  var url = "";
  
  //액션아이템 추출
  var actionItemList = [];
	$(".action-item").each(function(index){
	  if($(this).val() != ""){
	    actionItemList.push({
				"version" : $("#mtnVersion").val(),
				"seq" : index + 1,
				"actionItem" : $(this).val()
			});
	  }
	});
	
	//해쉬태그 추출
	var hashTagList = [];
	$("#keyWordInput").val().split(" ").forEach(function(word, index){ 
	  if(word.substring(0,1) == "#"){
	    hashTagList.push({
				"version" : $("#mtnVersion").val(),
				"seq" : index + 1,
				"hashTag" : word.substring(1,word.length)
			});
	  }
  });
	
 	//회의 내용 추출
	var mtnContentsList = [];
  if ($('#toggle-event').prop('checked')){
   	//Dialogue
 	  url = "dialogue";
   
		$(".dialogueContents").each(function(index){
		  if($(this).val() != ""){
				mtnContentsList.push({
					"version" : $("#mtnVersion").val(),
					"seq" : index + 1,
					"speakerId" : $("#chooseUserNm"+$(this).attr("id").replace("dialogueContents","")).attr("data-value"),
					"contents" : $(this).val()
				});
			}
		});

  }else{
    //Pain Text
    url = "plaintext";
    
   	var textLength = $("#planContents").val().length;
   	var splitCount = parseInt(textLength / 6000) + 1;
		var start = 0;
		var end = 0;
		var textSize = 6000;
		
   	for (var i=0; i<splitCount; i++){
   	  start = i * textSize;
   	  end = (i+1) * textSize;
   	  mtnContentsList.push({
   	   					 						"version" : $("#mtnVersion").val(),
   	   											"seq" : i + 1,
   	   											"speakerId" : "planText",
   	   											"contents" : $("#planContents").val().substring(start, end)
 	   											 });
   	}
  }
  if(mtnContentsList.length == 0){
    bootbox.alert({
      message: "Please write Meeting Note",
      size: 'small',
      buttons: {
        ok: {
            label: "OK",
            className: 'btn'
        	}
    	}
  	});
    bindFunctionBtn();
    return false;
  }
  
	var data = {"meetingNoteDomain" : {
															    		"version" : $("#mtnVersion").val(),
															    		"title": $("#titleInput").val(),
															    		"projectId" : "TEST",
															    		"divisionId" : "TEST",
															    		"meetingTypeId" : $("#selectType").val(),
															    		"regMemberId" : $("#userId").val(),
															    		"modMemberId" : $("#userId").val(),
															    		"location" : $("#locationInput").val(),
															    		"startTm" : $("#startTime").val(),
															    		"endTm" : $("#endTime").val(),
															    		"mainPoint" : $("#mainPoint").val(),
															    		"hit" : 0,
															    		"statusId" : saveType == "save" ? "1" : "4",
															    		"statusDesc" : saveType == "save" ? "등록" : "임시저장"
														    		},
			   			"AttendantsList" : attendantsList,
							"MtnContentsList" : mtnContentsList,
							"ActionItemList" : actionItemList,
							"HashTagList" : hashTagList
						}
  
  
  
  $.ajax({
		type : "POST",
		url : "/meetingnote/create",
		data : JSON.stringify(data),
		contentType: "application/json",
		success : function(data){
		  if (saveType == "save") {
		    location.href = "/board/index?veiwType=G&sideBar=T&subMenu=FFFF";
		  }else{
		    bootbox.alert({
	        message: "Your Meeting Note has been saved as draft",
	        size: 'small',
	        buttons: {
	          ok: {
	              label: "OK",
	              className: 'btn'
	          	}
	      	}
	    	});
		  }
		},
		error : function(){
		  bindFunctionBtn();
		}
	});
	
	bindFunctionBtn();
  
};

function bindFunctionBtn(){
  $('#mtnSaveBtn').unbind();
  $('#mtnTempSaveBtn').unbind();
  $('#mtnSaveBtn').click(function(){
    saveMtn("save");
  });
   
  $('#mtnTempSaveBtn').click(function(){
    saveMtn("temp");
  });
}

function chooseSpeaker(){

  userIcon = null;
  $('.chooseUser').click(function() {
    var contentsText = "";
    for (var i=0; i<attendantsNmList.length; i++){
      contentsText = contentsText + "<div class='row small cursor grayscale user-list'><i class='fas fa-user-circle grayscale'></i><span class='chooseUserNm'> "+attendantsNmList[i]+"</span></div>"
    }
    userIcon = $(this);
    $(this).popover({title: "Speaker"
      , content: contentsText
      , html: true, placement: "bottom"}); 
  });
  
  $('.chooseUser').on('shown.bs.popover', function () {
    $('.user-list').unbind();
    $('.user-list').click(function() {
     //alert($(this).children('.chooseUserNm').text());
				if(userIcon.children("svg").attr("class") == "svg-inline--fa fa-user-plus fa-w-20 chat-user"){
					userIcon.children("svg").removeClass("fa-user-plus");
					userIcon.children("svg").addClass("fa-user-circle");
				}
				userIcon.children(".chooseUserNm").text($(this).children('.chooseUserNm').text());
				userIcon.children(".chooseUserNm").attr("data-value", attendantsList[$(this).index()]);
				userIcon.popover("hide");
    });
  });
  
}

</script>
</html>

