/**
 * 
 */
$( document ).ready(function() {
  
  //sebmenu 갯수 별 접힘상태
  if($("#subMenu").val() == ""){
    var times = $('.submenu').length;
    $("#subMenu").val("F".repeat(times));
  }else{
    var flag = $("#subMenu").val();
    var times = $('.submenu').length;
    var flagLength = $("#subMenu").val().length;
    
    for (var i=0; i < flagLength; i++) {
      if (flag[i] == "T"){
        $("#sidenav01 .submenu").eq(i).trigger('click');
      }
    }
  }
  
  var folded = false;
  var movePx = $(".affix-sidebar").width() - 40;
  var orignSideBarHeight = $("#sidebarFold").height();
  var originConPanHeight = $("#controlPanel").height();
  var orign_ffix_sidebar_width = $(".affix-sidebar").width();
  var orign_affix_content_width = $(".affix-content").width();
  var orign_affix_container_width = $(".affix-container").width();
  
  if ($("#sideBar").val() == "F"){
    $("#sidenav01 li").hide();
    $("#sidebarFold").show();
    $("#foldTitle").text(" ");
    $("#sidebarFold").height(orignSideBarHeight);
    $("#controlPanel").height(originConPanHeight);
    
    $(".affix-sidebar").css("width", $(".affix-sidebar").width() - movePx + "px");
    $(".affix-content").css("width", $(".affix-content").width() + movePx + "px");
    $(".affix-container").css("width", $(".affix-container").width() + movePx + "px");
    
    $(".affix-sidebar").css("visibility", "visible");
   
    folded = true;
  }else{
    $(".affix-sidebar").css("visibility", "visible");
    
    folded = false;
  }
  
  
  
  $("#controlPanel").click(function() {
    //접기
    if (folded == false){
      $("#sidenav01 li").hide();
      $("#sidebarFold").show();
      $("#foldTitle").text(" ");
      $("#sidebarFold").height(orignSideBarHeight);
      $("#controlPanel").height(originConPanHeight);
      
      $(".affix-sidebar").animate({width: $(".affix-sidebar").width() - movePx + "px"},{ complete: function(){
        $("#fold").removeClass("fa-caret-left").addClass("fa-caret-right");
        $("#sidebarFold").height(orignSideBarHeight);
        $("#controlPanel").height(originConPanHeight);
      }});      
      $(".affix-content").animate({width: $(".affix-content").width() + movePx + "px"},{ complete: function(){
      }});
      $(".affix-container").animate({width: $(".affix-container").width() + movePx + "px"},{ complete: function(){
      }});
      
      folded = true;
      $("#sideBar").val("F");

    }else{
      //펴기
      $(".affix-sidebar").animate({width: orign_ffix_sidebar_width + "px"},{ complete: function(){
        $("#fold").removeClass("fa-caret-right").addClass("fa-caret-left");
        
        $("#sidenav01 li").show();
        $("#foldTitle").text("Sidebar");
        $("#sidebarFold").height(orignSideBarHeight);
        $("#controlPanel").height(originConPanHeight);
      }});      
      $(".affix-content").animate({width: orign_affix_content_width + "px"},{ complete: function(){
      }});
      $(".affix-container").animate({width: orign_affix_container_width + "px"},{ complete: function(){
      }});
      
      folded = false;
      $("#sideBar").val("T");
    }
  });
  
  $(".submenu").click(function() {
    
    if($(this).children("svg").attr("class") == "svg-inline--fa fa-folder fa-w-16"){
      $(this).children("svg").removeClass("fa-folder").addClass("fa-folder-open");
    }else if($(this).children("svg").attr("class") == "svg-inline--fa fa-folder-open fa-w-18"){
      $(this).children("svg").removeClass("fa-folder-open").addClass("fa-folder");
    }
    
    var flag = $("#subMenu").val();
    var flagLength = $("#subMenu").val().length;
    var prefix = flag.substring(0,$(this).parent().index()-1);
    var subfix = flag.substring($(this).parent().index(), flagLength);
    
    //펼침
    if ($(this).attr("class") == "a cursor collapsed submenu" || $(this).attr("class") == "a cursor submenu collapsed") {
      $("#subMenu").val(prefix+"T"+subfix);
    }
    //접힘
    else{
      $("#subMenu").val(prefix+"F"+subfix);
    }
  });
});

