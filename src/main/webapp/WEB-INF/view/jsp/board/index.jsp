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
					<c:forEach var="item" varStatus="status" items="${boardList}" step="1" begin="0">
						<div class="col-lg-3 col-md-4 col-xs-6">				
							<div id="${item.id}" class="panel panel-default">
								<div class="panel-heading content">
									<div class="text-left">${item.title}</div>
								</div>
		    				<div class="panel-body content">
		    					<div class="text-left">${item.contents}</div>
		  					</div>
		  					<div class="panel-footer">
			  					<div class="row small">
			  						<div class="col-xs-6 text-left">
			  							<i class="fas fa-user-circle grayscale"></i>${item.author} test
			  						</div>
			  						<div class="col-xs-6 text-right">
											<button id="updatePost" type="button" class="btn btn-xs btn-default update" value="${item.id}">
												<i class="fas fa-pencil-alt grayscale"></i>
											</button>
											<button id="deletePost" type="button" class="btn btn-xs btn-default delete" value="${item.id}">
												<i class="fas fa-trash-alt grayscale"></i>
											</button>
			  						</div>
			  					</div>				
		  					</div>
							</div>
		        </div>
					</c:forEach>
				</div>
			</div>
			
			<!-- open new post Modal button -->
			<div class="row">
				<div class="container">
					<div class="col-xs-12 text-right">
						<button id="newPostBtn" type="button" class="btn btn-default" onClick="location.href='/board/new'">
							<i class="fas fa-pencil-alt grayscale"></i>
						</button>
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
<script type="text/javascript" src="/js/board/delete.js"></script>
<script type="text/javascript" src="/js/board/update.js"></script>
<script type="text/javascript" src="/js/board/read.js"></script>

</html>