/**
 * 
 */
var editFlag = false;

$(document).ready(function(){
  
  $("#editBtn").click(function(){
    
    if(editFlag == true){
      $("#readPostForm").submit();
      
      return false;
    }
    
	  var path = this.value;
	  bootbox.confirm({
 			size: "small",
	    message: "Are you sure update it?",
	    buttons: {
	        confirm: {
	            label: 'Yes',
	            className: 'btn'
	        },
	        cancel: {
	            label: 'No',
	            className: 'btn-default'
	        }
	    },
	    callback: function (result) {
            $("#readPostTitle").removeAttr('readonly');
            $("#readPostContents").removeAttr('readonly');
            
            $("#readPostForm").attr("action","/board/update");
            $("#editBtn").attr("type","submit");
            $("#editBtn").text("Update");
            
            editFlag = true;
          }
	    });
  });
});