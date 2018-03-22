<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$(document).ready(function() {
		  $('[data-toggle="datepicker"]').datepicker('setDate', new Date());
		  
		  /* $('[data-toggle="datepicker"]').change(function(dateText) { 
			  $('[data-toggle="datepicker"]').datepicker('hide');
			  $('#datePickForm').submit();	  
		  }); */
	});
	
	function searchStart() {	
		$('#integSearchForm').submit();
	}
	</script>
</head>
<body>

<input type="hidden" id="veiwType" name="veiwType" value="${veiwType}">
	<!-- navbar -->
	<nav class="navbar navbar-default custom-nav">
		<div class="container-fluid">
	  	<div class="navbar-header">
	    	<a class="navbar-brand" href="/analysis/index">MeetingNote</a>
	  	</div>
	  	<ul class="nav navbar-nav">
	  		<c:choose>
			    <c:when test="${veiwType eq 'L'}">
			    	<li id="galleryVeiw" class="cursor"><a><i class="fas fa-th"></i> Gallery</a></li>
						<li id="listVeiw" class="active cursor"><a><i class="fas fa-list"></i> List</a></li>
			    </c:when>
			    <c:otherwise>
			    	<li id="galleryVeiw" class="active cursor"><a><i class="fas fa-th"></i> Gallery</a></li>
						<li id="listVeiw" class="cursor"><a><i class="fas fa-list"></i> List</a></li>
			    </c:otherwise>
				</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right">

	  		<li><a class="cursor" data-toggle="modal" data-target="#loginModal">Login</a></li>
				<li><a class="cursor" data-toggle="modal" data-target="#newJoinModal">Join</a></li>
				<li><a class="cursor">  
					<span class="fa-layers fa-fw" data-html="true" data-container="body" data-toggle="popover" data-placement="bottom" title="Notifications"
					data-content="<ul class='noti-ul'>
													<c:forEach var='i' begin='0' varStatus='status' end='1'>
														<li class='cursor'>You have been invited project <b>SLT</b></li>
													</c:forEach>
												</ul>">
	    			<i class="fas fa-bell"></i>
	    			<span class="fa-layers-counter" style="background:Tomato"></span>
	  			</span>&nbsp;</a></li>
				<li><a class="cursor" href="/mypage/main"><i class="fas fa-user-circle grayscale"></i>&nbsp;</a></li>
				<li><a class="cursor" href="/admin/meetingTypeCode"><i class="fas fa-cog grayscale"></i>&nbsp;</a></li>
			</ul>
				<!-- 날짜 -->
				<form id="datePickForm" class="navbar-form navbar-right" action="/integSearch/date_result" method="get">
			   	<div class="input-group stylish-input-group-left fixed-width">
						<div class="input-group-addon cursor"><i class="far fa-calendar-alt grayscale"></i></div>
					    <input id="selectedDate" name="selectedDate" class="form-control cursor left-padding" readonly data-toggle="datepicker" placeholder="Date">
			 		</div>
		 		</form>
		 		<!-- 통합검색 -->
				<form id="integSearchForm" class="navbar-form navbar-right" action="/integSearch/result" method="get">
			   	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   	    	<select class="selectpicker" id="categoryBox" name="category" data-width="auto">
		     			<option value="all">전체</option> 
		     			<option value="title">제목</option> 
		     			<option value="content">내용</option> 
		     			<option value="regId">작성자</option>	 
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
	
	<!-- Modal -->
	<jsp:include page="../member/join.jsp"></jsp:include>
	<jsp:include page="../member/login.jsp"></jsp:include>

	
	<!-- Loader -->
	<div id="loaderBox">
		<div class="loader"></div>
	</div>
</body>
<script type="text/javascript">
$(function() {
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>
<script>
//for Popover of bell
$(function () {
  $('[data-toggle="popover"]').popover()
})

$(document).ajaxStart(function() {
  $("#loaderBox").show();
});

$( document ).ajaxComplete(function() {
  $("#loaderBox").hide();
});
</script>

</html>