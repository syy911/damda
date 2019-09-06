<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date,java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	
<head>
   <meta charset="UTF-8">
   <jsp:include page="/resources/template/head.jsp"/>
   <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
   <script type="text/javascript">
	
 	
	
 	//주소찾기 팝업
   function findJuso(){
		var pop = window.open("<%="http://localhost:8080/login/"%>popup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 	
	}
		
   function jusoCallBack(roadAddrPart1,addrDetail, zipNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.joinform.useraddr1.value = roadAddrPart1;
		document.joinform.useraddr2.value = addrDetail;
		document.joinform.userpostnum.value = zipNo;
	
		
	}

   $(function() {
	   $( "#userbirth" ).datepicker({
	     dateFormat: 'yy.mm.dd',
	     prevText: '이전 달',
	     nextText: '다음 달',
	     monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     dayNames: ['일','월','화','수','목','금','토'],
	     dayNamesShort: ['일','월','화','수','목','금','토'],
	     dayNamesMin: ['일','월','화','수','목','금','토'],
	     showMonthAfterYear: true,
	     changeMonth: true,
	     changeYear: true,
	     yearSuffix: '년'
	   });
	 });

	
	
	$(document).ready(function(){
		$('#userid').focus();
		$('#findAddr').on("click", function(){
			findJuso();
		});
		
		//회원가입 유효성 검사
		validation();

		

		//비밀번호 입력 후 확인을 마치면 일치 확인
		$('#userpw').focus(function(){
			$('#userpwchk').blur(function(){
	
				passwordCheck();
	
			});
		});
			
		$('#userphone').keyup(function(){
			   
		   	//입력한 핸드폰 번호
		   	nowNum=$('#userphone').val();
		
		   	nowNum=$.trim(autoHypenPhone(nowNum));
		
		   	$('#userphone').val(nowNum);
		   	
		 });

	//유효성 검사 
	function validation(){
		//조건식
		var idCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
		var nameCheck = RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}$/);
		var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

		//아이디 체크
		$('#userid').keyup(function(){
			
			if(!idCheck.test($.trim($("#userid").val()))){
				console.log("한글입력시 제거");
				$('#userid').val($('#userid').val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''));
			}
		});


		//이름 체크
		$('#username').keyup(function(){
			if(!nameCheck.test($.trim($("#username").val()))){
				console.log("숫자입력시 제거");
				$('#username').val($('#username').val().replace(/[0-9]/g,''));
			}
		});

		$('#username').focus(function(){
			$('#username').blur(function(){
				if(!nameCheck.test($.trim($("#username").val()))){
					console.log("분리된 한글 삭제, 공백은 입력 가능");
					$('#username').val($('#username').val().replace(/[^A-Za-z|가-힣|\s]/g,''));
				}
			});
		});

		//이메일 체크
		
		
		$('#useremail').focus(function(){
			$('#useremail').keyup(function(){
				if(!emailCheck.test($.trim($("#useremail").val()))){
					console.log("한글입력시 제거");
					$('#useremail').val($('#useremail').val().replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,''));
				}
			});
			
			$('#useremail').blur(function(){
				if(!emailCheck.test($.trim($("#useremail").val()))){
					console.log("잘못된 형식의 이메일주소");
					$('#useremail').focus();
				}
			});
		});
		
	}
	
	//비밀번호 일치여부 확인
	function passwordCheck(){
		var userPw = $('#userpw').val();
		var userPwChk = $('#userpwchk').val();

		if(userPw!=userPwChk){
			$('#pwchk').text('비밀번호가 일치하지 않습니다.');
		}else {
			$('#pwchk').text('비밀번호가 일치합니다.');
		}
		
	};
	
	//핸드폰 번호 하이픈 자동입력
	var nowNum;
	function autoHypenPhone(nowNum){
		   nowNum=nowNum.replace(/[^0-9]/g, '');
		   var phoneNum="";
		   	if(nowNum.length < 4){
			   	return nowNum;
			}else if(nowNum.length < 7){
			   	phoneNum += nowNum.substr(0,3);
			   	phoneNum += '-';
			   	phoneNum += nowNum.substr(3);
			   	return phoneNum;
			}else if(nowNum.length < 11){
		   		phoneNum += nowNum.substr(0,3);
		   		phoneNum += '-';
		   		phoneNum += nowNum.substr(3,3);
		   		phoneNum += '-';
		   		phoneNum += nowNum.substr(6);
			   	return phoneNum;
			}else{
		   		phoneNum += nowNum.substr(0,3);
		   		phoneNum += '-';
		   		phoneNum += nowNum.substr(3,4);
		   		phoneNum += '-';
		   		phoneNum += nowNum.substr(7);
			   	return phoneNum;
		   	}
			return nowNum
	   };
	   
	});


	//아이디 중복체크
	function idchk(){
		var userid = $('#userid').val();

		
		var idlen = $('#userid').val().length;
		if(idlen<5){
			$('#resultchk').css('color','black');
			$('#resultchk').text('5글자 이상 입력해주세요');
		}else{


			$.ajax({
				data:{
					userid:userid
				},
				url : "checkId",
				success: function(data){
					if(data==1){
						$('#resultchk').css('color','red');
						$('#resultchk').text('사용할 수 없는 아이디입니다');
					}else if(data==0){
						$('#resultchk').css('color','blue');
						$('#resultchk').text('사용가능한 아이디');
					}
	
				}
	
			});

		}

		

	};
   
   </script>
   
    <style type="text/css">
    .join-form {
    	border-top: 2px solid darksalmon;
        border-bottom: 2px solid darksalmon;
        margin-bottom:150px;
    }
    
    .join-form label{
    	padding-bottom:5px;
    }
     
    .join-form .form-group:first-child {
    	padding-top:50px;
    }
    
    .join-form .form-group:nth-child(3){
    	padding-bottom:20px;
    }
    
    .join-form .form-group:last-child {
    	padding-top:20px;
    	padding-left:60px;
    	padding-bottom:50px;
    }
    
    .join-form label{
    	text-align:center;
    }
    
    
    </style>
