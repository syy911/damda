<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 	<jsp:include page="/resources/template/head.jsp"/>
 	<style type="text/css">
 	.outline {
 	border: thin solid rgb(200,200,200);
 	}
	#edge01 {
	margin-top: 100px;
	margin-bottom: 100px; 
	}
	#loginWrap {
	margin-top: 80px;
	margin-bottom: 80px;
	}
	#joinWrap { 
	margin-top: 80px;
	margin-bottom: 80px;
	} 
	#joinWrap p{
	border-top:thin solid rgb(200,200,200);
	border-bottom:thin solid rgb(200,200,200);
	padding: 20px;
	}
	#loginBtn { 
	width:77px;  
	margin-top: -3px;
	
	}
	#saveIdCheck>a{
	color:black;
	cursor:pointer;
	}
	#joinBtn {
	margin-top: -3px;
	}
	#saveLock {
	width: 20px;
 	height: 18px;
	}
	#bar,#bar2 {
	border-top:thin solid rgb(200,200,200);
	margin-bottom: 35px;
	}
	#orderHistoryWrap {
	margin-top:60px;
	margin-bottom: 60px;
	}
	#orderHistoryWrap div {
	padding: 0px;
	}
 	</style>
 	<script type="text/javascript">
 	$(document).ready(function(){
 		resized2();
 	//jsp 재활용 로그인 & 주문조회
 		var url = window.location.pathname;
	 	var location = url.substring(url.lastIndexOf("/")+1);
	 	if(location =='login') {
			console.log(location);
			$('#bar').css('display','none');	
			$('#orderHistoryWrap').css('display','none');
			$('#bar2').css('display','none');
	 	}else if(location =='orderHistory') {
	 		$('#bar2').css('display','none');
	 	}else if(location =='noMember') {
	 		$('#bar').css('display','none');
	 		$('#orderHistoryWrap').css('display','none');
	 	}

	 	//비밀번호 틀렸을 시 나오는 팝업창
 		$('#loginErrDiv').hide();
	 	var loginErr = $('#loginErrDiv').text();
	 	if(loginErr == "loginErr"){
	   	    var loginErrModal = $("#loginErrModal");
	  	  		loginErrModal.modal("show").css('top', '35%');
		  	    $("#loginerrOk").click(function(){
		  	    	loginErrModal.modal("hide");
		  	}); 
	 	}

	 	$('#joinBtn').click(function(){
			window.href="/login/join"
		});
 	 
 	});//document.ready function end************************************************************** 	
 	
 	//창크기 514px보다 작아졌을 때 폰트크기 고정(테이블 안부셔지게)
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
         var windowWidth = $(window).width();
         if(windowWidth < 1080) { 
         	$('#joinWrap').css('display','none'); 
         	$("#loginWrap button:eq(1)").remove();
         	$("#loginBtnSection").append("<button id='joinBtn' class='btn btn-default'>회원가입</button>");
         	$("#loginWrap").attr('class','col-md-offset-4 col-sm-offset-3 col-xs-offset-2 col-md-4 col-sm-6 col-xs-8');
			$("#saveIdCheck").css('font-size','12.5px'); 
         }else{  
        	$("#loginWrap button:eq(1)").remove();
         	$('#joinWrap').css('display','block');
         	$("#loginWrap").attr('class','col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col-md-5 col-sm-5 col-xs-5');
         } 
    } 
 	</script>
