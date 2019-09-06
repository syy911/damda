<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/mypage.css" />
<jsp:include page="/resources/template/head.jsp"/>
<jsp:include page="/resources/template/mypage_head.jsp"/>
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

 	//우편번호 제일 앞자리가 0인 경우 DB에 0이 저장되지 않으므로
	//추가해서 준다
	function postnum(){
		var post = $('#userpostnum').val()
		var leng=post.length;
		if(leng==4){
			$('#userpostnum').val('0'+post);
		}
	};
	
	
	$(document).ready(function(){
		$('#returnbtn').hide();
		$('#editbtn').hide();
		$('#pw').hide();
		$('#findAddr').hide();

		

		postnum();
		 
		//수정버튼 누르기 전엔 form 보더 안보이게
		$('input').removeClass('form-control').css('border-color','transparent').on("focus",function(){$(this).blur();});

		$('#findAddr').on("click", function(){
			findJuso();
		});
		
		//회원가입 유효성 검사
		validation();

		
		
		//잘못된 비밀번호 입력시 오류메세지
		$('#incorrectPw').hide();
		var incorrect = $('#incorrectPw').text();
		
		if(incorrect == "incorrect"){
			var myModal = $("#editErrModal");
  	  		myModal.modal("show").css('top', '35%');
	  	    $("#editErrOk").click(function(){
	  	  		myModal.modal("hide");
	  	    });
		};

		
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
		var nameCheck = RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}$/);
		var emailCheck = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);


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


	//수정하기 버튼 눌렀을 때
	function tryedit(){
			$('#tryeditbtn').hide();
			$('#pw').show();
			$('#findAddr').show();
			$('#returnbtn').show();
			$('#editbtn').show();
			$('input').addClass('form-control').attr('readonly',false).css('border-color','#D8D8D8').off('focus');
			$('#userid').removeClass('form-control').attr('readonly',true).css('border-color','transparent');
			$('#userbirth').removeClass('form-control').attr('readonly',true).css('border-color','transparent');

			 
	};

	   
</script>

<style type="text/css">
        /*content area************************************/
        #content #content_content h3 {
            width: 150px;
        }

        #content #content_content small {
            width: 240px;
        }

        

        #content #content_content input {
            
            margin-bottom: 10px;
        }

        #content #content_content .date_h4 {
            margin-top: 20px;
            color: darksalmon;
        }

        
        /*수정 form css************************/
        
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
    
    .join-form .form-group:nth-child(2){
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
    
    .tryeditbtn,
    .editbtn{
    	background-color:darksalmon;
    	color:white;
    }
    .tryeditbtn:hover,
    .editbtn:hover{
    	background-color:darksalmon;
    	color:white;
    }
    
   .join-form #useraddr1{
   		
   		width:70%
   }
        
        
</style>

</head>

