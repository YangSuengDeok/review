<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
</head>
<body>
<div class="modal-body">
    				<form action="reportAction.jsp" method="post">
    					<div class="form-group">
    						<label>신고 제목</label>
    						<input type="text" name="reportTitle" class="form-control" maxlength="30">
    					</div>
    					<div class="form-group">
    						<label>신고 종류</label>
    						<select name="reportDanger">
    							<option value="유해물 정보 신고">유해물 정보 신고</option>
    							<option value="저작권 침해 신고">저작권 침해 신고</option>
    							<option value="명예 훼손 신고">명예 훼손 신고</option>
    							<option value="유해물 정보 신고">도용 정보 신고</option>
    						</select>
    					</div>
    					<div class="form-group">
    						<label>신고 내용</label>
    						<textarea name="reportContent" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
    					</div>
    					<div class="modal-footer">
    						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
    						<button type="submit" class="btn btn-danger">신고하기</button>
    					</div>
    				</form>
    			</div>
    			
<script src="./js/jquery.min.js"></script>
<script src="./js/pooper.js"></script>
<script src="./js/bootstrap.min.js"></script>
</body>
</html>