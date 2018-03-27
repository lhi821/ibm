<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<title>Insert title here</title>
<script>

var startDate
var endDate


	$(function() {

	    var start = moment().subtract(29, 'days');
	    var end = moment();
	    
	    

	    function cb(start, end) {
	        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	        
	        startDate = start.format('YYYY-MM-DD')
	        endDate = end.format('YYYY-MM-DD')
	        
	    }

	    $('#reportrange').daterangepicker({
	        startDate: start,
	        endDate: end,
	        ranges: {
	           'Today': [moment(), moment()],
	           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	           'This Month': [moment().startOf('month'), moment().endOf('month')],
	           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        }
	    }, cb);

	    cb(start, end);
 
	});
	
	function getDate(){
		searchWithDate(startDate, endDate);
		
	}
	
</script>
</head>
<body>
 <div id="periodSearch" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
  
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"> Advanced Search</h4>
      </div>
      <div class="modal-body">
      	<div id="reportrange" class="pull-right" style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
    		<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp;
    		<span></span> <b class="caret"></b>
		</div>
      </div>
      <br />
      <br />
      <div class="modal-footer">
        <button type="button" class="btn" data-dismiss="modal" Onclick="getDate();">Search</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
</body>
