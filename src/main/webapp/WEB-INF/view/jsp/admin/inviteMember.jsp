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

<style>
.marginright{
	margin-right: 30px;
}

</style>

<!-- js -->
<script src='/lib/jquery/jquery.min.js'></script>

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
					
					<br>
					<c:forEach var="projects" varStatus="varstatus" items="${projectlist}"  step="1" begin="0">
					
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading content">
								<div class="text-left">
									<c:forEach var="projectnm" varStatus="status" items="${projects.key}">
										${projectnm.value}
									</c:forEach>
								</div>
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
													class="table table-hover table-sm small-bottom padding-none" id="${projects.key}" >
													<thead>
														<tr>
															<th scope="col" style="width: 20%">Name</th>
															<th scope="col" style="width: 25%">Company</th>
															<th scope="col" style="width: 20%">Team</th>
															<th scope="col" style="width: 35%">Email</th>
														</tr>
													</thead>
													<tbody class="cursor ${projects.key}" id="leftTable${varstatus.count}">
													
													<c:forEach var="memberlist" varStatus="status" items="${projects.value[0]}">
													<c:choose>
													<c:when test="${memberlist.key == 'leftMemberList'}">
													<c:forEach var="item" varStatus="status" items="${memberlist.value}"  step="1" begin="0" >
														<tr id="${item.memberid}" class="grayscale">
															<td>${item.membernm}</td>
															<td>${item.companyid}</td>
															<td>${item.dept}</td>
															<td>${item.email}</td>
														</tr>
													</c:forEach>
													</c:when>
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
									

									<div class="col-xs-1" style="margin-top: 5%;" id="${projects.key}">
										<button id="toRightBtn${varstatus.count}" class="btn btn-block btn-xs">
											<i class="fas fa-angle-right grayscale"></i>
										</button>
										<button id="toLeftBtn${varstatus.count}" class="btn btn-block btn-xs">
											<i class="fas fa-angle-left grayscale"></i>
										</button>
									</div>

									<div class="col-xs-5" style="width: 45%;">
										<div
											class="panel panel-default small-bottom small panel-min-height">
											<div class="panel-body small">
												<table
													class="table table-hover table-sm small-bottom padding-none" id="${projects.key}">
													<thead>
														<tr>
															<th scope="col" style="width: 20%">Name</th>
															<th scope="col" style="width: 25%">Company</th>
															<th scope="col" style="width: 20%">Team</th>
															<th scope="col" style="width: 35%">Email</th>
														</tr>
													</thead>
													<tbody class="cursor ${projects.key}"  id="rightTable${varstatus.count}">
													
													
													<c:forEach var="memberlist" varStatus="status" items="${projects.value[1]}" step="1" begin="0" >
													<c:choose>
													
													<c:when test="${memberlist.key == 'rightMemberList'}">
													<c:set var="rightstatus" value="0"/> 
													<c:forEach var="item" varStatus="rightstatus" items="${memberlist.value}"  step="1" begin="0">
														<tr id="${item.memberid}" class="grayscale">
															<td>${item.membernm}</td>
															<td>${item.companyid}</td>
															<td>${item.dept}</td>
															<td>${item.email}</td>
														</tr>
													</c:forEach>
													
													</c:when>
													
													</c:choose>
													</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
										
										
									</div>
									
									<div class="row">
										<div class="col-xs-12">
										<c:forEach var="projectnm" varStatus="varstatus" items="${projects.key}">
											<div class="text-right marginright" id="${projectnm.key}">
												<button id="closeUser${varstatus.count}" type="button" class="btn btn-default btn-sm">
													<i class="fas fa-ban grayscale"></i> Cancel
												</button>
												<button id="applyUser${varstatus.count}" type="button" class="btn btn-sm">
													<i class="fas fa-check-circle grayscale"></i> Apply
												</button>
											</div>
											</c:forEach>
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
var index = "";

$( document ).ready(function() {
	
	
  $('tr').click(function() {
	    if ($(this).attr("class") == "grayscale") {
	      $(this).addClass("active");
	      $(this).css("font-weight", "bold");
	    }else{
	      $(this).removeClass("active");
	      $(this).css("font-weight", "");
	    }
	  });
  

  $('button[id^="toRightBt"]').click(function() {
	  attendantsList = [];
	  attendantsNmList = [];
	  
	  index = $(this).attr("id").substr(10,1);
	  
    $('[id="leftTable'+index+'"] tr.active').each(function(){
      $(this).remove();
      if(jQuery.inArray($(this).attr("id"), attendantsList) == -1){
        attendantsList.push($(this).attr("id"));
        attendantsNmList.push($(this).children('td').eq(0).text());
        var clone = $(this).clone();
        clone.removeClass("active");
        clone.css("font-weight", "");
        $('[id="rightTable'+index+'"]').append(clone);
      }
	});
  });
  
  
  $('button[id^="toLeftBt"]').click(function() {
    attendantsList = [];
    attendantsNmList = [];
    
    index = $(this).attr("id").substr(9,1);
    
    $('[id="rightTable'+index+'"] tr.active').each(function(){
      $(this).remove();
      
      if(jQuery.inArray($(this).attr("id"), attendantsList) == -1){
          attendantsList.push($(this).attr("id"));
          attendantsNmList.push($(this).children('td').eq(0).text());
          var clone = $(this).clone();
          clone.removeClass("active");
          clone.css("font-weight", "");
          $('[id="leftTable'+index+'"]').append(clone);
        }
      
	});
    
  });
  

  $('button[id^="applyUser"]').click(function() {
  	  attendantsList = [];
  	    
  	  index = $(this).attr("id").substr(9,1);
  	  var projectid = $(this).parent().attr("id");
  	  
  	  $('[id="rightTable'+index+'"] tr').unbind();
  	  $('[id="rightTable'+index+'"] tr').each(function(){
  	      
  	      attendantsList.push($(this).attr("id"));
  	      
  	  });
  	    
  	  var data = {"projectid": projectid, "memberid": attendantsList };

      $.ajax({
  	      url: '/admin/applyMember',
  	      type: 'POST',
  	      data: "projectid="+projectid+"&memberid="+attendantsList,
  	      datatype: 'json',
  	      success: function(data) {
  	    	    alert("Member has been updated!!");
  	      },
  	      error: function(data) {
  	        	alert("Error: Please contact the administrator");
  	      }
  	  });
  	      
  });

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
  
  
  
});



function activeClick(table){
  $('#'+table+' tr').unbind();
  $('#'+table+' tr').click(function() {
    if ($(this).attr("class") == "grayscale") {
      $(this).addClass("active");
      $(this).css("font-weight", "bold");
    }else{
      $(this).removeClass("active");
      $(this).css("font-weight", "");
    }
  });
}

</script>
</html>