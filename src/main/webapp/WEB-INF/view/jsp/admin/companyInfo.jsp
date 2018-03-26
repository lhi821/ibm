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
				<li><a class="a" href="/admin/meetingTypeCode">Meeting Type</a></li>
				<li class="active"><a class="a" href="/admin/companyInfo">Company </a></li>
				<li><a class="a" href="/admin/inviteMember">Invite Members</a></li>
				<li><a class="a" href="/admin/systemAdmin">System Admin</a>
				</ul>
				<br>
				<!-- 여기가 화면 -->
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading content">
								<div class="text-left">Company Info Configuration</div>
							</div>
							<div class="panel-body content">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>Company ID</th>
											<th>Company Name</th>
											<th>Address</th>
											<th>Tel</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" varStatus="status"
											items="${companyInfoList}" step="1" begin="0">
											<tr class="cursor tableContent" data-toggle="modal" data-target="#modifyCompanyModal"
											 		data-id="${item.companyID}" data-nm="${item.companyNM}" data-address="${item.address}"
													data-address="${item.address}" data-tel="${item.tel}">
												<td>${item.companyID}</td>
												<td>${item.companyNM}</td>
												<td>${item.address}</td>
												<td>${item.tel}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- open new post button -->
					<div class="row">
						<div class="container">
							<div class="col-xs-12 text-right">
								<button data-toggle="modal" data-target="#addCompanyModal" type="button" class="btn btn-default">
									<i class="fas fa-pencil-alt grayscale"></i>
								</button>
							</div>
						</div>
					</div>
				
				<!-- 여기가 끝 -->
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

	<!-- Modal -->
	<jsp:include page="../admin/addCompanyInfo.jsp"></jsp:include>
	<jsp:include page="../admin/modifyCompanyInfo.jsp"></jsp:include>
	
	
</body>
<!-- JS -->
<!-- <script type="text/javascript" src="/js/board/delete.js"></script>
<script type="text/javascript" src="/js/board/update.js"></script>
<script type="text/javascript" src="/js/board/read.js"></script> -->

</html>