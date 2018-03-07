/**
 * 
 */
$(document).ready(function(){
  
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
    if ($("#sidenav01 .submenu").eq(i).attr("class") == "a cursor collapsed submenu" || $("#sidenav01 .submenu").eq(i).attr("class") == "a cursor submenu collapsed"){
      //접힙
      flag = flag + "F";
    }else{
      //펼침
      flag = flag + "T";
    }
  });
  return flag;
}