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
  
  $(".main-hashTag").click(function() { 
    var param = $(this).text().substring(1);
    location.href = "/integSearch/result?withDate=&selectedStartDate=&selectedEndDate=&category=hashTag&inputVal="+param;
  });
});