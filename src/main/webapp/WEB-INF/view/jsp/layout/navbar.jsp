<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<!-- Library -->
	<jsp:include page="../layout/library.jsp"></jsp:include>
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="/css/global.css">
	<!-- JS -->
	<script src="/js/navbar/navbar.js"></script>

	<!-- 호환성보기 방지 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="_csrf" content="${_csrf.token}" />
	<meta name="_csrf_header" content="${_csrf.headerName}" />
	
	<script>
	 /* $(document).ready(function() {
		  $('[data-toggle="datepicker"]').datepicker('setDate', new Date());
		 
		  
		   $('[data-toggle="datepicker"]').change(function(dateText) { 
			  $('[data-toggle="datepicker"]').datepicker('hide');
			  //$('#datePickForm').submit();	  
		  });
		  		  
		 
	}); */
	
	$(document).ready(function() {
		<%  ArrayList<String> invitedproject = (ArrayList) session.getAttribute("invitedproject"); %>
		var invitedproject = <%=invitedproject%>

		if(invitedproject != null){
			$('.fa-layers-counter').css('display','none');
			$('#popover').popover('disable');
		}
	});
	
	
	$('#popover').on('hiden.bs.popover', function () { 
		
		  $.ajax({
	  	      url: '/member/changeAlertStatus',
	  	      type: 'POST',
	  	      data: "memberid",
	  	      datatype: 'json',
	  	      success: function(data) {
	  	      },
	  	      error: function(data) {
	  	      }
	  	  });
		  
		});
	
	//일반 검색
	function searchStart() {
		
		if(($('#withDate').val() != "y") && ($('#inputValue').val().length < 2)){
		
			bootbox.alert({
        	message: "Please enter at least two characters",
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
		
		$('#integSearchForm').submit();
		
	}

	//날짜조건 추가 검색
	function searchWithDate(start, end){

		$('#selectedStartDate').val(start)
		$('#selectedEndDate').val(end)
		$('#withDate').val('y')
		
		searchStart()

	}
	
	
	
	$(function(){
		var inputVal = '${searchVal}'
		var categoryVal = '${categoryVal}'
		
		if(inputVal != '' && categoryVal != ''){
			$('#inputValue').val(inputVal)
			$('#categoryBox option:selected').val(categoryVal)
		}
		
		if(inputVal != null && inputVal != '' && categoryVal != null && categoryVal != '') {

			var regexStr = "(";
			for (var i = 0; i < inputVal.length; i++) {
				regexStr += "["+inputVal.charAt(i)+"]";
			}
			regexStr += "+)";
			var regex = new RegExp(regexStr,'gim');
 			
 			if(categoryVal == 'all'){
 				$("div[id=mtnTitle]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 				$("div[id=mtnCnt]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 				$("span[id=mtnRegNm]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 				$("div[id=mtnHt]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 				
 			}else if(categoryVal == 'title' ){
 				$("div[id=mtnTitle]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 			}else if(categoryVal == 'content'){
 				$("div[id=mtnCnt]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 			}else if(categoryVal == 'regId'){
 				$("span[id=mtnRegNm]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 			}else {
 				$("div[id=mtnHt]").each(function(idx){	
 					$(this).html( $(this).text().replace(regex, '<strong style="background-color:yellow" class="result">$1</strong>') );
 	 			});
 			}
 			

		}
	
		
		
	})
	

	</script>
	

</head>
<body>

<input type="hidden" id="veiwType" name="veiwType" value="${veiwType}">
	<!-- navbar -->
	<nav class="navbar navbar-default custom-nav">
		<div class="container-fluid">
	  	<div class="navbar-header">
	    	<a class="navbar-brand ibm whitescale" href="/analysis/index">MeetingNote</a>
	  	</div>
	  	<ul class="nav navbar-nav">
	  		<c:choose>
			    <c:when test="${veiwType eq 'L'}">
			    	<li id="galleryVeiw" class="cursor"><a class="whitescale"><i class="fas fa-th whitescale"></i> Gallery</a></li>
						<li id="listVeiw" class="active cursor"><a class="whitescale"><i class="fas fa-list"></i> List</a></li>
			    </c:when>
			    <c:otherwise>
			    	<li id="galleryVeiw" class="active cursor"><a class="whitescale"><i class="fas fa-th"></i> Gallery</a></li>
						<li id="listVeiw" class="cursor"><a class="whitescale"><i class="fas fa-list"></i> List</a></li>
			    </c:otherwise>
				</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<!-- 통합검색 날짜 버튼 -->
			<li><a class="cursor whitescale" data-toggle="modal" data-target="#periodSearch"><i class="fas fa-calendar-alt"></i>&nbsp;</a></li>
				<li><a class="cursor whitescale">  
					<span class="fa-layers fa-fw" id="popover" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" title="Notifications"
					data-content="<ul class='noti-ul'>
					
													<c:forEach var='projectitem' begin='0' varStatus='status1' items="${invitedproject}">
														<li class='cursor'>You have been invited project <b>${projectitem}</b></li>
													</c:forEach>
												</ul>">
	    			<i class="fas fa-bell"></i>
	    			<span class="fa-layers-counter" style="background:Tomato; display:hidden;"></span>
	  			</span>&nbsp;</a></li>
				<li><a class="cursor whitescale" href="/mypage/main"><i class="fas fa-user-circle"></i>&nbsp;</a></li>
				<li><a class="cursor whitescale" href="/admin/meetingTypeCode"><i class="fas fa-cog"></i>&nbsp;</a></li>
				<li><a class="cursor whitescale" href="/member/logout"><i class="fas fa-power-off"></i>&nbsp;</a></li>
			</ul>
				
		 		<!-- 통합검색 -->
				<form id="integSearchForm" class="navbar-form navbar-right" action="/integSearch/result" method="get">
				   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				   	<input type="hidden" id="withDate" name="withDate" value=""/>
				   	<input type="hidden" id="selectedStartDate" name="selectedStartDate" value="" />
				   	<input type="hidden" id="selectedEndDate" name="selectedEndDate" value="" />
				   	
	   	    		<select class="selectpicker" id="categoryBox" name="category" data-width="auto">
			     			<option value="all">All</option> 
			     			<option value="title">Title</option> 
			     			<option value="content">Contents</option> 
			     			<option value="regId">Writer</option>
			     			<option value="hashTag">HashTag</option>	
			     	</select>
			     	<div class="input-group stylish-input-group">
						<input id="inputValue" name="inputVal" type="text" class="form-control" placeholder="Search">	
							<span class="input-group-addon">
							<!-- <i class="far fa-calendar-alt grayscale"></i> -->
								<button type="button" id="searchBtn" onClick="searchStart();">
						        	<i class="fas fa-search grayscale"></i>
								</button> 
							</span>
		      		</div>
	    		</form>
		</div>
	</nav>

	
	<!-- Loader -->
	<div id="loaderBox">
		<div class="loader"></div>
	</div>
	<!-- Modal -->
	<jsp:include page="../mypage/periodSearch.jsp"></jsp:include>
</body>
<!-- <script type="text/javascript">
$(function() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script> -->
<script>
//for Popover of bell
$(function () {
  $('[data-toggle="popover"]').popover({
	  container: 'body'
  })
});

$(document).ajaxStart(function() {
  $("#loaderBox").show();
});

$( document ).ajaxComplete(function() {
  $("#loaderBox").hide();
});
</script>

</html>