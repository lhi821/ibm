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
									      <select class="selectpicker form-control" data-live-search="true" title="<i class='fas fa-tags grayscale input-icon'></i>Type">
									      	<c:forEach items="${meetingTypes}" var="meetingType">
									        	<option title="<i class='fas fa-tag grayscale input-icon'></i>${meetingType.meetingTypeNM}">${meetingType.meetingTypeNM}</option>
									        </c:forEach>
									      </select>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon cursor"><i class="far fa-calendar-alt grayscale"></i></div>
											    <input class="form-control cursor left-padding" readonly data-toggle="datepicker" placeholder="Date">
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
													<input type="text" class="form-control" placeholder="Location">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-10">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
													<input type="text" class="form-control" placeholder="Title">
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
													<input type="text" disabled class="form-control cursor" placeholder="Attendants">
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
									  	<button type="button" class="btn btn-default btn-xs">
									  		<i class="fas fa-cloud-download-alt grayscale"></i> Get Information
											</button>
									  	<button type="button" class="btn btn-default btn-xs">
									  		<i class="fas fa-save grayscale"></i> Save Information
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
									<button type="button" class="btn btn-default">
							  		<i class="fas fa-arrow-circle-left grayscale"></i> Back
									</button>
							  </div>
							  <div class="col-xs-6 text-right">
							  	<button type="button" class="btn btn-default">
							  		<i class="fas fa-desktop grayscale"></i> Preview
									</button>
									<button type="button" class="btn btn-default">
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
	
	
</body>
<script>

var gvDialougeID = 0;

