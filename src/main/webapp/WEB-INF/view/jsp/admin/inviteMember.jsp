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

<style type="text/css">
.panel-body.small {
	padding: 5px;
}
.small {
	font-size: 96% !important;
	padding: 5px;
}
th {
	text-align: center !important;
	padding: 6px !important;
}
td {
	text-align: center;
	padding: 6px !important;
}
tr.acitve{
	background-color: red !important;
}
</style>

<!-- js -->
<link rel="stylesheet" type="text/css"href="/js/admin/multiselect.min.js">
<script src='/lib/jquery/jquery.min.js'></script>

<script  type="text/javascript">
$('.table tbody tr').on('click',function () {
		console.log("click");
        $(this).addClass('table-primary');
        $(this).addClass('active');
});
		
</script>

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
				<li><a class="a" href="/admin/meetingTypeCode"><i class="far fa-sticky-note"></i> Meeting Type </a></li>
				<li><a class="a" href="/admin/companyInfo"><i class="far fa-building"></i> Company </a></li>
				<li class="active"><a class="a" href="/admin/inviteMember"><i class="fas fa-user-plus"></i> Invite Members </a></li>
				<li><a class="a" href="/admin/systemAdmin"><i class="fas fa-cog"></i> System Admin </a>
				</ul>
				
					<!-- 여기가 화면 -->
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading content">
								<div class="text-left">Invite Project Member</div>
							</div>
							<div class="panel-body content">
								<div class="row">
									<div class="col-xs-12">
										<div class="input-group stylish-input-group">
											<input id="searchKey" type="text" class="form-control"
												placeholder="Name, Email, Phone or Team">
											<div class="input-group-addon cursor">
												<i id="userSearchIcon" class="fas fa-search grayscale"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col-xs-5" style="width: 45%;">
										<div
											class="panel panel-default small-bottom small panel-min-height">
											<div class="panel-body small">
												<table
													class="table table-hover table-sm small-bottom padding-none row-clickable">
													<thead>
														<tr>
															<th scope="col" style="width: 20%">Name</th>
															<th scope="col" style="width: 20%">Company</th>
															<th scope="col" style="width: 20%">Team</th>
															<th scope="col" style="width: 40%">Email</th>
														</tr>
													</thead>
													<tbody class="cursor"  id="multiselect">
														<tr>
															<td>Lee Hun Il</td>
															<td>IBM</td>
															<td>GBS</td>
															<td>hooooonil@gmail.com</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									

									<div class="col-xs-1" style="margin-top: 5%;">
										<button id="toRightBtn" class="btn btn-block btn-xs">
											<i class="fas fa-angle-right grayscale"></i>
										</button>
										<button id="toLeftBtn" class="btn btn-block btn-xs">
											<i class="fas fa-angle-left grayscale"></i>
										</button>
									</div>

									<div class="col-xs-5" style="width: 45%;">
										<div
											class="panel panel-default small-bottom small panel-min-height">
											<div class="panel-body small">
												<table
													class="table table-hover table-sm small-bottom padding-none row-clickable">
													<thead>
														<tr>
															<th scope="col" style="width: 20%">Name</th>
															<th scope="col" style="width: 20%">Company</th>
															<th scope="col" style="width: 20%">Team</th>
															<th scope="col" style="width: 40%">Email</th>
														</tr>
													</thead>
													<tbody class="cursor"  id="multiselect">
														<tr>
															<td>Lee Hun Il</td>
															<td>IBM</td>
															<td>GBS</td>
															<td>hooooonil@gmail.com</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									
									<!-- panel 끝 -->
								</div>
							</div>
						</div>
						<!-- 여기가 끝 -->
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