<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/resources/template/head.jsp"/>
	<style type="text/css">
		/*border start*/
		#fgPwContents{
			margin:80px 0px 100px 0px;
		}
		#fgborder{
			border:1px solid #999999;
		}
		/*border end*/
		/*sub start*/
		#fgIdSub{
			margin:40px 0px 50px 0px;
			text-align:center;
			font-size:20px;
		}
		/*sub end*/
		/*content start*/
		/*버튼*/
		#btnOk{
			border:2px solid #908b9d;
			border-radius: 4px 4px 4px 4px;
			background-color:white;
			text-align:center;
			width:95%;
			margin:10px 0px;
			float:right;
			font-size:15px;
			color:black;
			text-decoration:none;
		}
		#btnOk>div{
			margin:10px auto;
		}
		/*비밀번호 찾기*/
		#changePW{
			text-align:right;
		}
		#changePW>div{
			margin:10px 0px 30px 0px;
		}
		#changePW>div>a{
			color:black;
		}
		/*content end*/
	</style>
	<script type="text/javascript">
		$(function(){
			var url=window.location.pathname;
			var location = url.substring(url.lastIndexOf("/")+1);
			if(location == 'fnid'){
				$('#pw').parent().parent().css('display','none');
			}else if(location == 'fnpw'){
				$('#fgIdSub').html('비밀번호');
				$('#fgPw').css('display','none');
			}
		});
	</script>
</head>
<body>
	<jsp:include page="/resources/template/header.jsp"/>
	<div id="fgPwContents">
		<div class="row">
			<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-8 col-xs-offset-2">
				<div class="col-md-10 col-md-offset-1" id="fgborder">
					<div class="col-md-10 col-md-offset-1">
						<!-- sub start -->
						<div class="row">
							<div id="fgIdSub">아이디</div>
						</div>
						<!-- sub end -->
						<!-- content start -->
						<div class="row">
							<div class="col-xs-4 fgIdPwInput">이름</div>
							<input type="text" name="name" id="name" class="col-xs-8 fgIdPwInput" value="${loginBean.get('username') }" readonly="readonly"/>
						</div>
						<br/>
						<div class="row">
							<div class="col-xs-4 fgIdPwInput">아이디</div>
							<input type="text" name="name" id="name" class="col-xs-8 fgIdPwInput" value="${loginBean.get('userid') }" readonly="readonly"/>
						</div>
						<div>
							<br/>
							<div class="row">
								<div class="col-xs-4 fgIdPwInput">비밀번호</div>
								<input type="text" name="pw" id="pw" class="col-xs-8 fgIdPwInput" value="${loginBean.get('userpw') }" readonly="readonly"/>
							</div>
						</div>
						<br/><br/>
						<div class="row" >
							<a href="/login/" id="btnOk"><div>로그인 하기</div></a>
						</div>
						<div class="row" id="changePW">
							<div>
								<a href="fgpw" id="fgPw">비밀번호 찾기</a>
							</div>
						</div>
						<!-- content end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>