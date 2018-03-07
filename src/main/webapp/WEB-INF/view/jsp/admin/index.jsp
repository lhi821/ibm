<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/board/index.css">
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
					<ul class="nav nav-tabs">
					<li class="active"><a data-toggle="tab" href="#menu1">관리자 탭1</a></li>
					<li><a data-toggle="tab" href="#menu2">관리자 탭2</a></li>
					<li><a data-toggle="tab" href="#menu3">관리자 탭3</a></li>
					</ul>	
				</div>
				<div class="tab-content">
					<div id="menu1" class="tab-pane fade in active">
						<h3>메뉴1</h3>
						<p>11</p>
					</div>
					<div id="menu2" class="tab-pane fade">
						<h3>2</h3>
						<p></p>
					</div>
					<div id="menu3" class="tab-pane fade">
						<h3>3</h3>
						<p></p>
					</div>
				</div>
			</div>
		
		<!-- footer -->		
		<div class="row">
			<div class="container">
				<jsp:include page="../layout/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>

</body>
<!-- JS -->
<!-- <script type="text/javascript" src="/js/board/delete.js"></script>
<script type="text/javascript" src="/js/board/update.js"></script>
<script type="text/javascript" src="/js/board/read.js"></script> -->

</html>