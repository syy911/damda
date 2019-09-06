<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 관리자만 접근가능한 페이지 공지사항 등록 & 수정 페이지 -->
    <meta charset="UTF-8">
 	<jsp:include page="/resources/template/head.jsp"/>
 	<style type="text/css">
 	input,#contentNotice {
	 	border:0px;
	 	width: 100%;
	 	resize: none;
 	}
 	#pgnameWrap {
	 	border:thin solid rgb(200,200,200);
	 	height: 45px;
	 	width:125px;
	 	margin: 0 auto;
 	}
 	#pgnameWrap h3 {
	 	margin: 0px;
	 	padding: 7px;
 	}
 	#noticeTab img {
	 	width: 13px;
	 	height: 15px;
 	}
 	#noticeTab tbody textarea {
	 	margin-top: 2%; 
	 	margin-bottom: 2%;
 	}
 	#noticeTab .form-group {
	 	width: 35%;
	 	height: 5px;
	 	margin-top: -7px;
 	}
 	#noticeTab #userfile {
 		cursor: default;
 	}
 	#pgTransition img {
	 	width: 12px; 
	 	height: 8px;
 	}
 	#pgTransition a {
 		color: rgb(0,0,0);
 	}
 	#previewImg{
 		margin:0px auto;
 		width:80%;
 		height:200px;
 	}
 	#previewImg>img{
 		width:100%;
 		height:100%;
 	}
 	/*placeholder color change*/
 	.placeholderColor::-webkit-input-placeholder {
 		color:darksalmon;
 	}
 	#placeholderColor>textarea::-webkit-input-placeholder {
 		color:darksalmon;
 	}
 	</style>
</head>
<body>
  <!-- ***********************************header start*********************************** -->
  <jsp:include page="/resources/template/header.jsp"/>
  <!-- ***********************************content start*********************************** -->
	<div class="container-fluid text-center">
	  <div class="row">
		<div class="col-md-offset-1 col-md-10">
		  <div class="col-md-12 col-sm-12 col-xs-12">
			<br /><br />
			<div id="pgnameWrap">
			  <h3>공지사항</h3>
			</div>
			<br />
		  </div>
		  <div id="noticeTab" class="col-md-12 col-sm-12 col-xs-12">
			<br /><br />
			<form action="/notice/insert" method="POST" id="serarchForm" name="serarchForm">
			  <table class="table text-left table-bordered">
				<thead>
				  <tr id="updatebbsseq">
					<th class="col-md-2 col-sm-2 col-xs-3">번호</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <input type="text" id="bbsseq" name="bbsseq" value="${noticeUpdate.bbsseq }"/>
					</th>
				  </tr>	
				  <tr>
					<th class="col-md-2 col-sm-2 col-xs-3">제목</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <input class="insertUrl" type="text" id="bbssub" name="bbssub" placeholder="제목을 입력해주세요" maxlength="40"/>
					  <input class="updateUrl" type="text" id="bbssub" name="bbssub" placeholder="제목을 입력해주세요" maxlength="40" value="${noticeUpdate.bbssub }"/>
					</th>
				  </tr>
				  <tr>
					<th>작성자</th>
					<th>
						<input class="insertUrl" type="text" id="bbswriter" name="bbswriter" value="<%=session.getAttribute("username")%>" readonly="readonly"/>
						<input class="updateUrl" type="text" id="bbswriter" name="bbswriter" value="${noticeUpdate.bbswriter }" readonly="readonly"/>
					</th>
				  </tr>
				  <tr>
					<th>작성일</th>
					<th>
						<%
						//현재날짜 계산
						Date today=new Date(); 
						SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
						%>
						<input class="insertUrl" type="text" id=bbsdate" name="bbsdate" value="<%=date.format(today) %>" readonly="readonly"/>
						<input class="updateUrl" type="text" id=bbsdate" name="bbsdate" value="${noticeUpdate.bbsdate }" readonly="readonly"/>
					</th>
				  </tr>
				</thead>
				<tbody>
				  <tr>
					<td colspan="2" class="col-md-12 text-left" id="bbscontd">
					 <div id="previewImg"><img /></div>
					 <textarea class="insertUrl" id="contentNotice" name="bbscon" class="form-control col-md-12 col-sm-12 col-xs-12" rows="15" style="resize: none;" placeholder="내용을 입력해 주세요" maxlength="1999"></textarea>
					 <textarea class="updateUrl" id="contentNotice" name="bbscon" class="form-control col-md-12 col-sm-12 col-xs-12" rows="15" style="resize: none;" placeholder="내용을 입력해 주세요" >${noticeUpdate.bbscon} </textarea>
					</td>
				  </tr>
				  <tr>
					<th class="col-md-2 col-sm-2 col-xs-3">이미지 첨부파일</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <div class="form-group">
						<input id="fileImgInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					    <div class="bootstrap-filestyle input-group">
						  <input type="text" id="userfile" class="form-control" name="userfile" disabled="disabled">
						  <span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileImgInput" class="btn btn-default ">
							  <span class="glyphicon fa fa-upload"></span>
							</label>
						  </span>
						</div>
						</div>
					</th>
				  </tr>
				  <tr>
					<th class="col-md-2 col-sm-2 col-xs-3">글 첨부파일</th>
					<th class="col-md-10 col-sm-10 col-xs-9">
					  <div class="form-group">
						<input id="fileWriteInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
					    <div class="bootstrap-filestyle input-group">
						  <input type="text" id="userfile" class="form-control" name="userfile" disabled="disabled">
						  <span class="group-span-filestyle input-group-btn" tabindex="0">
							<label for="fileWriteInput" class="btn btn-default ">
							  <span class="glyphicon fa fa-upload"></span>
							</label>
						  </span>
						</div>
						</div>
					</th>
				  </tr>
				</tbody>
			  </table>
   		    </div>
   		  	<!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
		  	  <div class="col-md-12 col-sm-12 col-xs-12 text-right">
				<button type="button" id="okBtn" onclick="confirmOK()" class="btn btn-default">등록</button>
				<button type="reset" id="cancleBtn" class="btn btn-default">취소</button>
		  	  </div>
		  	<!--------------------------------------------------------------------------------------------------------------------->
		  </form>
		</div>
	  </div>
	</div>
	<br/><br/><br/>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