$( document ).ready(function() {
  
  chooseSpeaker();
  
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
    
    /* var text = "문재인 대통령은 오늘 국민헌법자문특별위원회로부터 개헌 자문안을 전달 받은 뒤 마무리 발언을 했습니다. 그 내용을 소개합니다."+
		 "“개헌안 자체에 대해서는 아무런 이견이 없습니다. ibm 다만 국회에 발의할 개헌안 속에 담을 수 있는 범위에 대해서는 생각의 차이가 있을 수 있습니다. 그것은 자문안의 문제가 아니라 우리 현실 때문입니다. 지금 국회에 대한 국민들의 불신, 지방정부에 대한 불신, 그 가운데에서도 지방의회에 대한 불신, 정당제도에 대한 불신들을 우리가 현실적으로 감안하지 않을 수 없다고 생각합니다. 그 때문에 저는 지금 단계에서 의원내각제나 이원집정부제는 우리 현실에 맞지 않다, 좀 시기상조다 이렇게 생각을 하는 편입니다. 그렇다 하더라도 최대한 국회 쪽에 많은 권한을 넘겨서 국회의 견제 감시권을 높일 필요는 있다 생각하는데 그 조차도 좀처럼 국민들이 동의하려고 하지 않고 있는 것이 현실입니다. 이런 것을 감안해서 나중에 개헌 발의안을 선택할 수밖에 없다는 생각입니다.”"+
	 	 "“저는 오늘 이 개헌 자문안 가운데 가장 중요한 것이 빠졌다고 생각합니다. 본문들은 다 준비가 되었는데 부칙이 없습니다. 현실세계 속에서는 부칙이 시행시기를 정하는 것이기 때문에 오히려 부칙이 더욱 중요할 수 있거든요. 아마도 우리 특위에서는 부칙 부분은 정치적 결단의 문제라고 생각해서 그냥 넘겨주신 것으로 생각합니다. 하지만 그 부칙이 왜, 지금 이 시기에 개헌을 해야 하느냐 하는 것하고 서로 맞닿아 있습니다. 예를 들면 지금 4년 중임제를 한다면 4년 중임제라는 제도는 저에게는 적용되지 않는 것입니다. 그것은 차기 대통령부터 적용되는 것이죠. 그래서 혹시라도 이 개헌이 저에게 무슨 정치적인 이득이 있을 것이라고 생각하는 오해들도 있고 실제로 그렇게 호도하는 사람들이 있기 때문에 그 점에 대해서 분명히 해 주시면 좋겠습니다.”"+
	 	 "“기본권 강화 조항의 경우 우리가 ibm 정하기에 따IBM라서는 보다 이른 시기에, 지금 우리 정부 임기 중에라도 일찍부터 시작해ibm서 기본권을 강화해 갈 수도 있는 것입니다. 그 다음에 지방분권을 강화하는 것도 이번 지방선거를 통해서 선출되는 지방정부와 함께 시행되도록 우리가 할 수 있는 것이죠. 이런 것이 전부 이번 개헌에 이루어지지 않고, 예를 들면 또 다음 총선 시기에 공약이 이루어져서 다음 국회에서 된다고 한다면 그만큼 모든 게 다 시행이 미루어지게 되는 것이거든요.”"+
 	 	 "“우리가 보다 정의로운 대한민국, 나라다운 나라를 만들기 위해서는 개헌을 앞당길 필요가 있고 지금이 적기라는 이야기를 우리가 해야 된다는 것이죠. 예를 들면 선거 비례성을 강화하는 내용의 경우, 지금 개헌을 해 둬야 다음 총선 때 적용할 수 있는 것 아닙니까? 비례성에 보다 더 부합되는 선거제도를 만들자고 그렇게들 오랜 세월 동안 많은 요구들을 했는데, 그러면서 지금 시기의 개헌에 대해 소극적이라면 어느 세월에 헌법적 근거를 갖추어서 비례성에 부합되는 선거제도를 마련합니까? 간절하게 생각한다면 그만큼 이번 개헌에 대해서도 간절하게 생각해야 맞는 것이죠. 선거연령에 관한 것도 그렇습니다. 결선투표도 필요하다면 이번에 도입되어야 다음 대선 때 결선투표를 적용할 수 있는 것이지 않겠습니까? 부칙이 하나하나 시행시기를 정해 주는 것이기 때문에 앞으로의 정치일정을 맞추어놓고 보면 그런 시행을 위해서라도 이번 시기의 개헌이 필요하다는 이유가 아주 강하게 설명되어야 된다는 생각이고요. 그런 면에서 부칙이 대단히 중요하다고 생각합니다.”"+
 	 	 "“부칙ibm에서 또 한 가지 중요한 것이, ibm 우리가 지금까지는 대통령의 개헌발의가 본격적으로 논의가 되지 않았고 국회의 개헌 논의가 계속 이원집정부제나 의원내각제 이런 쪽으로만 치우쳐져 있었기 때문에 별로 부각이 되지 않았습니다. 그러나, 예를 들면 지금 대통령 4년 중임제가 만약에 채택이 된다면 지금 대통령하고 지방정부하고 임기가 거의 비슷해지기 때문에 이번에 선출되는 지방정부의 임기를 약간만 조정해서 맞춘다면, 그러면 차기 대선부터는 대통령과 지방정부의 임기를 함께 갈 수 있습니다. 우리가 대통령 임기기간 중에 3번의 전국선거를 치르게 되고, 그 3번의 전국선거가 주는 국력의 낭비라는 것이 굉장한데 개헌을 하면 그 선거를 2번으로 줄이게 되고 대통령과 지방정부가 함께 출범하고 총선이 중간평가 역할을 하는 식의 선거체제랄까, 정치체제가 마련될 수 있는 것이거든요. 그런 것이 이번에 개헌되어야만 가능한 것입니다. 안 그러면 다음에 언제 다시 대통령과 지방정부 임기가 비슷하게 시작될 수 있는 시기를 찾을 수 있겠습니까. 과거 참여정부 때 우연히 대통령하고 국회의원 임기가 비슷하게 시작됐던 시기가 있었기 때문에 대통령하고 국회의원 선거를 동시에 치르고 임기를 같이해서 지방선거 한 번, 전국선거를 한 번 줄이려는 원 포인트 개헌을 그때 시도하다가 결국은 못한 적이 있습니다. 사실 따지고 보면 대통령과 국회의원의 임기를 맞추는 것보다는 대통령과 지방정부의 임기를 맞추고 총선은 중간평가 역할을 하는 것이 훨씬 더 정치제도 면에서는 합리적인 것이거든요. 그런 생각하면 부칙이라는 게 생각보다는 본문 못지않게 굉장히 중요한 것입니다. 그래서 그 점에 대해서까지도 충분히 검토해서 왜 이 시기에 개헌이 이루어져야 하느냐라는 그 당위성에 대한 근거와 함께 설명이 됐으면 합니다. 그 부분까지도 우리 자문특위에서 조금 더 완결시켜주셨으면 합니다.”"+
 	 	 "“사실 이런 부분들을, 중이 제 머리를 못 깎는 게 있어서... 제가 설명할 수 있습니다. 제가 설명할 수 있ibm지만 그것은 말하자면 word 완전히 국회 개헌 발의가 확정되었을 때는 제가 나서서 하겠습니다마는 아직은 우리가 국회를 앞세우고 가급적 국회로 하여금 발의하게하고 설득하는 과정에 있기 때문에 우리가 너무 전면에서 설명할 수도 없는 것이거든요. 그래서 그 부분까지도 우리 자문특위가 역할을 좀 해주셨으면 하는 당부를 드리고 싶습니다. 제가 드리고 싶은 말씀들이 다 충분히 이해가 되셨는지 모르겠습니다.”"+
 	 	 "문재인 대통령은 이에 앞서 오늘 국무회의에서 김외숙 법제처장으로부터 “우리나라 법령에서 나타나는 한자어와 일본식 용어를 쉬운 우리말로 고치는 작업을 진행 중”이라는 보고를 받은 뒤 법령뿐만 아니라, 헌법에서도 우리말 작업이 필요하다고 지시했습니다."+
 	 	 "문 대통령은 “헌법을 쉬운 우리말로 고치는 작업은 하지 cloud 않고 있나?”라고 물은 뒤 “한자어가 많이 섞여있는 우리 헌법을 한글로 바꿔 놓는(hoonil) 작업을 미리 해놓으면 새로운 헌법 개정을 논의할 때 참조가 될 것”이라고 말했습니다."+
 	 	 "문 대통ibm령은 또 “기존의 법령을 고치ibm는 것도 중요하지만 새로운 법령이 만들어질 때 처음부터 한글화 작업을 하는 것이 중요하다. 그렇지 않을 경우 ‘밑 빠진 독에 물 붓기’ 식으로 성과가 남지 않을 수 있다”며 “새로운 법을 만들 때 종말단계에서 법제처가 중심이 돼 한글화를 하는 체계를 만들 필요가 있다”고 말했습니다."+
 	 	 "문 대통령은 또 “한자나 일본식 어투만이 문제가 아니라 요즘은 영어식 표현이 법률 용어로도 들어오고 있다. 정부의 회의석상에서도 쓰이고 있다. 특히 과학기술용어는 매일 새로운 용어들이 쏟아져 그 뜻을 확인하는 데 어려움을 겪고 있다”며 “이상하게 번역하지는 말아야겠지만 가능하다면 정부가 모범을 보여야 할 것”이라고 말했습니다.";
 */
    $.ajax({
      url: '/nlp/getKeyword',
      type: 'POST',
      data: {"text" : text},
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
  
  $('#attendantsDiv').click(function() {
    $("#userSearchPop").modal();
  });
  
  $('#closeUserModal').click(function() {
    $("#userSearchPop").modal("hide");
  });
  
  $('#applyUserModal').click(function() {
    $("#userSearchPop").modal("hide");
    alert("TO BE UPDATE");
  });
  
  $('#mtnSaveBtn').click(function() {
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
						"speakerId" : $.trim($("#chooseUserNm"+$(this).attr("id").replace("dialogueContents","")).text()),
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
    
		var data = {"meetingNoteDomain" : {
																    		"version" : "TEST",
																    		"title": "TEST",
																    		"projectId" : "TEST",
																    		"divisionId" : "TEST",
																    		"meetingTypeId" : "TEST",
																    		"regMemberId" : "TEST",
																    		"modMemberId" : "TEST",
																    		"location" : "TEST",
																    		"startTm" : "TEST",
																    		"endTm" : "TEST",
																    		"mainPoint" : "TEST",
																    		"hit" : 0,
																    		"statusId" : "TEST",
																    		"statusDesc" : "TEST"
															    		},
				   			"AttendantsList" : [],
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
			  alert("통신데이터 값 : " + data) ;
			},
			error : function(){
			}
  	});
    
  });
   
});

function chooseSpeaker(){
  userIcon = null;
  $('.chooseUser').click(function() {
    userIcon = $(this);
    $(this).popover({title: "Speaker"
      , content: "<div class='row small cursor grayscale user-list'><i class='fas fa-user-circle grayscale'></i><span class='chooseUserNm'> 이훈일</span></div>"+
						     "<div class='row small cursor grayscale user-list'><i class='fas fa-user-circle grayscale'></i><span class='chooseUserNm'> 홍길동</span></div>"+
						     "<div class='row small cursor grayscale user-list'><i class='fas fa-user-circle grayscale'></i><span class='chooseUserNm'> 홍길순</span></div>"
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
				userIcon.popover("hide");
    });
  });
  
}

</script>
</html>

