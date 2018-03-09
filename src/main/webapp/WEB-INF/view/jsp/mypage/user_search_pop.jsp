<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 검색</title>
<style>

</style>
</head>
<body>
	<div class="modal fade" id="userSearchPop" role="dialog">
  		<div class="modal-dialog modal-lg" role="document">
    		<div class="modal-content">
      			<div class="modal-header" style="">
       				<h4 class="modal-title" id="">사용자 검색</h4>
      			</div>
	     		 <div class="modal-body">
	        		<div class="userSearch"> <!--  class="userSearch popupSearch" -->
	        			<div class="container-fluid">
	        				<div class="row">
								<div class="col-xs-3 form-inline">
									<label for="inputdefault">회사</label>
									<select class="selectpicker" id="cmpyOpt" name="cmpyOpt" data-width="150px"><!-- onChange="return false;" -->
										<option value="all">전체</option>
										<option>한화</option> 
										<option>아모레</option> 
										<option>현대제철</option> 
										<option>신한</option> 
										<option>ABL</option>
									</select>
								</div>
								<div class="col-xs-3 form-inline">
									<label for="inputdefault">직위</label>
				        			<select class="selectpicker" id="officeOpt" name="officeOpt" data-width="150px"><!-- onChange="return false;" -->
										<option value="all">전체</option>
										<option>사원</option> 
										<option>과장</option> 
										<option>부장</option>
										<option>실장</option>  
										<option></option> 
									</select>
								</div>
								<div class="col-xs-4 form-inline">
									<label for="inputdefault">이름</label>
									<input type="text" class="form-control" id="userName" name="userName" data-width="100px"><!-- onChange="return false;" -->
								</div>
								<div class="col-xs-2 form-inline" >
									<button class="btn btn-primary">검색</button><!--  onClick="userSearch()" -->
								</div>
	        				</div> 
	        		</div>
	        	</div>
		        
		        <hr />
	        	 
        		<div class="userSearchResult">
        			<div class="container-fluid" style="padding-bottom: 20px;">
        				<div class="row-fluid">
    						<div class="col-xs-5" style="height:300px; border:2px solid grey; overflow:auto;">
    							<!-- TODO 총 몇 명인지 체크한 사람 수 && 전체 선택 
    							<div class="selectText">
									<p>총 <b><span id="selectedNum">0</span>명</b>이 대상자로 지정되었습니다.</p>
										<input type="checkbox" id="rightSelectAll"/><label for="rightSelectAll">전체</label>
								</div>  
    							<ul class="list-group">
								
								</ul>
								-->
								<!-- TODO 그냥 테이블 row 클릭해도 체크박스 클릭 -->
      							<table class="table table-hover table-fixed"> <!-- table-striped -->
    								<thead>
      									<tr>
      										<th></th>
        									<th style="text-align:center;">회사</th>
									        <th style="text-align:center;">직위</th>
									        <th style="text-align:center;">이름</th>
      									</tr>
    								</thead>
    								<tbody>
									      <tr>
									        <td><input type="checkbox"></td>
									        <td>John</td>
									        <td>Doe</td>
									        <td>john@example.com</td>
									      </tr>
									      <tr>
									      	<td><input type="checkbox"></td>
									        <td>Mary</td>
									        <td>Moe</td>
									        <td>mary@example.com</td>
									      </tr>
									      <tr>
									      	<td><input type="checkbox"></td>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									      <tr>
									      	<td><input type="checkbox"></td>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									      <tr>
									      	<td><input type="checkbox"></td>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									      <tr>
									      	<td><input type="checkbox"></td>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									      <tr>
									      	<td><input type="checkbox"></td>
									        <td>July</td>
									        <td>Dooley</td>
									        <td>july@example.com</td>
									      </tr>
									    </tbody>
									  </table>
    						</div>
    						<div class="col-xs-2" style="padding-top: 100px;">
    							<button type="button" class="btn btn-default btn-block" id="moveRight" name="moveRight" onClick="moveToRight()">&gt;</button>
								<button type="button" class="btn btn-default btn-block" id="moveLeft" name="moveLieft" onClick="moveToLeft()">&lt;</button>
    						</div>
   							 <div class="col-xs-5" style="height:300px; border:2px solid grey;">
   							 	<ul class="list-group">
								  
								</ul>
						      
						   	 </div>
  						</div>
					</div>
       			</div>
	        		
	        	

	      		<div class="modal-footer" style="text-align: center;">
	        		<button type="button" class="btn btn-default">적용</button>
	        		<button type="button" class="btn btn-danger">취소</button>
	     		</div>
    		</div>
	</div>
</div>
</body>
</html>