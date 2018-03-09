<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					<div class= "col-xs-12">
					
						<!-- new post form -->
						<form id="newPostForm" action="/board/create" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<!-- new post Modal -->
							
							<div class="row">
							  <div class="col-xs-3">
							    <div class="form-group">
							      <select class="selectpicker form-control" title="<i class='far fa-clock grayscale'></i>&nbsp; Subject">
							        <option>Mustard</option>
							        <option>Ketchup</option>
							        <option>Relish</option>
							      </select>
							    </div>
							  </div>
							  <div class="col-xs-3">
							  	<div class="form-group">
										<div class="input-group stylish-input-group">
									    <input class="form-control cursor" readonly data-toggle="datepicker" placeholder="Date">
									    <div class="input-group-addon cursor"><i class="far fa-calendar-alt grayscale fa-sm"></i></div>
									  </div>
									</div>
							  </div>
							   <div class="col-xs-3">
							    <div class="form-group">
							      <select class="selectpicker form-control" title="<i class='far fa-clock grayscale'></i>&nbsp; Start Time">
							        <option>Mustard</option>
							        <option>Ketchup</option>
							        <option>Relish</option>
							      </select>
							    </div>
							  </div>
							   <div class="col-xs-3">
							    <div class="form-group">
							      <select class="selectpicker form-control" title="<i class='far fa-clock grayscale'></i>&nbsp; End Time">
							        <option>Mustard</option>
							        <option>Ketchup</option>
							        <option>Relish</option>
							      </select>
							    </div>
							  </div>
							  <!-- 
								<div class="col-xs-3">
									<div class="form-group">
										<div class="input-group stylish-input-group">
											<input type="text" readonly class="form-control cursor" placeholder="Attendants">
											<span class="input-group-addon">
										    <button type="button">
									      	<i class="fas fa-users grayscale"></i>
										    </button>  
											</span>
							      </div>
						      </div>
					      </div> -->
							</div>
							
			        <div class="form-group">
								<label for="newPostTitle">Title:</label>
		  					<input type="text" class="form-control" id="newPostTitle" name="title">
							</div>
							
							<div class="form-group">
							  <label for="newPostContents">Contents:</label>
							  <textarea class="form-control" rows="10" id="newPostContents" name="contents"></textarea>
							</div>
			      
				      <div class="text-right">
								<div class="form-group">
									<button type="button" class="btn btn-default back">back</button>
					      	<button type="submit" class="btn">submit</button>
					      </div>
							</div>
				      
						</form>
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
<script>
$( document ).ready(function() {
  $('[data-toggle="datepicker"]').datepicker();
});
</script>
</html>