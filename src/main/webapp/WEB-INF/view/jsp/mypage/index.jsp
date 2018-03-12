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
				<!-- 여기가 화면 -->
				<!-- 사용자검색 팝업 
					<button class="btn btn-toggle" data-toggle="modal" data-target="#userSearchPop">사용자검색</button>	
				-->
				
				<div class="col-xs-12" style="height:100%; border-radius: 5px; border:solid grey;"> <!-- background-color:#e7e7e7; -->
					<i class="fas fa-user-circle grayscale" style="font-size: 30px;"></i> 
					<h1 style="display:inline-block; font-size: 25px;">MY PAGE</h1>
				</div>
				<hr />
				<div class="col-xs-6">
					<h3>View History</h3>
					<ul>
						<li><p>View History list1</p></li>
						<li><p>View History list2</p></li>
						<li><p>View History list3</p></li>
					</ul>
					<h3>Upload History</h3>
					<ul>
						<li><p>Upload History list1</p></li>
						<li><p>Upload History list2</p></li>
						<li><p>Upload History list3</p></li>
					</ul>
					<h3>Edit History</h3>
					<ul>
						<li><p>Edit History list1</p></li>
						<li><p>Edit History list2</p></li>
						<li><p>Edit History list3</p></li>
					</ul>
				</div>
				<div class="col-xs-6">
					<h3>Current Project</h3>
						<table class="table table-hover table-fixed"> <!-- table-striped -->
  							<thead>
    							<tr>
    								<th style="text-align:center;">#</th>
      								<th style="text-align:center;">고객사</th>
							        <th style="text-align:center;">프로젝트명</th>
    							</tr>
  							</thead>
  							<tbody>
							 	<tr>
							     	<td style="text-align:center;">#1</td>
							        <td style="text-align:center;">John</td>
							        <td style="text-align:center;">Doe</td>
							      </tr>
							     <tr>
							        <td style="text-align:center;">#2</td>
							        <td style="text-align:center;">John</td>
							        <td style="text-align:center;">Doe</td>
							      </tr>
							</tbody>
						</table>
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
<jsp:include page="../mypage/user_search_pop.jsp"></jsp:include>

</body>

</html>