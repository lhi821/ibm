/**
 * 
 */
  
$( document ).ready(function() {
  
  var folded = false;
  var movePx = $(".affix-sidebar").width() - 35;
  var orignSideBarHeight = $("#sidebarFold").height();
  var orign_ffix_sidebar_width = $(".affix-sidebar").width();
  var orign_affix_content_width = $(".affix-content").width();
  var orign_affix_container_width = $(".affix-container").width();
  
  $("#controlPanel").click(function() {
    if (folded == false){
      $("#sidenav01 li").hide();
      $("#sidebarFold").show();
      $("#foldTitle").hide();
      $("#sidebarFold").height(orignSideBarHeight);
      
      $(".affix-sidebar").animate({width: $(".affix-sidebar").width() - movePx + "px"},{ complete: function(){
        $("#fold").removeClass("fa-caret-left").addClass("fa-caret-right");
      }});      
      $(".affix-content").animate({width: $(".affix-content").width() + movePx + "px"},{ complete: function(){
      }});
      $(".affix-container").animate({width: $(".affix-container").width() + movePx + "px"},{ complete: function(){
      }});
      
      folded = true;

    }else{
      $(".affix-sidebar").animate({width: orign_ffix_sidebar_width + "px"},{ complete: function(){
        $("#fold").removeClass("fa-caret-right").addClass("fa-caret-left");
        
        $("#sidenav01 li").show();
        $("#foldTitle").show();
        $("#sidebarFold").height(orignSideBarHeight);
      }});      
      $(".affix-content").animate({width: orign_affix_content_width + "px"},{ complete: function(){
      }});
      $(".affix-container").animate({width: orign_affix_container_width + "px"},{ complete: function(){
      }});
      
      folded = false;
    }
  });
});