<script type="text/javascript">
 	$(document).ready(function(){
 		resized2();
 		//들어오는 세션따라 보이는 부분다르게(관리자 // USER)
 		//들어오는 주소따라 등록버튼 동작 다름(백...?)
 		//수정-등록 & 입력-등록
 		//비동기로 입력,등록하고 성공하면 페이지 이동
	 	var url = window.location.pathname;
	 	var location = url.substring(url.lastIndexOf("/")+1);
	 	if(location=='notice.insert'){
 			$( 'input' ).removeAttr( 'value' );	
 			$('#contentNotice').val('');
	 	}else if(location=='notice.update'){
	 		console.log(location);
	 		$( 'input' ).removeAttr( 'placeholder' );
	 	}

	 	$('#cancleBtn').click(function(){
	 		history.back();
	 	});
	 	//첨부파일 이름 추출
	 	$("#fileInput").on('change', function(){  // 값이 변경되면
			if(window.FileReader){  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
			}
			// 추출한 파일명 삽입
			$("#userfile").val(filename);
		});
		//이미지 미리보기
		function readURL(input) {
			if (input.files && input.files[0]) { 
				var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성 
				reader.onload = function (e) {
					$("#previewImg").css("display","");
					//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
					$('#previewImg img').attr('src', e.target.result); 
					//이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				}
				reader.readAsDataURL(input.files[0]); 
				//File내용을 읽어 dataURL형식의 문자열로 저장
			}
		}//readURL()--
		//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
		$("#fileImgInput").change(function(){
			 //alert(this.value); //선택한 이미지 경로 표시
            readURL(this);
        });
        $("#previewImg").css("display","none");
        //url에 따라 다르게 보이기
        var url=window.location.pathname;
        if(url.indexOf("insert")!=-1){
			$(".insertUrl").css("display","");
			$(".insertUrl").prop("disabled",false);
			$(".updateUrl").css("display","none");
			$(".updateUrl").attr("disabled","disabled");
			//시퀀스값 넘어가지도 않고 화면에 안보임
			$("#bbsseq").attr("disabled","disabled");
			$("#updatebbsseq").css("display","none");
			document.serarchForm.action = "/notice/insert";
        }else if(url.indexOf("update")!=-1){
        	$(".updateUrl").css("display","");
        	$(".updateUrl").prop("disabled",false);
        	$(".insertUrl").css("display","none");
			$(".insertUrl").attr("disabled","disabled");
			//id없애기
			$(".insertUrl").prop("id",false);
			//시퀀스값 넘어가지만 화면엔 안보임
			$("#bbsseq").prop("disabled",false);
			$("#updatebbsseq").css("display","none");
			document.serarchForm.action = "/notice/update/${noticeUpdate.bbsseq}";
		}
    });
 	//제목,글 비어있으면 다시 입력받게 하기
	function confirmOK(){
		//class remove
		$('#bbssub').removeClass('placeholderColor');
		$('#placeholderColor').attr('id','bbscontd');
		//제목 비어있으면 false || 40자 넘어가지 않기
		if($('#bbssub').val()==""){
			$('#bbssub').focus();
			$('#bbssub').addClass('placeholderColor');
        	var offset = $('#pgnameWrap').offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
			return false;	
		}
		if($('#contentNotice').val()==""){
			$('#contentNotice').focus();
			$('#bbscontd').attr('id','placeholderColor');
			var offset = $('#pgnameWrap').offset();
			$('html, body').animate({scrollTop : offset.top}, 400);
			return false;
		};
		//입력값이 다 있으면 submit되게
		var serarchForm = document.getElementById('serarchForm');
		document.serarchForm.submit();
	}
 	
    //사이즈에 따른
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	console.log('why');
            	$('#noticeTab .form-group').css('width','250px');
            }else{    
            	$('#noticeTab .form-group').css('width','35%');
          }
    }
    //전송
    function okBtn(){
		location="";
	}
 </script>
</html>