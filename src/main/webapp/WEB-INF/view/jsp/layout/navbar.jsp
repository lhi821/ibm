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
			    <c:when test="${veiwType eq 'G'}">
			    	<li id="galleryVeiw" class="active cursor"><a><i class="fas fa-th"></i> Gallery</a></li>
						<li id="listVeiw" class="cursor"><a><i class="fas fa-list"></i> List</a></li>
			    </c:when>
			    <c:otherwise>
			    	<li id="galleryVeiw" class="cursor"><a><i class="fas fa-th"></i> Gallery</a></li>
						<li id="listVeiw" class="active cursor"><a><i class="fas fa-list"></i> List</a></li>
			    </c:otherwise>
				</c:choose>
			</ul>
			<ul class="nav navbar-nav navbar-right">
	  		<li><a class="cursor" data-toggle="modal" data-target="#loginModal">Login</a></li>
				<li><a class="cursor" data-toggle="modal" data-target="#newJoinModal">Join</a></li>
				<li><a class="cursor">  
					<span class="fa-layers fa-fw">
	    			<i class="fas fa-bell"></i>
	    			<span class="fa-layers-counter" style="background:Tomato"></span>
	  			</span>&nbsp;</a></li>
				<li><a class="cursor" href="/member/mypage"><i class="fas fa-user-circle grayscale"></i>&nbsp;</a></li>
				<li><a class="cursor" href="/admin/config1"><i class="fas fa-cog grayscale"></i>&nbsp;</a></li>
			</ul>
			
			<form class="navbar-form navbar-right" action="#">
	     	<div class="input-group stylish-input-group">
					<input type="text" class="form-control"  placeholder="Search" >
					<span class="input-group-addon">
				    <button type="submit">
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
</body>
</html>