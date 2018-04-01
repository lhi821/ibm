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
	<input id="regMemId" value='${resultMap.result.meetingNote.REGMEMBERID}' type="hidden">
	<div class="col-xs-10 affix-content">
		<div class="container affix-container">
			<div class="row">
				<div class="container">
						<!-- new post form -->
						<form id="readMtnForm" action="/board/create" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="row">
								<div class="left-padding">
					    		<div class="col-xs-6 small grayscale">
					    			<span class="cursor"><i class="fas fa-folder-open"></i> Proejct 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span class="cursor"><i class="far fa-folder-open"></i> Sub menu 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span>
					    				<i class="far fa-file-alt"></i> <span id='meetingNoteId'>${resultMap.result.meetingNote.MEETINGNOTEID}</span>
					    			</span>
				    			</div>
				    			<div class="col-xs-6 small text-right">
				    				<i class='fas fa-eye grayscale'></i>
					    			<span class="badge badge-pill badge-danger small-bottom">${resultMap.result.meetingNote.HIT}</span>
					    		</div>
				    		</div>
				    	</div>
				    	<div class="panel panel-default">
					    	<div class="panel-heading">
						    	<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<label class="grayscale">Main Point</label>
												<textarea readonly id="mainPoint" placeholder="Main Point" class="form-control context-menu" rows="2" >${resultMap.result.meetingNote.MAINPOINT}</textarea>
									    </div>
									  </div>
									</div>
									<c:forEach items="${resultMap.result.actionItemList}" var="actionItem" varStatus="status">
							    <div id="ActionItemRows" class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<c:if test="${status.index eq 0}">
													<label class="grayscale">Action Item</label>
												</c:if>
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-exclamation grayscale input-icon-action context-menu"></i></div>
													<input readOnly value='${actionItem.ACTIONITEM}' type="text" class="form-control action-item context-menu" placeholder="Action Item">
									      </div>
									    </div>
									  </div>
									</div>
									</c:forEach>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
											<label class="grayscale">key Word</label>
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fab fa-slack-hash grayscale"></i></div>
													<input readOnly value='${resultMap.result.hashTag}' id="keyWordInput" type="text" class="form-control context-menu" placeholder="Key Word">
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
									      <select id="selectType" class="selectpicker form-control" >
							        		<option value="${resultMap.result.meetingType.MEETINGTYPEID}" title="<i class='fas fa-tag grayscale input-icon'></i>${resultMap.result.meetingType.MEETINGTYPENM}">${resultMap.result.meetingType.MEETINGTYPENM}</option>
									      </select>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="far fa-calendar-alt grayscale"></i></div>
											    <input id="dateInput" class="form-control context-menu left-padding" readonly value="${resultMap.result.meetingNote.MODDATE}">
											  </div>
											</div>
									  </div>
									   <div class="col-xs-2">
									    <div class="form-group">
									      <select id="startTime" class="selectpicker form-control">
		            					<option title="<i class='far fa-clock grayscale input-icon'></i>${resultMap.result.meetingNote.STARTTM}">${resultMap.result.meetingNote.STARTTM}</option>
												</select>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
									  		<select id="endTime" class="selectpicker form-control">
		            					<option title="<i class='fas fa-clock grayscale input-icon'></i>${resultMap.result.meetingNote.ENDTM}">${resultMap.result.meetingNote.ENDTM}</option>
												</select>
								    	</div>
									  </div>
									  <div class="col-xs-4">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-map-pin grayscale"></i></div>
													<input readonly value='${resultMap.result.meetingNote.LOCATION}' id="locationInput" type="text" class="form-control context-menu" placeholder="Location">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-10">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
													<input readonly id="titleInput" type="text" class="form-control context-menu" placeholder="Title" value='${resultMap.result.meetingNote.TITLE}'>
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
												<div id="attendantsDiv" class="input-group stylish-input-group-left">
													<div class="input-group-addon context-menu"><i class="fas fa-user-plus grayscale"></i></div>
													<input readonly value='${resultMap.result.attendant}' id="attendantsInput" type="text" disabled class="form-control context-menu" placeholder="Attendants">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-6 text-left">
								    	<input id="toggle-event" class='context-menu' type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="Dialogue" data-off="Plan Text" data-onstyle="default">
								    	<input id="hiddenToggle" class='context-menu' type="hidden" value ='${resultMap.result.contentsList[0].SPEAKERID}'>
									  </div>
									  <div class="col-xs-6 text-right">
									  </div>
									</div>
						    </div>
						    <div class="panel-body">
						    <c:if test="${resultMap.result.contentsList[0].SPEAKERID == 'planText'}">
									<div id="painTextBox" class="row display-none">
										<div class="col-xs-12">
											<div class="form-group">
													<c:set value="" var="planContents"/>
													<c:forEach items="${resultMap.result.contentsList}" var="contents" varStatus="status">
														<c:set value="${planContents}${contents.CONTENTS}" var="planContents"/>
													</c:forEach>
													<textarea readonly id="planContents" placeholder="Please fill out the Meeting Note..." class="form-control border-none" rows="10" >
														${planContents}
													</textarea>
									    </div>
									  </div>
								  </div>
							   </c:if>
							   <c:if test="${resultMap.result.contentsList[0].SPEAKERID != 'planText'}">
								   <c:forEach items="${resultMap.result.contentsList}" var="contents" varStatus="status">
										  <div id="dialogueBox" class="row">
											  <div class="col-xs-12">
									  			<div class="col-xs-1 padding-left-small">
														<div class="text-right">
															<span class="grayscale context-menu chooseUser"><i class="fas fa-user-circle chat-user"></i><span id='chooseUserNm0' class='chooseUserNm'> ${contents.MEMBERNM}</span></span>
														</div>
													</div>
													<div class="col-xs-11">
														<div class="bubble">
															<textarea id='dialogueContents0' placeholder="Please fill out the Meeting Note..." class="form-control border-none dialogueContents" rows="5">
																${contents.CONTENTS}
															</textarea>
															<div class="text-right">
																<!-- <i class="fas fa-comment-alt grayscale context-menu chat-icon addDialogue"></i> -->
															</div>
														</div>
													</div>
											  </div> 
											</div>
										</c:forEach>
									</c:if>
						    </div>
						  </div>
						  
						  <div class="row">
								<div class="col-xs-6 text-left">
									<button id='backBtn' type="button" class="btn btn-default">
							  		<i class="fas fa-arrow-circle-left grayscale"></i> Back
									</button>
							  </div>
							  <div class="col-xs-6 text-right">
							  	<button id="mtnDeleteBtn" type="button" class="btn">
							  		<i class="far fa-trash-alt grayscale"></i> Delete
									</button>
											
									<c:choose>
								    <c:when test="${resultMap.result.isFavorite}">
							    		<button id="mtnFavorite" type="button" class="btn btn-default">
									  		<i class="fas fa-star grayscale"></i> Favorite
											</button>
								    </c:when>
								    <c:otherwise>
							    		<button id="mtnFavorite" type="button" class="btn btn-default">
									  		<i class="far fa-star grayscale"></i> Favorite
											</button>
								    </c:otherwise>
									</c:choose>
		
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
	
