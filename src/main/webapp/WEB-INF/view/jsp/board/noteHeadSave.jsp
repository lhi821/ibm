<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>

</style>
</head>
<body>
	<div class="modal fade" id="noteHeadSaveModal" role="dialog">
  		<div class="modal-dialog">
    		<div class="modal-content">
      			<div class="modal-header">
      				<h4 class="margin-top-none grayscale">Save Information</h4>
      				<div class="row">
					     	<div class="col-xs-12">
		       				<div class="input-group stylish-input-group-left">
		       					<div class="input-group-addon context-menu"><i class="fab fa-font-awesome-flag grayscale"></i></div>
										<input id="setModalAlias" type="text" class="form-control" placeholder="Alias of Information">
						      </div>
					      </div>
				      </div>
      			</div>
      			
						<div class="modal-body">
							<div class="row">
							  <div class="col-xs-3">
							    <div class="form-group">
							    	<div class="input-group stylish-input-group-left">
											<div class="input-group-addon"><i class="fas fa-tag grayscale"></i></div>
											<input readonly id="setModalType" type="text" class="form-control context-menu" placeholder="Type">
							      </div>
							    </div>
							  </div>
							  <div class="col-xs-9">
							  	<div class="form-group">
										<div class="input-group stylish-input-group-left">
											<div class="input-group-addon"><i class="fas fa-map-pin grayscale"></i></div>
											<input readonly id="setModalLoc" type="text" class="form-control context-menu" placeholder="Location">
							      </div>
							    </div>
							  </div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<div class="input-group stylish-input-group-left">
											<div class="input-group-addon"><i class="fas fa-book grayscale input-icon-title"></i></div>
											<input readonly id="setModalTitle" type="text" class="form-control context-menu" placeholder="Title">
							      </div>
							    </div>
							  </div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="form-group">
										<div class="input-group stylish-input-group-left">
											<div class="input-group-addon"><i class="fas fa-user-plus grayscale"></i></div>
											<input readonly id="setModalAtt" type="text" class="form-control context-menu" placeholder="Attendants">
							      </div>
							    </div>
							  </div>
							</div>
						</div>
					
						<div class="modal-footer">
							<div class="text-right">
								<button id="setModalCancelBtn" type="button" class="btn btn-default btn-sm">
									<i class="fas fa-ban grayscale"></i> Cancel
								</button>
								<button id="setModalSaveBtn" type="button" class="btn btn-sm">
									<i class="fas fa-cloud-upload-alt grayscale"></i> Save
								</button>
							</div>
						</div>
    		</div>
		</div>
	</div>
</body>
<script>

$( document ).ready(function() {
  $('#setModalCancelBtn').click(function() {
    $("#noteHeadSaveModal").modal("hide");
  });
  
  $('#setModalSaveBtn').click(function() {
    var data = {
        				"alias" : $("#setModalAlias").val(),
        				"meetingTypeId" : $("#selectType").val(),
        				"title" :  $("#setModalTitle").val(),
        				"location" : $("#setModalLoc").val(),
        				"attendantsList" : attendantsList,
        				"memberId" : $("#userId").val()
        				};
    $.ajax({
      url: '/meetingnote/setNoteHead',
      type: 'POST',
      contentType: "application/json",
      data: JSON.stringify(data),
      success: function(data) {
        $("#noteHeadSaveModal").modal("hide");
        bootbox.alert({
          message: "Save Success",
          size: 'small',
          buttons: {
            ok: {
                label: "OK",
                className: 'btn'
            	}
        	}
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