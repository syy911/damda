<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 	<jsp:include page="/resources/template/head.jsp"/>
 	<style type="text/css">
 	input,#contentQna {
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
 	#qnaTab img {
 	width: 13px;
 	height: 15px;
 	} 
 	#qnaTab tbody textarea {
 	margin-top: 2%; 
 	margin-bottom: 2%;
 	}
 	#qnaTab .form-group {
 	width: 35%;
 	height: 5px;
 	margin-top: -7px;
 	}
 	#qnaTab #userfile {
 	cursor: default;
 	}
 	.radio {
 	margin: 0 auto;
 	}
 	#pgTransition img {
 	width: 12px; 
 	height: 8px;
 	}
 	#pgTransition a {
 	color: rgb(0,0,0);
 	}
 	</style>
 	<script type="text/javascript">
 	$(document).ready(function(){
 		resized2();
 		
 		//들어오는 주소따라 등록버튼 동작 다름(백...?)
 		//수정-등록 & 입력-등록
 		//비동기로 입력,등록하고 성공하면 페이지 이동
	 	var url = window.location.pathname;
	 	var location = url.substring(url.lastIndexOf("/")+1);
	 	if(location=='qna.insert'){
	 			/* location.replace('/notice');  */
	 			console.log(location);
	 			$('input').removeAttr('value');	
	 			$('#contentQna').val('');
	 	}else if(location=='qna.update'){
	 		console.log(location);
	 		$('input').removeAttr('placeholder');
	 	}

	 	$('#cancleBtn').click(function(){
	 		window.location.replace('notice'); 
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
    });
 	$(window).resize(function() {
        resized2();
    });
    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	console.log('why');
            	$('#qnaTab .form-group').css('width','250px');
            }else{    
            	$('#qnaTab .form-group').css('width','35%');
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
	    	<div class="col-md-12 col-sm-12 col-xs-12">
				<br /><br />
				<div id="pgnameWrap">
					<h3>Q&A</h3>
				</div>
				<br />
			</div>
			<div id="qnaTab" class="col-md-12 col-sm-12 col-xs-12">
				<br /><br />
				<table class="table text-left table-bordered">
				<thead>	
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3">Subject</th>
						<th class="col-md-10 col-sm-10 col-xs-9">
							<input type="text" id="sub" name="sub" value="전화드렸는데 빨리 취소해주세요" placeholder="제목을 입력해주세요">
						</th>
					</tr>
					<tr>
						<th>Writer</th>
						<th>김경민</th>
					</tr>
					<tr>
						<th>Date</th>
						<th>2019-08-19</th>
					</tr>
					<tr>
						<th>Category</th>
						<th>
						<select id="category" class="selectpicker"> 
							<option>상품문의</option> 
							<option>배송문의</option> 
							<option>취소/변경문의</option> 
							<option>교환/반품문의</option> 
							<option>기타문의</option> 
						</select>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2" class="col-md-12 text-left">
						 <textarea id="contentQna" name="contentQna" class="form-control col-md-12 col-sm-12 col-xs-12" rows="15" style="resize: none;" placeholder="내용을 입력해 주세요">
						 취소취소취소취소취소취소취소취소취소취소취소취소취소취소
						 취소취소취소취소취소취소취소취소취소취소취소취소취소취소
						 취소취소취소취소취소취소취소취소취소취소취소취소취소취소
						 취소취소취소취소취소취소취소취소취소취소취소취소취소취소
						 취소취소취소취소취소취소취소취소취소취소취소취소취소취소
						 취소취소취소취소취소취소취소취소취소취소취소취소취소취소
						 첨부파일 넣을 수도 있고 안넣어도 되고...			
						 </textarea>
						</td>
					</tr>
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3">첨부파일</th>
						<th class="col-md-10 col-sm-10 col-xs-9">
							<div class="form-group">
								<input id="fileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
								<div class="bootstrap-filestyle input-group">
									<input type="text" id="userfile" class="form-control" name="userfile" disabled="disabled">
									<span class="group-span-filestyle input-group-btn" tabindex="0">
									<label for="fileInput" class="btn btn-default ">
									<span class="glyphicon fa fa-upload"></span>
									</label>
									</span>
								</div>
							</div>
						</th>
					</tr>
					<tr>
						<th>
							공개여부
						</th>
						<th>
							<div class="radio">
							  <label for="conceal">
							    <input type="radio" name="optionsRadios" id="conceal" value="conceal" checked>
							    비밀글
							  </label> 
							  &nbsp;&nbsp;&nbsp;&nbsp;
							  <label for="reveal">
							    <input type="radio" name="optionsRadios" id="reveal" value="reveal">
							    공개글
							  </label>
							</div>
						</th>
					</tr>
					<tr>
						<th>비밀번호</th>
						<th><input type="text" id="qnaPw" name="qnaPw" value="12345" placeholder="비밀번호를 입력하세요"></th>
					</tr>
				</tbody>
			</table>
			</div>
			<!--- 페이지 따라 버튼동작 다름 --------------------------------------------------------------------------------------->
			<div class="col-md-12 col-sm-12 col-xs-12 text-right">
				<a id="okBtn" class="btn btn-default">등록</a>
				<a href="qna.list" id="cancleBtn" class="btn btn-default">취소</a>
			</div>
			<!--------------------------------------------------------------------------------------------------------------------->
		</div>
	</div>
	</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>