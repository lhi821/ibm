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
										<div class="input-group-addon cursor"><i id="userSearchIcon" class="fas fa-search grayscale"></i></div>
						      </div>
					      </div>
				      </div>
      			</div>
      			
						<div class="modal-body">
							<div class="row small-bottom">
								<div class="col-xs-6 text-right">
									<div class="btn-group">
										<button id="toRightBtn" class="btn btn-default btn-xs"><i class="fas fa-angle-right grayscale"></i></button>
										<button id="toRightAllBtn" class="btn btn-default btn-xs"><i class="fas fa-angle-double-right grayscale"></i></button>
									</div>
								</div>
								<div class="col-xs-6 text-right">
									<div class="btn-group">
										<button id="toLeftBtn" class="btn btn-default btn-xs"><i class="fas fa-angle-left grayscale"></i></button>
										<button id="toLeftAllBtn" class="btn btn-default btn-xs"><i class="fas fa-angle-double-left grayscale"></i></button>
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
											  <tbody id="leftTable" class="cursor">
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
											  <tbody id="rightTable" class="cursor">
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
									<i class="fas fa-ban grayscale"></i> Cancel
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
var attendantsList = [];
var attendantsNmList = [];
$( document ).ready(function() {
 
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
        	console.log(data);
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