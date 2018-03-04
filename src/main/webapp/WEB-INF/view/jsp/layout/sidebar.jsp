<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/sidebar.css">
<!-- JS -->
<script src="/js/sidebar/sidebar.js"></script>

</head>
<body>
<div class="row affix-row">
    <div class="col-xs-2 affix-sidebar">
		<div class="sidebar-nav">
  <div class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <span class="visible-xs navbar-brand">Sidebar menu</span>
    </div>
    <div class="navbar-collapse collapse sidebar-navbar-collapse">
      <ul class="nav navbar-nav" id="sidenav01" style="overflow: hidden;">
        <li id="sidebarFold" class="active">
          <a id="controlPanel" href="#">
          	<big id="foldTitle">Sidebar</big>
          	<span id="fold" class="fas fa-caret-left fa-lg grayscale pull-right"></span>&nbsp;
          </a>
        </li>
        <li>
          <a class="a" href="#" data-toggle="collapse" data-target="#toggleDemo" data-parent="#sidenav01" class="collapsed">
          <span class="glyphicon glyphicon-cloud"></span> Submenu 1 <span class="caret pull-right"></span>
          </a>
          <div class="collapse" id="toggleDemo" style="height: 0px;">
            <ul class="nav nav-list">
              <li><a class="a" href="#">Submenu1.1</a></li>
              <li><a class="a" href="#">Submenu1.2</a></li>
              <li><a class="a" href="#">Submenu1.3</a></li>
            </ul>
          </div>
        </li>
        <li class="active">
          <a class="a" href="#" data-toggle="collapse" data-target="#toggleDemo2" data-parent="#sidenav01" class="collapsed">
          <span class="glyphicon glyphicon-inbox"></span> Submenu 2 <span class="caret pull-right"></span>
          </a>
          <div class="collapse" id="toggleDemo2" style="height: 0px;">
            <ul class="nav nav-list">
              <li><a class="a" href="#">Submenu2.1</a></li>
              <li><a class="a" href="#">Submenu2.2</a></li>
              <li><a class="a" href="#">Submenu2.3</a></li>
            </ul>
          </div>
        </li>
        <li><a class="a" href="#"><span class="glyphicon glyphicon-lock"></span> Normalmenu</a></li>
        <li><a class="a" href="#"><span class="glyphicon glyphicon-calendar"></span> WithBadges</a></li>
        <li><a class="a" href=""><span class="glyphicon glyphicon-cog"></span> PreferencesMenu</a></li>
      </ul>
      </div><!--/.nav-collapse -->
    </div>
  </div>
</div>
</body>
</html>