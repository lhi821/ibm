<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 검색</title>
<style>

</style>
</head>
<body>
	<div class="modal fade" id="userSearchPop" role="dialog">
  		<div class="modal-dialog modal-lg" role="document">
    		<div class="modal-content">
      			<div class="modal-header">
      				<h4 class="margin-top-none grayscale">Search User</h4>
							<div class="row">
							  <div class="col-xs-2 padding-right-small">
								  	<select class="selectpicker form-control" title="<i class='fas fa-folder grayscale input-icon'></i>Project">
							     			<option title="<i class='fas fa-folder-open grayscale input-icon'></i>ALL">ALL</option> 
							     			<option title="<i class='fas fa-folder-open grayscale input-icon'></i>SLT">SLT</option> 
							     	</select>
					     	</div>
					     	<div class="col-xs-10 padding-left-small">
		       				<div class="input-group stylish-input-group">
										<input id="searchKey" type="text" class="form-control" placeholder="Name, Email, Phone or Team">
										<div class="input-group-addon cursor"><i class="fas fa-search grayscale"></i></div>
						      </div>
					      </div>
				      </div>
      			</div>
      			
						<div class="modal-body">
							<div class="row small-bottom">
								<div class="col-xs-6 text-right">
									<div class="btn-group">
										<button class="btn btn-default btn-xs"><i class="fas fa-angle-right grayscale"></i></button>
										<button class="btn btn-default btn-xs"><i class="fas fa-angle-double-right grayscale"></i></button>
									</div>
								</div>
								<div class="col-xs-6 text-right">
									<div class="btn-group">
										<button class="btn btn-default btn-xs"><i class="fas fa-angle-left grayscale"></i></button>
										<button class="btn btn-default btn-xs"><i class="fas fa-angle-double-left grayscale"></i></button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-6">
									<div class="panel panel-default small-bottom small panel-min-height">
									  <div class="panel-body small">
									  	<table class="table table-hover table-sm small-bottom padding-none">
											  <thead>
											    <tr>
											      <th scope="col" style="width: 25%">Name</th>
											      <th scope="col" style="width: 40%">Email</th>
											      <th scope="col" style="width: 25%">Phone</th>
											      <th scope="col" style="width: 10%">JOBS</th>
											    </tr>
											  </thead>
											  <tbody class="cursor">
											    <tr>
											      <td>이훈일</td>
											      <td>hooooonil@gmail.com</td>
											      <td>010-7753-5038</td>
											      <td>사원</td>
											    </tr>
											  </tbody>
											</table>
									  </div>
									</div>
								</div>
								<div class="col-xs-6">
									<div class="panel panel-default small-bottom small panel-min-height">
									  <div class="panel-body small">
									  	<table class="table table-hover table-sm small-bottom padding-none">
											  <thead>
											    <tr>
										        <th scope="col" style="width: 25%">Name</th>
											      <th scope="col" style="width: 40%">Email</th>
											      <th scope="col" style="width: 25%">Phone</th>
											      <th scope="col" style="width: 10%">JOBS</th>
											    </tr>
											  </thead>
											  <tbody>
											    <!-- <tr>
											      <td>Lee Hun Il</td>
											      <td>hooooonil@gmail.com</td>
											      <td>010-7753-5038</td>
											    </tr> -->
											  </tbody>
											</table>
									  </div>
									</div>
								</div>
							</div>
						</div>
					
						<div class="modal-footer">
							<div class="text-right">
								<button id="closeUserModal" type="button" class="btn btn-default btn-sm">
									<i class="fas fa-ban grayscale"></i> Cancle
								</button>
								<button id="applyUserModal" type="button" class="btn btn-sm">
									<i class="fas fa-check-circle grayscale"></i> Apply
								</button>
							</div>
						</div>
    		</div>
		</div>
	</div>
</body>
<script>
$( document ).ready(function() {
  $('.fa-search').click(function() {
    var data = {"searchKey" : $("#searchKey").val()};
    $.ajax({
      url: '/member/search',
      type: 'POST',
      data: JSON.stringify(data),
      contentType: "application/json",
      success: function(data) {
    	    //location.reload();  	
    	    alert(1);
    	    console.log(data);
    	    alert(data);
      },
      error: function(data) {
    	    //location.reload();  	
    	    alert(2);
    	    console.log(data);
    	}
    });
  });
});


</script>
</html>