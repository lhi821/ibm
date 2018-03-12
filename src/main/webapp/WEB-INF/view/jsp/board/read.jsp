<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					<div class="col-xs-12">
					<!-- read post form -->
						<form id="readPostForm" action="#" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type="hidden" name="id" value="${resultMap.result.id}"/>
										
										<div class="col-xs-6 text-left samll" style="padding:0px;">
											<i class="far fa-bookmark grayscale cursor"></i>
											<span class="small">&nbsp;&nbsp;</span> 
											<i class="far fa-file-alt grayscale"></i>
						        	<span id="readPostNumber" class="small">${resultMap.result.id} &nbsp;</span>
						        	<i class="fas fa-user-circle grayscale cursor"></i>
						        	<span id="readPostAuthor" class="small">${resultMap.result.author} TEST &nbsp;</span>
											
										</div>
										<div class="col-xs-6 text-right samll" style="padding:0px;">
											<i class="fas fa-sync-alt grayscale fa-sm cursor"></i>
											<span class="small">&nbsp;</span> 
						        	<i class="far fa-clock grayscale"></i>
						        	<span id="readPostRegDate" class="small">${resultMap.result.reg_date}&nbsp;</span>
						        	<i class="fas fa-clock grayscale"></i>
						        	<span id="readPostModDate" class="small">${resultMap.result.mod_date}&nbsp;</span>
						        </div>
								
			        
			        <div class="form-group">
								<label for="readPostTitle">Title:</label>
		  					<input readonly type="text" class="form-control" id="readPostTitle" name="title" value="${resultMap.result.title}">
							</div>
							<div class="form-group">
							  <label for="readPostContents">Contents:</label>
							  <textarea readonly class="form-control" rows="10" id="readPostContents" name="contents">${resultMap.result.contents}</textarea>
							</div> 
							<div class="text-right">
								<div class="form-group">
				        	<button type="button" class="btn btn-default back">back</button>
				        	<button id="editBtn" class="btn" type="button" class="btn">Edit</button>
				        </div>
			        </div>
						</form>

					</div>
					
				</div>
			</div>
		
		<!-- footer -->		
		<div class="row">
			<div class="container">
				<jsp:include page="../layout/footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
</div>
	
</body>
<!-- JS -->
<script type="text/javascript" src="/js/board/update.js"></script>
</html>
