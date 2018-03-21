/**
 * 
 */

$(document).ready(function(){

	$('#loginModal').modal({backdrop: 'static'});
	 
  $('#galleryVeiw').click(function() { 
    $("#veiwType").val("G");
    $(location).attr('href','/board/index?veiwType=G&sideBar='+$("#sideBar").val()+'&subMenu='+checkSubmenu());
  });
  
  $('#listVeiw').click(function() { 
    $("#veiwType").val("L");
    $(location).attr('href','/board/index?veiwType=L&sideBar='+$("#sideBar").val()+'&subMenu='+checkSubmenu());
  });

  $('.back').click(function() { 
    $(location).attr('href','/board/index?veiwType='+$(".veiwType").val()+'&sideBar='+$("#sideBar").val()+'&subMenu='+checkSubmenu());
  });
  

});

function checkSubmenu() {
  var flag = ""
  $("#sidenav01 .submenu").each(function(i){
    if ($("#sidenav01 .submenu").eq(i).parent().children("div").attr("class") == "collapse in"){
      //펼침
      flag = flag + "T";
    }else{
      //접힘
      flag = flag + "F";
    }
  });
  return flag;
}