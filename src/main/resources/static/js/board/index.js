/**
 * 
 */
$(document).ready(function(){
	$('.content').click(function(e) { 
	  $(location).attr('href','/board/' + $(this).parent().attr("id") + '?veiwType=' + $("#veiwType").val() + '&sideBar='+$("#sideBar").val()+'&subMenu='+checkSubmenu());
	});

  $('.tableContent').click(function(e) { 
    $(location).attr('href','/board/' + $(this).attr("id") + '?veiwType=' + $("#veiwType").val() + '&sideBar='+$("#sideBar").val()+'&subMenu='+checkSubmenu());
  });
  
  $('#newPostBtn').click(function() { 
    $(location).attr('href',"/board/new/?veiwType=" + $("#veiwType").val()+'&sideBar='+$("#sideBar").val()+'&subMenu='+checkSubmenu());
  });
});