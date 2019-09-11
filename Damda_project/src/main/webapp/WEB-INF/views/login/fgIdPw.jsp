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
			margin:40px 0px 40px 0px;
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
		
		/*입력값 없을 시*/
		.noInput{
			color:red;
			font-size:13px;
		}
	</style>
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
							<div id="fgIdSub">아이디 찾기</div>
						</div>
						<!-- sub end -->
						<!-- content start -->
						<div class="row">
							<div class="chks">
								&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_find" id="chk_email" checked="checked"/>  이메일
								&nbsp;&nbsp;&nbsp;
								<input type="radio" name="chk_find" id="chk_phone"/>  휴대폰 번호
							</div>
						</div>
						<div class="row">
							<form id="submitOk" name="submitOk" method="POST">
								<div id="hiddenId">
									<br/><br/>
									<div class="col-xs-4 fgIdPwInput">아이디</div>
									<input type="text" name="id" id="id" class="col-xs-8 fgIdPwInput"/>
								</div>
								<br/><br/>
								<div class="col-xs-4 fgIdPwInput">이름</div>
								<input type="text" name="name" id="name" class="col-xs-8 fgIdPwInput"/>
								<div id="hiddenEmail">
									<br/><br/>
									<div class="col-xs-4 fgIdPwInput" >이메일</div>
									<input type="email" name="email" id="email" class="col-xs-8 fgIdPwInput" placeholder="example@naver.com"/>
								</div>
								<div id="hiddenPhone">
									<br/><br/>
									<div class="col-xs-4 fgIdPwInput">휴대폰</div>
									<input type="text" name="phone" id="phone" class="col-xs-8 fgIdPwInput" placeholder="- 없이 입력" maxlength="13"/>
								</div>
								<br/><br/><br/>
								<button type="button" onclick="fgIdPwSubmit()" id="btnOk"><div>확인</div></button>
							</form>
						</div>
						<div class="row" id="changePW">
						
						</div>
						<%String fnIdErr = request.getParameter("fnIdErr"); %>
						<%String fnPwErr = request.getParameter("fnPwErr"); %>
						<div id="fnIdErr"><%=fnIdErr %></div>
						<div id="fnPwErr"><%=fnPwErr %></div>
						<!-- content end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ----------------------------------------------------------------------------------- -->
	<!-- 아이디찾기 틀렸을 시 -->
	<div class="modal" id="fnIdErrModal" style="display:none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
		            <br />
		            <p style="color:darksalmon; font-size:16px;">아이디찾기 오류.</p> 
		            <br/>
		            <p>이름과 이메일또는 휴대폰을 다시 확인해주세요.</p>
					<br />
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" id="fnIdOk">확인</button>
		            </div>
	       	 	</div>
	    	</div>
		</div>
	</div>
	<!-- 비밀번호찾기 틀렸을 시 -->
	<div class="modal" id="fnPwErrModal" style="display:none; z-index: 1050;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-body text-center" id="confirmMessage">
		            <br />
		            <p style="color:darksalmon; font-size:16px;">비밀번호찾기 오류.</p> 
		            <br/>
		            <p>아이디와 이름, 이메일또는 휴대폰을 다시 확인해주세요.</p>
					<br />
		            <div class="modal-footer">
						<a href="/login/fgid" style="float:left;">아이디 찾기</a>
		                <button type="button" class="btn btn-default" id="fnPwOk">확인</button>
		            </div>
	       	 	</div>
	    	</div>
		</div>
	</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
	<jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
	$(function(){
		var url=window.location.pathname;
		var location = url.substring(url.lastIndexOf("/")+1);

		//아이디찾기로 들어왔을 시
		if(location=="fgid" || location == "fnid"){
			$('#fgIdSub').html('아이디 찾기');
			//아이디쓰는 div 감추기
			$('#hiddenId').css('display','none').children().eq(3).attr('disabled',true);
			//비밀번호 찾기버튼으로 바꾸기
			$div=$('<div><a href="fgpw">비밀번호 찾기</a></div>');
			$('#changePW').prepend($div);
		}else if(location=='fgpw'){
			$('#fgIdSub').html('비밀번호 찾기');
			//아이디쓰는 div 보이기
			$('#hiddenId').css('display','').children().eq(3).attr('disabled',false);
			//아이디 찾기버튼으로 바꾸기
			$div=$('<div><a href="fgid">아이디 찾기</a></div>');
			$('#changePW').prepend($div);
		}
		
		//체크에 따른
		//이메일 체크되있을 시
		$('#hiddenPhone').css('display','none').children().eq(3).attr('disabled',true);
		$('#chk_email').click(function(){
			//입력 없을시 생기는 노드 제거
			$('.noInput').remove();
			//텍스트초기화
			$('#id').val('');
			$('#name').val('');
			//email보이게,disabled풀기 && phone 안보이게,disabled
			$('#hiddenEmail').css('display','').children().eq(3).attr('disabled',false);
			$('#hiddenPhone').css('display','none').children().eq(3).attr('disabled',true);
		});
		//체크에 따른
		$('#chk_phone').click(function(){
			//입력 없을시 생기는 노드 제거
			$('.noInput').remove();
			//텍스트초기화
			$('#id').val('');
			$('#name').val('');
			//email안보이게,disabled && phone 보이게,disabled풀기
			$('#hiddenEmail').css('display','none').children().eq(3).attr('disabled',true);
			$('#hiddenPhone').css('display','').children().eq(3).attr('disabled',false);
		});
		//**********************************************//
		//전화번호 하이픈 자동생성
		$('#phone').keydown(function (event) {
			var key = event.charCode || event.keyCode || 0;
            	$text = $(this); 
            	if (key !== 8 && key !== 9) {
                	if ($text.val().length === 3) {
                    	$text.val($text.val() + '-');
                	}
                	if ($text.val().length === 8) {
                    	$text.val($text.val() + '-');
                	}
            	}
            	return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
       	});
		//**********************************************//
		//클릭 시 입력값 초기화
		$('#id').click(function(){
			$(this).val('');
		});
		$('#name').click(function(){
			$(this).val('');
		});
		$('#email').click(function(){
			$(this).val('');
		});
		$('#phone').click(function(){
			$(this).val('');
		});
		//**********************************************//
		//아이디,비밀번호 찾기 틀리면 나오는 팝업창
 		$('#fnIdErr').hide();
 		$('#fnPwErr').hide();
 		var fnIdErr = $('#fnIdErr').text();
 		var fnPwErr = $('#fnPwErr').text();
	 	if(fnIdErr == "fnIdErr"){
	   	    var fnIdErrModal = $("#fnIdErrModal");
	   	 		fnIdErrModal.modal("show").css('top', '35%');
		  	    $("#fnIdOk").click(function(){
		  	    	fnIdErrModal.modal("hide");
			  	}); 
	 	}else if(fnPwErr == "fnPwErr"){
	 		var fnPwErrModal = $("#fnPwErrModal");
	 		fnPwErrModal.modal("show").css('top', '35%');
	  	    $("#fnPwOk").click(function(){
	  	    	fnPwErrModal.modal("hide");
	  		}); 
		}
	});
	//로그인 정보 비어있는지 확인
	function fgIdPwSubmit(){
		//입력 없을시 생기는 노드 제거
		$('.noInput').remove();
		
		//이름칸 비어있으면 false
		if($('#name').val()==""){
			$div=$('<div class="noInput"><br/><div class="col-xs-9 col-xs-offset-3">&nbsp;&nbsp;&nbsp;이름을 입력해 주세요</div></div>');
			$('#name').after($div)
			return false;	
		}
			
		//체크상태에 따른
		if($('#chk_email').is(':checked')){
			//이메일칸 비어있으면 false
			if($('#email').val()==""){
				$div=$('<div class="noInput"><br/><div class="col-xs-9 col-xs-offset-3">&nbsp;&nbsp;&nbsp;이메일을 입력해 주세요</div></div>');
				$('#email').after($div)
				return false;	
			}
		}else{
			//휴대폰칸이 비어있으면 false
			if($('#phone').val()==""){
				$div=$('<div class="noInput"><br/><div class="col-xs-9 col-xs-offset-3">&nbsp;&nbsp;&nbsp;번호를 입력해 주세요</div></div>');
				$('#phone').after($div)
				return false;	
			}
		}
		//입력값이 다 있으면 submit되게
		loginOk();
	}
	//입력값이 다 있으면 submit되게
	function loginOk(){
		var url=window.location.pathname;
		var location = url.substring(url.lastIndexOf("/")+1);
		var submitOk = document.getElementById("submitOk");
		//주소에 따른 form action변경
		if(location == "fgid" || location == "fnid"){
			document.submitOk.action="fnid";
		}else if(location == "fgpw"){
			document.submitOk.action="fnpw"
		}
		//체크완료시 submit
		submitOk.submit();
	}
</script>
</html>