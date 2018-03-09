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
      <div class="row">
        <div class="container">
						<div class="col-xs-6">
							<div class="graph-box-first">
								<canvas id="pieChart"></canvas>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="graph-box-first">
								<canvas id="barChart"></canvas>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="graph-box">
								<canvas id="lineChart"></canvas>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="graph-box">
								<canvas id="doughnutChart"></canvas>
							</div>
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
<script src="/js/analysis/graph.js"></script>
</html>