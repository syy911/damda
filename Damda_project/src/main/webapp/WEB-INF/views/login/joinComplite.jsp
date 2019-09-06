<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/resources/template/head.jsp"/>
	<style type="text/css">
		
	</style>
	<script type="text/javascript">
		
	</script>
</head>
<body>
	<jsp:include page="/resources/template/header.jsp"/>
	
	<div class="row userDataChk">
		<div class="col-md-8 col-md-offset-2">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td>${userInfo.userid}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${userInfo.username}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${userInfo.userbirth}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${userInfo.userphone}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${userInfo.useraddr1} ${userInfo.useraddr2}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${userInfo.useremail}</td>
				</tr>
			
			</table>
		</div>
	</div>
	
	<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>