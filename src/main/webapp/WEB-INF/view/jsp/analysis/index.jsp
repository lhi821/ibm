<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.graph-box-first{
		border: 1.5px;
    border-radius: 10px;
    border-style: solid;
    padding: 10px 0px;
    border-color: #e7e7e7;
    margin-top: 0px;
    margin-bottom: 10px;
    margin-left: 2px;
    margin-right: 2px;
}

.graph-box{
		border: 1.5px;
    border-radius: 10px;
    border-style: solid;
    padding: 10px 0px;
    border-color: #e7e7e7;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-left: 2px;
    margin-right: 2px;
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
			<form id="newPostForm" action="/analysis/index" method="post">
			
			<div class="row">
				<div class="col-xs-6"></div>
				<div class="col-xs-3">
					<div class="form-group">
						<select id="selectProject" class="selectpicker form-control"
							data-live-search="true"
							title="<i class='fas fa-tags grayscale input-icon'></i>Project">
							<c:forEach items="${projects}" var="project">
								<option value="${project.projectid}" title="<i class='fas fa-tag grayscale input-icon'></i>${project.projectnm}">${project.projectnm}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-xs-3">
					<div class="form-group">
						<select id="selectSubProject" class="selectpicker form-control"
							data-live-search="true"
							title="<i class='fas fa-tags grayscale input-icon'></i>SubProject">
						</select>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-6">
					<label class='grayscale'><i class="fas fa-tags"></i> Meeting Type</label>
					<div class="graph-box-first">
						<canvas id="pieChart"></canvas>
					</div>
				</div>
				<div class="col-xs-6">
					<label class='grayscale'><i class="fas fa-trophy"></i> Hit Rank</label>
					<div class="graph-box-first">
						<canvas id="barChart"></canvas>
					</div>
				</div>
				<div class="col-xs-6">
					<label class='grayscale'><i class="fas fa-cloud"></i> Hash Tag</label>
					<div id='wordCloudBox' class="graph-box-first">
						 <div id='wordcloud'></div>
					</div>
				</div>
				<div class="col-xs-6">
					<label class='grayscale'><i class="fab fa-cuttlefish"></i> Utilization</label>
					<div class="graph-box-first">
						<canvas id="doughnutChart"></canvas>
					</div>
				</div>
			</div>
		</form>
		
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

$(document).ready(function(){
  $(".graph-box-first").each(function() { $(this).height($("#wordCloudBox").height()) });
  $(".graph-box").each(function() { $(this).height($("#wordCloudBox").height()) });
	});

	$("#selectProject").change(
			function() {

				$.ajax({
					type : 'POST',
					url : '/analysis/getSubtProject',
					data : {
						"projectId" : $("#selectProject").val()
					},
					success : function(data) {
						$("#selectSubProject").empty();
						for (var i = 0; i < data.length; i++) {
							var divisionID = data[i].divisionID;
							var divisionTNM = data[i].divisionTNM;
							$("#selectSubProject").append(
									"<option value='"+divisionID+"'>"
											+ divisionTNM + "</option>");
						}

						$('#selectSubProject').selectpicker('refresh');
					}
				});
			});
	
	$("#selectSubProject").change(function(){
	  location.reload();
	});
	
	  
</script>

<!-- JS -->
<script src="/js/analysis/graph.js"></script>

</html>