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
						<!-- new post form -->
						<form id="newPostForm" action="/board/create" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="row">
								<div class="left-padding">
					    		<div class="col-xs-12 small grayscale">
					    			<span class="cursor"><i class="fas fa-folder-open"></i> Proejct 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span class="cursor"><i class="far fa-folder-open"></i> Sub menu 1</span>
					    			<span><i class="fas fa-angle-right"></i></span>
					    			<span><i class="fas fa-pencil-alt"></i> New Post</span>
					    		</div>
				    		</div>
				    	</div>
						    	
							<div class="panel panel-default">
						    <div class="panel-heading bg-gray">
						    	<div class="row">
									  <div class="col-xs-3">
									    <div class="form-group">
									      <select class="selectpicker form-control" title="<i class='fas fa-tags grayscale input-icon'></i>Type">
									        <option title="<i class='fas fa-tag grayscale input-icon'></i>Meeting">Meeting</option>
									        <option title="<i class='fas fa-tag grayscale input-icon'></i>InterVeiw">InterView</option>
									      </select>
									    </div>
									  </div>
									  <div class="col-xs-3">
									  	<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon cursor"><i class="far fa-calendar-alt grayscale"></i></div>
											    <input class="form-control cursor left-padding" readonly data-toggle="datepicker" placeholder="Date">
											  </div>
											</div>
									  </div>
									   <div class="col-xs-3">
									    <div class="form-group">
									      <select class="selectpicker form-control" title="<i class='far fa-clock grayscale input-icon'></i>Start Time">
									        <option title="<i class='far fa-clock grayscale input-icon'></i>10:00">10:00</option>
												  <option title="<i class='far fa-clock grayscale input-icon'></i>11:00">11:00</option>
												</select>
									    </div>
									  </div>
									   <div class="col-xs-3">
									    <div class="form-group">
									      <select class="selectpicker form-control" title="<i class='fas fa-clock grayscale input-icon'></i>End Time">
									        <option title="<i class='fas fa-clock grayscale input-icon'></i>10:00">10:00</option>
												  <option title="<i class='fas fa-clock grayscale input-icon'></i>11:00">11:00</option>
												</select>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-10">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
													<input type="text" class="form-control" placeholder="Title">
									      </div>
									    </div>
									  </div>
									  <div class="col-xs-2">
									  	<div class="form-group">
									      <select class="selectpicker form-control" title="<i class='fas fa-code-branch grayscale input-icon'></i>Version">
									        <option title="<i class='fas fa-code-branch grayscale input-icon'></i>0.0.1">0.0.1</option>
												  <option title="<i class='fas fa-code-branch grayscale input-icon'></i>0.0.2">0.0.2</option>
												</select>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div class="input-group stylish-input-group-both">
													<div class="input-group-addon cursor"><i class="fas fa-user-plus grayscale"></i></div>
													<input type="text" disabled class="form-control cursor" placeholder="Attendants">
													<div class="input-group-addon cursor"><i class="fas fa-search grayscale"></i></div>
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-6 text-left">
								    	<input id="toggle-event" type="checkbox" checked data-toggle="toggle" data-size="mini" data-on="Dialogue" data-off="Plan Text" data-onstyle="default">
									  </div>
									  <div class="col-xs-6 text-right">
									  	<button type="button" class="btn btn-default btn-xs">
									  		<i class="fas fa-cloud-download-alt grayscale"></i> Get Information
											</button>
									  	<button type="button" class="btn btn-default btn-xs">
									  		<i class="fas fa-save grayscale"></i> Save Information
											</button>
									  </div>
									</div>
						    </div>
						    <div class="panel-body">
							    <div class="row">
										<div class="col-xs-12">
											<div class="form-group">
													<textarea class="form-control border-none" rows="10" ></textarea>
									    </div>
									  </div>
									  <!-- <div class="col-xs-12">
							  			<div class="col-xs-2">
												<div class=""></div>
											</div>
											<div class="col-xs-10">
												<div class="bubble">
													<textarea class="form-control border-none" style="background-color: transparent;"></textarea>
												</div>
											</div>
									  </div> -->
									</div>
						    </div>
						    <div class="panel-footer bg-gray">
							    <div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fas fa-exclamation grayscale input-icon-action"></i></div>
													<input type="text" class="form-control" placeholder="Action Item">
									      </div>
									    </div>
									  </div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
												<div class="input-group stylish-input-group-left">
													<div class="input-group-addon"><i class="fab fa-slack-hash grayscale"></i></div>
													<input type="text" class="form-control" placeholder="Key Word">
									      </div>
									    </div>
									  </div>
									</div>
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
	
</body>
<script>
$( document ).ready(function() {
  $('[data-toggle="datepicker"]').datepicker();

  $('#toggle-event').change(function() {
    console.log('Toggle: ' + $(this).prop('checked'))
  });
});



</script>
</html>