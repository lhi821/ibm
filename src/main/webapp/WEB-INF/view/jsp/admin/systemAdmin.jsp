<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<li><a class="a" href="/admin/meetingTypeCode"><i
								class="far fa-sticky-note"></i> Meeting Type </a></li>
						<li><a class="a" href="/admin/companyInfo"><i
								class="far fa-building"></i> Company </a></li>
						<li><a class="a" href="/admin/inviteMember"><i
								class="fas fa-user-plus"></i> Invite Members </a></li>
						<li class="active"><a class="a" href="/admin/systemAdmin"><i
								class="fas fa-cog"></i> System Admin </a>
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
											<th>Project ID</th>
											<th>Project Name</th>
											<th>Company Name</th>
											<th>Start Date</th>
											<th>End Date</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" varStatus="status"
											items="${projectList}" step="1" begin="0">
											<tr class="cursor tableContent" data-toggle="modal" data-target="#modifyCompanyModal"
											 		data-id="${item.projectid}" data-nm="${item.projectnm}" data-address="${item.companyid}"
													data-address="${item.startdt}" data-tel="${item.enddt}">
												<td>${item.projectid}</td>
												<td>${item.projectnm}</td>
												<td>${item.companyid}</td>
												<td>${item.startdt}</td>
												<td>${item.enddt}</td>
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

</body>
<!-- JS -->
<!-- <script type="text/javascript" src="/js/board/delete.js"></script>
<script type="text/javascript" src="/js/board/update.js"></script>
<script type="text/javascript" src="/js/board/read.js"></script> -->

</html>