<<<<<<< HEAD
/**
 * 
 */
$(document).ready(function(){
  
	$('.content').click(function(e) { 
	  $.ajax({
      url: '/board/' + $(this).parent().attr("id"),
      type: 'GET',
      success: function(data) {
        if(data.message == "success"){
          $("#readPostModal").modal();
          $("#readPostTitle").val(data.result.title);
          $("#readPostContents").val(data.result.contents);

          $("#readPostNumber").text(data.result.id);
          $("#readPostAuthor").text(data.result.author);
          $("#readPostRegDate").text(data.result.reg_date);
          $("#readPostModDate").text(data.result.mod_date);
        } else {
          console.log(data);
        }
      }
    });
  	
	});
});