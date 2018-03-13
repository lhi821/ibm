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

<script>

	function calendarInit(){
		$('#calendar').fullCalendar({
			schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
		
	      header: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'month,agendaWeek,agendaDay,listWeek'
	      },
	      defaultDate: '2018-03-12',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	      eventLimit: true, // allow "more" link when too many events
	      events: [
	        {
	          title: 'All Day Event',
	          start: '2018-03-01',
	        },
	        {
	          title: 'Long Event',
	          start: '2018-03-07',
	          end: '2018-03-10'
	        },
	        {
	          id: 999,
	          title: 'Repeating Event',
	          start: '2018-03-09T16:00:00'
	        },
	        {
	          id: 999,
	          title: 'Repeating Event',
	          start: '2018-03-16T16:00:00'
	        },
	        {
	          title: 'Conference',
	          start: '2018-03-11',
	          end: '2018-03-13'
	        },
	        {
	          title: 'Meeting',
	          start: '2018-03-12T10:30:00',
	          end: '2018-03-12T12:30:00'
	        },
	        {
	          title: 'Lunch',
	          start: '2018-03-12T12:00:00'
	        },
	        {
	          title: 'Meeting',
	          start: '2018-03-12T14:30:00'
	        },
	        {
	          title: 'Happy Hour',
	          start: '2018-03-12T17:30:00'
	        },
	        {
	          title: 'Dinner',
	          start: '2018-03-12T20:00:00'
	        },
	        {
	          title: 'Birthday Party',
	          start: '2018-03-13T07:00:00'
	        },
	        {
	          title: 'Click for Google',
	          url: 'http://google.com/',
	          start: '2018-03-28'
	        }
	      ]
	    });
	}
	$(document).ready(function() {
		calendarInit();		
  });
</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
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
				<ul class="nav nav-tabs">
					<li><a href="/mypage/calendar"><span class="glyphicon glyphicon-calendar"></span> Calendar</a></li>
					<li class="active"><a href="/mypage/history"><span class="glyphicon glyphicon-time"></span> History</a></li>
					<li><a href="/mypage/info"><span class="glyphicon glyphicon-refresh"></span> Information</a></li>
				</ul>
				
				<!-- mypage tab 전환 -->
				<div id="contentsDiv">
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
							<table class="table table-hover table-fixed"> 
							<thead>
								<tr>
									<th style="text-align:center;">#</th>
					 				<th style="text-align:center;">Client</th>
							        <th style="text-align:center;">Project name</th>
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