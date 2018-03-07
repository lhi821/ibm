<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<input type="hidden" id="sideBar" name="sideBar" value="${sideBar}">
<input type="hidden" id="subMenu" name="subMenu" value="${subMenu}">
<div class="row affix-row">
    <div class="col-xs-2 affix-sidebar" style="visibility:hidden;">
		<div class="sidebar-nav">
  <div class="navbar navbar-default" role="navigation">
<!--     <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-navbar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
    </div> -->
    <div class="navbar-collapse collapse sidebar-navbar-collapse">
      <ul class="nav navbar-nav" id="sidenav01" style="overflow: hidden;">
        <li id="sidebarFold" class="active">
          <a class="cursor" id="controlPanel">
          	<big id="foldTitle">Sidebar</big>
	          	<c:choose>
						    <c:when test="${sideBar eq 'T'}">
						    	<span id="fold" class="fas fa-caret-left fa-lg grayscale pull-right"></span>&nbsp;
						    </c:when>
						    <c:otherwise>
						    	<span id="fold" class="fas fa-caret-right fa-lg grayscale pull-right"></span>&nbsp;
						    </c:otherwise>
							</c:choose>
          </a>
        </li>
        <li>
          <a class="a cursor submenu collapsed" data-toggle="collapse" data-target="#toggleDemo0" data-parent="#sidenav01">
          <span class="fas fa-star"></span> Favorite <span class="caret pull-right"></span>
          </a>
          <div class="collapse" id="toggleDemo0" style="height: 0px;">
            <ul class="nav nav-list">
 							<c:forEach var="i" begin="0" varStatus="status" end="1">
	            	<li><a class="a cursor small"><span class="far fa-folder"></span> project ${status.count}<span class="fas fa-star fa-xs pull-right"></span></a></li>
	            </c:forEach>
	            <c:forEach var="i" begin="0" varStatus="status" end="1">
	            	<li><a class="a cursor small"><span class="far fa-file-alt"></span> doc ${status.count}<span class="fas fa-star fa-xs pull-right"></span></a></li>
	            </c:forEach>
	             <c:forEach var="i" begin="0" varStatus="status" end="1">
	            	<li><a class="a cursor small"><span class="fab fa-slack-hash"></span> tag ${status.count}<span class="fas fa-star fa-xs pull-right"></span></a></li>
	            </c:forEach>
            </ul>
          </div>
        </li>
        
        <!-- TODO -->
      	<c:forEach var="i" begin="0" varStatus="status" end="2">
	        <li>
	          <a class="a cursor submenu collapsed" data-toggle="collapse" data-target="#toggleDemo${status.count}" data-parent="#sidenav01">
	          <span class="fas fa-folder"></span> Project ${status.count} <span class="caret pull-right"></span>
	          </a>
	          <div class="collapse" id="toggleDemo${status.count}" style="height: 0px;">
	            <ul class="nav nav-list">
	              <li><a class="a cursor small"><span class="far fa-folder"></span> Submenu ${status.count}.1</a></li>
	              <li><a class="a cursor small"><span class="far fa-folder"></span> Submenu ${status.count}.2</a></li>
	              <li><a class="a cursor small"><span class="far fa-folder"></span> Submenu ${status.count}.3</a></li>
	            </ul>
	          </div>
	        </li>
			 	</c:forEach>
        <li><a class="a cursor" class="curosr" href="/analysis/index"><span class="fas fa-chart-pie"></span> Analysis</a></li>
        <li><a class="notthing"></a></li>
      </ul>
      </div>
    </div>
  </div>
</div>
</body>
</html>