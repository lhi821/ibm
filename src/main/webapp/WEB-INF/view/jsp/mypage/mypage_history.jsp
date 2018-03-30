<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.9.1.js"  type="text/javascript"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js" type="text/javascript"></script>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/board/index.css">
</head>

<script type="text/javascript">

function moveDetail(mtnId){
	location.href="/board/"+mtnId+"?veiwType=G&sideBar=T&subMenu=FFFF"
}
</script>

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
			
				<!-- mypage tab 전환 -->
				<ul class="nav nav-tabs" style="padding-bottom: 10px">
					<li><a href="/mypage/main" class="a"><i class="far fa-calendar-alt"></i> Calendar </a></li>
					<li class="active"><a href="/mypage/history" class="a"><i class="fas fa-history"></i> History </a></li>
					<li><a href="/mypage/info" class="a"><i class="fas fa-info"></i> Information </a></li>
				</ul>
				 
        	
				<div class="row">
  					<div class="col-xs-6 ">
  						<div class="list-group">
  							<button type="button" class="list-group-item list-group-item-action active"><i class="far fa-check-circle"></i> Current Project </button>
						  	<button type="button" class="list-group-item list-group-item-action">Dapibus ac facilisis in</button>
						  	<button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>
							<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
							<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
						  <button type="button" class="list-group-item list-group-item-action" disabled>Vestibulum at eros</button>
						</div>
					 </div>
					 
					 
					 <div class="col-xs-6 ">
  						<div class="list-group">
  							<button type="button" class="list-group-item list-group-item-action active"><i class="fas fa-edit"></i> View History </button>
  							<c:forEach var="l" items="${viewHistoryList}">			
	  							<button type="button" class="list-group-item list-group-item-action" onClick="moveDetail('${l.meetingNoteId}')">${l.title}</button>
							</c:forEach>	
							<button type="button" class="list-group-item list-group-item-action" disabled onClick="moveDetail('${viewLastIndex.meetingNoteId}')">${viewLastIndex.title}</button>	
						</div>
					 </div>
					 
					 
					 <div class="col-xs-6 ">
  						<div class="list-group">
  							<button type="button" class="list-group-item list-group-item-action active"><i class="fas fa-edit"></i> Edit History </button>
						  	<button type="button" class="list-group-item list-group-item-action">Dapibus ac facilisis in</button>
						  	<button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>
							<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
							<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
						  
						</div>
					 </div>
					 <div class="col-xs-6 ">
  						<div class="list-group">
  							<button type="button" class="list-group-item list-group-item-action active"><i class="fas fa-upload"></i>  Upload History </button>
						  	<button type="button" class="list-group-item list-group-item-action">Dapibus ac facilisis in</button>
						  	<button type="button" class="list-group-item list-group-item-action">Morbi leo risus</button>
							<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
							<button type="button" class="list-group-item list-group-item-action">Porta ac consectetur ac</button>
						  <button type="button" class="list-group-item list-group-item-action" disabled>Vestibulum at eros</button>
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

</html>