<body>
<jsp:include page="/resources/template/header.jsp"/>
<jsp:include page="/resources/template/mypage_header.jsp"/>
<!-- content start -->
 			<div id="content_aside" class="col-md-offset-2 col-md-2 col-sm-12 col-xs-12">
                <h2>마이페이지</h2>
                <ul>
                    <li>
                        <a href="/mypage/"><p>주문 내역</p></a>
                    </li>
                    <li>
                        <a href="/mypage/jjim"><p>찜</p></a>
                    </li>
                    <li>
                        <a href="/mypage/myrecie"><p>마이 레시피</p></a>
                    </li>
                    <li>
                        <a href="/mypage/qna"><p>문의 내역</p></a>
                    </li>
                    <li class="active_menu">
                        <a href="/mypage/userinfo"><p class="active_menu">개인 정보 수정</p></a>
                    </li>
                </ul>
            </div>
            
            
            <div id="content_content" class="col-md-6">
               	<h3>개인정보수정</h3><small>비밀번호를 입력하시면 수정됩니다.</small>
                <!-- 내용 입력 -->
                <div> 
                	<form class="form-horizontal join-form" action="updateUser" name="joinform" id="joinform" method="post">
					  <div class="form-group">
					    <label for="userid" class="col-sm-2 control-label col-md-offset-2" >아이디</label>
							 <div>
							     <div class="col-sm-5 col-md-5 ">
								      <input type="text" class="form-control" id="userid" name="userid" placeholder="영문, 숫자 5-20자" maxlength="20" oninput="idchk()" value="${userInfo.userid }" readonly="readonly" >
								      <p id="resultchk"></p>
								</div>
							   
							 </div>
					    </div>
					  <div class="form-group" id="pw">
					    <label for="userpw" class="col-sm-2 control-label col-md-offset-2">비밀번호</label>
					    <div class="col-sm-5 col-md-5 ">
					      <input type="password" class="form-control" id="userpw" name="userpw" placeholder="비밀번호" maxlength="20" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="username" class="col-sm-2 control-label col-md-offset-2">이름</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="text" class="form-control" id="username" name="username" placeholder="이름" maxlength="15" value="${userInfo.username }" readonly="readonly" >
					    </div>
					  </div>
					  <div class="form-group">
					    <label for="userbirth" class="col-sm-2 control-label col-md-offset-2">생년월일</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="text" class="form-control" id="userbirth" name="userbirth" maxlength="10" value="${userInfo.userbirth }" readonly="readonly" >
						     
					    </div>
					  </div>
					   <div class="form-group">
					    <label for="userphone" class="col-sm-2 control-label col-md-offset-2">연락처</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="tel" class="form-control" name="userphone" id="userphone" placeholder="-없이 입력" maxlength="13" value="${userInfo.userphone }" readonly="readonly" >
					    </div>
					  </div>
					   <div class="form-group">
					   <label for="useraddr" class="col-sm-2 control-label col-md-offset-2" >주소</label>
					   		<div>
							    <div class="col-sm-3 col-md-2">
								    <input type="text" class="form-control" id="userpostnum" name="userpostnum" placeholder="우편번호" maxlength="6" value="${userInfo.userpostnum }" readonly="readonly">
								</div>
								 <div class="col-sm-3 col-md-2">
							      <input type="button" name="findAddr" id="findAddr" class="btn btn-default" onClick="findJuso();" value="주소찾기" />
							    </div>
							</div>
						</div>
					<div class="form-group">
							<div class="col-sm-8 col-md-7 col-sm-offset-2 col-md-offset-4">
								<input type="text" class="form-control" id="useraddr1" name="useraddr1" placeholder="주소" value="${userInfo.useraddr1 }" readonly="readonly">
							</div>
					</div>
					<div class="form-group"> 	
						<div class="col-sm-8 col-md-7 col-sm-offset-2 col-md-offset-4">
					     	 	<input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="상세주소" value="${userInfo.useraddr2 }" readonly="readonly">
					    	</div>
					  </div>
					  
					   <div class="form-group">
					    <label for="useremail" class="col-sm-2 control-label col-md-offset-2">e-mail</label>
					    <div class="col-sm-5 col-md-5">
					      <input type="email" class="form-control" id="useremail" name="useremail" placeholder="e-mail" maxlength="100" value="${userInfo.useremail }" readonly="readonly">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-4 col-xs-offset-4 col-xs-4 col-md-offset-4 col-md-4">
					      <button type="button" class="btn btn-default tryeditbtn" id="tryeditbtn" onClick="tryedit();">수정하기</button>
					      <button type="reset" class="btn btn-default" id="returnbtn" onclick="location.href='/login/edituser'">취소</button>
					      <button type="submit" class="btn btn-default editbtn"id="editbtn">수정</button>
					    </div>
					  </div>
					  
					  
					</form>
                </div>
                <!-- 내용 끝 -->
                
            </div>

<!-- 비밀번호 틀렸을 시 -->
    <div id="incorrectPw">${incorrect}</div>
    
	<!-- Modal err -->
	<div class="modal" id="editErrModal" style="display: none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
		            <br />
		            <p style="color:darksalmon; font-size:16px;">비밀번호 오류.</p> 
		            <br/>
		            <p>비밀번호를 정확히 입력해주세요.</p>
					<br />
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" id="editErrOk">확인</button>
		            </div>
	       	 	</div>
	        </div>
	    </div>
	</div>
	
<!-- content end -->
<jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>