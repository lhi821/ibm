<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/css/board/index.css">

</head>
<body>

  <!-- Navbar -->
  <jsp:include page="../layout/navbar.jsp"></jsp:include>
  
  <!-- sidebar -->
  <jsp:include page="../layout/sidebar.jsp"></jsp:include>
  
  <!-- posts area -->
  <div class="col-xs-10 affix-content">
    <div class="container affix-container">
      <div class="row">
        <div class="container">
        
		      <div class="col-xs-12" style="padding:0px;">
		      	<div class="col-lg-9 col-md-8 col-xs-6"></div>
				  	<div class="col-lg-3 col-md-4 col-xs-6">
						  <div class="panel panel-default" style="margin-bottom:20px;">
							  <div class="panel-body text-center" style="padding:2px;">
								    <label class="radio-inline">
								      <input id="displayNew" type="radio" name="radioName">New
								    </label>
								    <label class="radio-inline">
								      <input id="displayOld" type="radio" name="radioName">Old
								    </label>
								    <label class="radio-inline">
								      <input id="displayHid" type="radio" name="radioName">Hit
								    </label>
							  </div> 
						  </div>
					  </div>
				  </div>
            <c:choose>
              <c:when test="${veiwType eq 'L'}">
                <table class="table table-hover small">
                  <thead>
                    <tr>
                      <th scope="col">Title</th>
                      <th scope="col">Contents</th>
                      <th scope="col">Author</th>
                      <th scope="col">Last modified date</th>
                    </tr>
                  </thead>
                  <tbody>

                  <c:forEach var="item" varStatus="status" items="${resultList}" step="1" begin="0">
                    <tr id="${item.meetingNoteId}" class="cursor tableContent">
                      <td>${item.title}</td>
                      <td class='contents-css'>${item.contents}</td>
                      <td>${item.regMemberId}</td>
                      <td>${item.modDate}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </c:when>
              <c:otherwise>

								<c:forEach var="item" varStatus="status" items="${resultList}" step="1" begin="0">
								  <div class="col-lg-3 col-md-4 col-xs-6"> 
								    <div id="${item.meetingNoteId}" class="panel panel-default box">
								    	<div class="ribbon content"><span>${item.meetingNoteNm}</span></div> 
								      <div class="panel-heading content">
								        <div class="text-left small">${item.title}</div>
								      </div>
								      <div class="panel-body content box-contents panel-min-height">
								        <div class="text-left small contents-css">${item.contents}</div>
								      </div>
								      <div class="panel-footer">
								        <div class="row small">
								          <div class="col-xs-4 text-left small padding-right-small">
								
								            <i class="fas fa-user-circle grayscale"></i>${item.regMemberId}</div>
								          <div class="col-xs-8 text-right small padding-left-small">
								            <c:choose>
								              <c:when test="${item.modDate eq item.regDate}">
								                <i class="far fa-clock grayscale"></i> ${item.regDate}
								              </c:when>
								              <c:otherwise>
								                <i class="fas fa-clock grayscale"></i> ${item.modDate}
								              </c:otherwise>
								            </c:choose>
								          </div>
								        </div>
								        <hr class='panel-hr'>
								        <div class="row small">
								        	<div class="col-xs-12 bottom-hashTag small">
								          	${item.hashTag}
								        	</div>
								        </div>       
								      </div>
								    </div>
								  </div>
								</c:forEach>
              </c:otherwise>
            </c:choose>
        </div>
      </div>
      
      <!-- open new post button -->
      <div class="row">
        <div class="container">
          <div class="col-xs-12 text-right">
            <button id="newPostBtn" type="button" class="btn btn-default">
              <i class="fas fa-pencil-alt grayscale"></i>
            </button>
          </div>
        </div>
      </div>  
      
      <div class="row">
        <div class="container">
          <div class="col-xs-12 text-center">
            <div class="pagination">
						  <a href="#">&laquo;</a>
						  <a href="#" class='active'>1</a>
						  <a href="#">2</a>
						  <a href="#">3</a>
						  <a href="#">4</a>
						  <a href="#">5</a>
						  <a href="#">&raquo;</a>
						</div>
        </div>
      </div>  
      
	    <!-- footer -->   
	    <div class="row small-bottom">
	      <div class="container">
	        <jsp:include page="../layout/footer.jsp"></jsp:include>
	      </div>
	    </div>
	  </div>
	</div>
</div>

</body>
<!-- JS -->
<script type="text/javascript" src="/js/board/index.js"></script>

</html>