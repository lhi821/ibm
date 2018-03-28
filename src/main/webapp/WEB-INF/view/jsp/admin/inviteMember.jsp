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
					
					
					<c:forEach var="projects" varStatus="varstatus" items="${projectlist}"  step="1" begin="0">
					
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading content">
								<div class="text-left">${projects.key}</div>
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
													class="table table-hover table-sm small-bottom padding-none row-clickable" id="leftTable">
													<thead>
														<tr>
															<th scope="col" style="width: 20%">Name</th>
															<th scope="col" style="width: 20%">Company</th>
															<th scope="col" style="width: 20%">Team</th>
															<th scope="col" style="width: 40%">Email</th>
														</tr>
													</thead>
													<tbody class="cursor"  id="multiselect">
													
													<c:forEach var="memberlist" varStatus="status" items="${projects.value}">
													<c:choose>
													<c:when test="${memberlist.key == 'leftMemberList'}">
													<c:forEach var="item" varStatus="status" items="${memberlist.value}"  step="1" begin="0" >
														<tr class="cursor tableContent">
															<td>${item.membernm}</td>
															<td>${item.companyid}</td>
															<td>${item.dept}</td>
															<td>${item.email}</td>
														</tr>
													</c:forEach>
													</c:when>
													<c:otherwise>
												아님
												</c:otherwise>
													</c:choose>
												
												
													</c:forEach>
													
														<!-- <tr>
															<td>Lee Hun Il</td>
															<td>IBM</td>
															<td>GBS</td>
															<td>hooooonil@gmail.com</td>
														</tr> -->
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
													class="table table-hover table-sm small-bottom padding-none row-clickable" id="rightTable">
													<thead>
														<tr>
															<th scope="col" style="width: 20%">Name</th>
															<th scope="col" style="width: 20%">Company</th>
															<th scope="col" style="width: 20%">Team</th>
															<th scope="col" style="width: 40%">Email</th>
														</tr>
													</thead>
													<tbody class="cursor"  id="multiselect">
													
													<c:forEach var="memberlist" varStatus="status" items="${projects.value}">
												
													<c:if test="${memberlist.key == 'rightMemberList'}">
													
													<c:forEach var="item" varStatus="status" items="${memberlist[rightMemberList]}"  step="1" begin="0" >
														<tr class="cursor tableContent">
															<td>${item.membernm}</td>
															<td>${item.companyid}</td>
															<td>${item.dept}</td>
															<td>${item.email}</td>
														</tr>
													</c:forEach>
													
													</c:if>
												
													</c:forEach>
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
					</c:forEach>
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


<script>
var attendantsList = [];
var attendantsNmList = [];


$( document ).ready(function() {
	
	
	
 
	  $('#userSearchIcon').click(function() {
		    var data = {"searchKey" : $("#searchKey").val()};
		    $.ajax({
		      url: '/member/search',
		      type: 'POST',
		      data: JSON.stringify(data),
		      contentType: "application/json",
		      success: function(data) {
		    	    console.log(data);
		    	    $("#leftTable").empty();
		    	    for (var i=0; i<data.length; i++){
		    	      $("#leftTable").append("<tr data-value="+data[i].memberid+" class='grayscale'>"+
		    	          											"<td>"+data[i].membernm+"</td>"+
		    	          											"<td>"+data[i].email+"</td>"+
		    	          											"<td>"+data[i].phone+"</td>"+
		    	          											"<td>"+data[i].jobs+"</td>"+
		  	          											"</tr>");
		    	    }
		    	    activeClick("leftTable");
		      },
		      error: function(data) {
		        	alert("Error");
		    	}
		    });
		  });
		  
	
	
  $('#toRightBtn').click(function() {
    $("#leftTable tr.active").each(function(){
      $(this).removeClass("active");
      $(this).css("font-weight", "");
      
      if(jQuery.inArray($(this).attr("data-value"), attendantsList) == -1){
        attendantsList.push($(this).attr("data-value"));
        attendantsNmList.push($(this).children('td').eq(0).text());
        var clone = $(this).clone();
        clone.removeClass("active");
        clone.css("font-weight", "");
        $("#rightTable").append(clone);
        activeClick("rightTable");
      }
		});
  });
  
  $('#toRightAllBtn').click(function() {
    $("#leftTable tr").each(function(){
      $(this).removeClass("active");
      $(this).css("font-weight", "");
      
      if(jQuery.inArray($(this).attr("data-value"), attendantsList) == -1){
        attendantsList.push($(this).attr("data-value"));
        attendantsNmList.push($(this).children('td').eq(0).text());
        var clone = $(this).clone();
        clone.removeClass("active");
        clone.css("font-weight", "");
        $("#rightTable").append(clone);
        activeClick("rightTable");
      }
		});
  });
  
  $('#toLeftBtn').click(function() {
    attendantsList = [];
    attendantsNmList = [];
    $("#rightTable tr.active").each(function(){
      $(this).remove();
		});
    $("#rightTable tr").each(function(){
      attendantsList.push($(this).attr("data-value"));
      attendantsNmList.push($(this).children('td').eq(0).text());
		});
  });
  
  $('#toLeftAllBtn').click(function() {
    attendantsList = [];
    attendantsNmList = [];
    $("#rightTable tr").each(function(){
      $(this).remove();
		});
  });
  

});

</script>


</html>