</head>

<body>
   <jsp:include page="/resources/template/header.jsp"/>
   
   <!-- 현재 년도 가져오기 -->
   <%
   		Date date = new Date();
   		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-mm-dd");
   		String strdate = simpleDate.format(date);
   		Calendar cal = Calendar.getInstance();
   		
   %>

    <!-- ***********************************content start*********************************** -->
    <div class="row">
        <div id="content" class="col-md-12">
        
			<div class="container-fluid col-md-8 col-md-offset-2">
			<h2>Dam da. 회원가입</h2> 
			<p>언제나 신선함을 전달하는 Dam da. 만의 혜택을 누려보세요!</p>
			<br/><br/>
			
					<form class="form-horizontal join-form" action="insertUser" name="joinform" id="joinform" method="post">
					  <div class="form-group">
					    <label for="userid" class="col-sm-2 control-label col-md-offset-2" >아이디</label>
							 <div>
							     <div class="col-sm-5 col-md-5 ">
								      <input type="text" class="form-control" id="userid" name="userid" placeholder="영문, 숫자 5-20자" maxlength="20" oninput="idchk()" required >
								      <p id="resultchk"></p>
								</div>
							   
							 </div>
					    </div>
					  <div class="form-group">
					    <label for="userpw" class="col-sm-2 control-label col-md-offset-2">비밀번호</label>
					    <div class="col-sm-5 col-md-5 ">
					      <input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호" maxlength="20" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="userpwchk" class="col-sm-2 control-label col-md-offset-2">비밀번호 확인</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="password" class="form-control" id="userpwchk" placeholder="비밀번호 확인" maxlength="20" required>
					      <p id="pwchk"> </p>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="username" class="col-sm-2 control-label col-md-offset-2">이름</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="text" class="form-control" id="username" name="username" placeholder="이름" maxlength="15" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="userbirth" class="col-sm-2 control-label col-md-offset-2">생년월일</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="text" class="form-control" id="userbirth" name="userbirth" maxlength="10">
						     
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="userphone" class="col-sm-2 control-label col-md-offset-2">연락처</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="tel" class="form-control" name="userphone" id="userphone" placeholder="-없이 입력" maxlength="13" required>
					    </div>
					  </div>
					   <div class="form-group">
					   <label for="useraddr" class="col-sm-2 control-label col-md-offset-2" >주소</label>
					   		<div>
							    <div class="col-sm-3 col-md-2">
								    <input type="text" class="form-control" id="userpostnum" name="userpostnum" placeholder="우편번호" maxlength="6">
								</div>
								 <div class="col-sm-3 col-md-6">
							      <input type="button" name="findAddr" id="findAddr" class="btn btn-default" onClick="findJuso();" value="주소찾기" />
							    </div>
							</div>
						</div>
					<div class="form-group">
							<div class="col-sm-5 col-md-5 col-sm-offset-2 col-md-offset-4">
								<input type="text" class="form-control" id="useraddr1" name="useraddr1" placeholder="주소">
							</div>
					</div>
					<div class="form-group"> 	
						<div class="col-sm-5 col-md-5 col-sm-offset-2 col-md-offset-4">
					     	 	<input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소">
					    	</div>
					  </div>
					  
					   <div class="form-group">
					    <label for="useremail" class="col-sm-2 control-label col-md-offset-2">e-mail</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="email" class="form-control" id="useremail" name="useremail" placeholder="e-mail" maxlength="100">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-5 col-sm-10">
					      <button type="submit" class="btn btn-default" id="joinbtn">가입하기</button>
					    </div>
					  </div>
					</form>
			
			</div>
			
        </div>
    </div>
    <!-- ***********************************content end*********************************** -->



    <!-- ***********************************footer*********************************** -->
    
   <jsp:include page="/resources/template/footer.jsp"/>

</body></html>