</head> 
<body>
    <!-- ***********************************header start*********************************** -->
	<jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
	<div class="container-fluid text-center">
	    <div class="row">
	    	<div class="col-md-offset-1 col-md-10">
		    	<div class="col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col-md-10 col-sm-10 col-xs-10">
		    		<div id="edge01" class="col-md-12 col-sm-12 col-xs-12 outline">
		    			<!-- 로그인 ---------------------------------------->
		    			<div id="loginWrap" class="col-md-offset-1 col-sm-offset-1 col-xs-offset-1 col-md-5 col-sm-5 col-xs-5 text-left" >
			    		<form id="login" action="loginErr" method="post">
				    		<div class="form-group">
							    <input type="text" class="form-control" id="id" name="id" placeholder="Id"/>
							</div>
							<div class="form-group">
							    <input type="password" class="form-control" id="password" name="password" placeholder="Password"/>
							</div>
							<div id="loginBtnSection" class="form-group"> 
								<button id="loginBtn" type="submit" class="btn btn-default">로그인</button>
							</div>
							<div id="saveIdCheck" class="col-md-12 col-sm-12 col-xs-12 text-left">
								<input type="checkbox" id="saveId" class="custom-control">&nbsp;
								<label for="saveId">아이디 저장</label>
								<img id="saveLock" src="/resources/icon/save_lock.png"/>&nbsp;
								<label>보안접속</label><br />
							  	<a href="fgid"><span>아이디찾기</span></a>&nbsp;&nbsp;
							  	<a href="fgpw"><span>비밀번호찾기</span></a>
							</div> 
							<div id="loginErrDiv">${loginErr}</div>
						</form>
						</div>
						<!-- 로그인 끝 ---------------------------------------->
					 	<div id="joinWrap" class="col-md-5 col-sm-5 col-xs-5">
			    				<p><span>회원가입을 하시면 다양하고 특별한<br />
			    				혜택이 준비되어 있습니다.</span></p>
							  <button id="joinBtn"  type="button" class="btn btn-default">회원가입</button>
						</div> 
						<!-- 비회원 배송조회 ---------------------------------------->
						<div id="bar" class="col-md-12 col-sm-12 col-xs-12 text-left">
						<br />
						<p><span>비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.</span></p>
						</div>
						 <div id="orderHistoryWrap" class="col-md-offset-4 col-sm-offset-3 col-xs-offset-2 col-md-4 col-sm-6 col-xs-8">
			    		<form id="orderHistory" class="form-horizontal">
						  <div class="form-group">
						    <label for="orderer" class="col-sm-4 control-label">주문자명</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="orderer" name="orderer">
						    </div>
						  </div> 
						  <div class="form-group">
						    <label for="orderNum" class="col-sm-4 control-label">주문번호</label>
						    <div class="col-sm-3">
						      <input type="text" class="form-control" id="orderNum01" name="orderNum01">
						    </div>
						    <div class="col-sm-2">
						    <span>-</span>
						    </div>
						    <div class="col-sm-3">
						      <input type="text" class="form-control" id="orderNum02" name="orderNum02">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="orderPw" class="col-sm-4 control-label">비회원주문 비밀번호</label>
						    <div class="col-sm-8">
						      <input type="text" class="form-control" id="orderPw" name="orderPw">
						    </div>
						  </div>
						  <div class="form-group">
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="button" class="btn btn-default">주문조회</button>
						    </div>
						  </div>
						</form>
						</div>
						<!-- 비회원 구매 ---------------------------------------->
						<div id="bar2" class="col-md-12 col-sm-12 col-xs-12 text-justify">
						<br /><br />
						<p class="col-xs-4"><span>비회원도 상품구매가 가능하나 다양한 회원혜택에서 제외됩니다.</span></p>
						<button type="button" id="noMemberBtn" class="btn btn-default col-sm-offset-4 col-xs-offset-4 col-sm-4 col-xs-4">비회원 구매</button>
						</div>
						<!-- 비회원 구매 끝 ---------------------------------------->
					</div> 
		    	</div>  
		    </div> 
		</div> 
	</div>
	<!-- ----------------------------------------------------------------------------------- -->
	<!-- 로그인 틀렸을 시 -->
	<div class="modal" id="loginErrModal" style="display:none; z-index: 1050;">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
		            <br />
		            <p style="color:darksalmon; font-size:16px;">로그인 오류.</p> 
		            <br/>
		            <p>아이디와 비밀번호를 다시 확인해주세요.</p>
					<br />
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" id="loginerrOk">확인</button>
		            </div>
	       	 	</div>
	    	</div>
		</div>
	</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>
				