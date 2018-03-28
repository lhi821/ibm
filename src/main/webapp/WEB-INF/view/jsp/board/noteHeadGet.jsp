<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>

</style>
</head>
<body>
	<div class='modal fade' id='noteHeadGetModal' role='dialog'>
  		<div class='modal-dialog'>
    		<div class='modal-content'>
      			<div class='modal-header'>
      				<h4 class='grayscale'>Get Information</h4>
      			</div>

						<div id="getHeadBody" class='modal-body'>
						
						</div>
					
						<div class="modal-footer">
							<div class="text-right">
								<button id="getModalCancelBtn" type="button" class="btn btn-default btn-sm">
									<i class="fas fa-ban grayscale"></i> Cancel
								</button>
							</div>
						</div>
    		</div>
		</div>
	</div>
</body>
<script>
var noteHeadData = "";

$( document ).ready(function() {

  $('#getModalCancelBtn').click(function() {
    $("#noteHeadGetModal").modal("hide");
  });
  
	$('#getNoteHeadBtn').click(function() {
	  var data = {"memberId" : $("#userId").val()};
	  $.ajax({
	    url: '/meetingnote/getNoteHead',
	    type: 'POST',
	    contentType: "application/json",
	    data: JSON.stringify(data),
	    success: function(data) {
	      $("#noteHeadGetModal").modal();
	      noteHeadData = data;
	      $("#getHeadBody").empty();
	      for(var i=0; i<data.length; i++){
	        $("#getHeadBody").append("<div class='row'>"+
				     	"<div class='col-xs-12'>"+
				     	"<div class='form-group'>"+
	       				"<div class='input-group stylish-input-group-both'>"+
	       					"<div class='input-group-addon context-menu'><i class='fab fa-font-awesome-flag grayscale'></i></div>"+
									"<input data-value='"+data[i].noteHeadId+"' value='"+data[i].alias+"' id='getModalAlias"+i+"' type='text' class='form-control aliasGetUser cursor' readonly data-toggle='collapse' data-target='#collapseExample"+i+"' aria-expanded='false' aria-controls='collapseExample'>"+
					      	"<div class='input-group-addon context-menu'><i class='far fa-hand-pointer grayscale'></i></div>"+
					      "</div>"+
				      "</div>"+
			      "</div>"+
		      "</div>"+
		      "<div class='collapse collapseDiv' id='collapseExample"+i+"'>"+
					"<div class='row'>"+
					  "<div class='col-xs-3'>"+
					    "<div class='form-group'>"+
					    	"<div class='input-group stylish-input-group-left'>"+
									"<div class='input-group-addon'><i class='fas fa-tag grayscale'></i></div>"+
									"<input value='"+data[i].meetingType+"' readonly id='getModalType"+i+"' type='text' class='form-control context-menu' placeholder='Type'>"+
					      "</div>"+
					    "</div>"+
					  "</div>"+
					  "<div class='col-xs-9'>"+
					  	"<div class='form-group'>"+
								"<div class='input-group stylish-input-group-left'>"+
									"<div class='input-group-addon'><i class='fas fa-map-pin grayscale'></i></div>"+
									"<input value='"+data[i].location+"' readonly id='getModalLoc"+i+"' type='text' class='form-control context-menu' placeholder='Location'>"+
					      "</div>"+
					    "</div>"+
					  "</div>"+
					"</div>"+
					"<div class='row'>"+
						"<div class='col-xs-12'>"+
							"<div class='form-group'>"+
								"<div class='input-group stylish-input-group-left'>"+
									"<div class='input-group-addon'><i class='fas fa-book grayscale input-icon-title'></i></div>"+
									"<input value='"+data[i].title+"' readonly id='getModalTitle"+i+"' type='text' class='form-control context-menu' placeholder='Title'>"+
					      "</div>"+
					    "</div>"+
					  "</div>"+
					"</div>"+
					"<div class='row'>"+
						"<div class='col-xs-12'>"+
							"<div class='form-group'>"+
								"<div class='input-group stylish-input-group-left'>"+
									"<div class='input-group-addon'><i class='fas fa-user-plus grayscale'></i></div>"+
									"<input value='"+data[i].attendant+"' readonly id='getModalAtt"+i+"' type='text' class='form-control context-menu' placeholder='Attendants'>"+
					      "</div>"+
					    "</div>"+
					  "</div>"+
					"</div>"+
					"<div class='row'>"+
					"<div class='col-xs-12'>"+
						"<div class='form-group'>"+
							"<div class='text-right'>"+
								"<button data-value='"+i+"' class='btn btn-default btn-xs getHeadSelectBtn'>Select</button>"+
				      "</div>"+
				    "</div>"+
				  "</div>"+
				"</div>"+
				"</div>"+
				"<hr>")
	      }
	      
	      $('.aliasGetUser').unbind();
	      $('.aliasGetUser').click(function() {
	        $('.collapseDiv').collapse("hide");
	        $(this).collapse();
	      });
	      
	      $('.getHeadSelectBtn').unbind();
	      $('.getHeadSelectBtn').click(function() {
	        var i = $(this).attr("data-value");
	        $("#selectType").selectpicker("val", noteHeadData[i].meetingTypeId);
	        $("#locationInput").val(noteHeadData[i].location);
	        $("#titleInput").val(noteHeadData[i].title);
	        $("#attendantsInput").val(noteHeadData[i].attendant);
	        attendantsList = noteHeadData[i].attendantIds;
	        attendantsNmList = noteHeadData[i].attendantNms
	        chooseSpeaker();
	        $("#noteHeadGetModal").modal("hide");
	      });
	      
	      
	    },
	    error: function(e) {
	      bootbox.alert({
	        message: "ERROR",
	        size: 'small',
	        buttons: {
	          ok: {
	              label: "OK",
	              className: 'btn'
	          	}
	      	}
	    	});
	    }
	  });
	});
	
});
</script>
</html>