</body>
<!-- JS -->
<script type="text/javascript" src="/js/board/update.js"></script>
<script>

$( document ).ready(function() {
  
  $("#backBtn").click(function(){
		window.history.back();
	});
  
  $("#mtnFavorite").click(function(){
    var data = {"memberId" : $("#userId").val(), "favoritetype" : "meetingNote", "favoriteId" : window.location.pathname.substring(7)};
		$.ajax({
			type : "POST",
			url : "/meetingnote/favorites",
			data : JSON.stringify(data),
			contentType: "application/json",
			success : function(data){
			  if(data.rsltMsg == "success"){
			    
			    $("#mtnFavorite").find("svg").attr("data-prefix", "fas");
			    
				  bootbox.alert({
		        message: "Added to Favorite",
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
			  bootbox.alert({
	        message: "ERROR",
	        size: 'small',
	        buttons: {
	          ok: {
	              label: "OK",
	              className: 'btn'
	          	}
	      	}
	    	});
			}
		});
  });
  
  $("#mtnDeleteBtn").click(function(){
		if ($("#userId").val() != $("#regMemId").val()){
		  bootbox.alert({
        message: "Only the author is allowed to delete this meeting note",
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
		var data = {"meetingNoteId" : window.location.pathname.substring(7)};
		$.ajax({
			type : "POST",
			url : "/meetingnote/delete",
			data : JSON.stringify(data),
			contentType: "application/json",
			success : function(data){
	    	location.href = "/board/index?veiwType=G&sideBar=T&subMenu=FFFF";
			},
			error : function(){
			  bootbox.alert({
	        message: "ERROR",
	        size: 'small',
	        buttons: {
	          ok: {
	              label: "OK",
	              className: 'btn'
	          	}
	      	}
	    	});
			}
		});
		
		
	});
  
  $('#toggle-event').prop('disabled', function(i, v) { return !v; });
  if($("#hiddenToggle").val() == 'planText'){
    $('#toggle-event').prop('checked', false).bootstrapToggle('destroy').bootstrapToggle();
    $('#dialogueBox').hide();
    $('#painTextBox').show();
    $("#planContents").val($.trim($("#planContents").val()));
    autosize($('#planContents'));

  }else{
    $('#dialogueBox').show();
    $('#painTextBox').hide();
    
    $(".dialogueContents").each(function(index){
		  $(this).val($.trim($(this).val()));
		  autosize($(this));
		});
  }
  
  
});


</script>
</html>
