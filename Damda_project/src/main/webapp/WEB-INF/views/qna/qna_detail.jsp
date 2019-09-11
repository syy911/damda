<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
 	<jsp:include page="/resources/template/head.jsp"/>
 	<style type="text/css">
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
 	pre {
 	border: 0px;
 	font-family: 'Noto Sans KR', sans-serif;
 	color: #333333;
 	width: 100%;
 	white-space: pre-wrap; /* CSS3*/
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-wrap: break-all; /* Internet Explorer 5.5+ */ 
 	}
 	#answerPre {
 	background-color: #eeedee;
 	}
	#answerWrap {
	margin: 20px auto;
	}
	#answerWrap2 {
	background-color: #eeedee;
	width: 100%;
	}
 	#answerWrap #answer {
 	width: 98%;
 	margin: 25px auto;
 	background-color: #eeedee;
 	border: none;
 	}
 	</style>
 	<script type="text/javascript">
 	$(document).ready(function(){
 		resized2();
 		//user계정일땐 문의글과 답글만 볼 수 있음(작성돼있을 시)
 		//관리자 계정일 땐 문의글 아래에 답글 작성,수정가능
 		var url = window.location.pathname;
	 	var location = url.substring(url.lastIndexOf("/")+1);
	 	if(location=='qna.detail'){						
			console.log(location);
// 			$('#answerInsertBtn').css('display','none');		//유저세션일 때
// 			$('#answerUpdateBtn').css('display','none');		//유저세션일 때			
	 		$('#answerWrap').css('display','none');	//답글 없을 때 (if로 조건달기)
			$('#answerWrap').css('display','block');	//답글 있을 때 (if로 조건달기)
			$('#answerWrap3').css('display','none');
			$("#answer").attr("disabled", "disabled");
	 	}else if(location=='qnaAnswer.insert') {				
	 		noneForAnswer();
 			$('#answer').val('');
	 	}else if(location=='qnaAnswer.update'){	
	 		noneForAnswer();
			$('#answer').removeAttr('placeholder');		
	 	}
 	});
 	$(window).resize(function() {
        resized2();
    });
 	
 	//답글관련페이지에서 안보여야할 부분
 	function noneForAnswer() {
 		$('#answerInsertBtn').css('display','none');
 		$('#answerUpdateBtn').css('display','none');
 		$('#updateBtn').css('display','none');
 		$('#deleteBtn').css('display','none');
 		$('#answerWrap').css('display','block');
 		$("#answer").removeAttr("disabled");
 	}

    function resized2() {
        var windowWidth = $(window).width();
            if(windowWidth < 540) {
            	$('#qnaTab').css('font-size','13px');
            }else{
            	$('#qnaTab').css('font-size','14px');
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
						<th class="col-md-10 col-sm-10 col-xs-9">전화드렸는데 빨리 취소해주세요</th>
					</tr>
					<tr>
						<th>Writer</th>
						<th>김경민</th>
					</tr>
					<tr>
						<th>Date</th>
						<th>2019-08-21</th>
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
						<td colspan="2" class="col-md-12">
							<div class="col-md-12 text-left">
<pre>취소취소취소취소취소취소취소취소취소취소취소취소취소취소
취소취소취소취소취소취소취소취소취소취소취소취소취소취소
취소취소취소취소취소취소취소취소취소취소취소취소취소취소
취소취소취소취소취소취소취소취소취소취소취소취소취소취소
취소취소취소취소취소취소취소취소취소취소취소취소취소취소
취소취소취소취소취소취소취소취소취소취소취소취소취소취소
첨부파일 넣을 수도 있고 안넣어도 되고...</pre>
							</div>
						</td>
					</tr>
					<tr>
						<th class="col-md-2 col-sm-2 col-xs-3">첨부파일</th>
						<th class="col-md-10 col-sm-10 col-xs-9"><a href="#"><img alt="attached" src="/resources/icon/attach-clip.png">첨부파일 이름</a></th>
					</tr>
				</tbody>
			</table>
			</div>
			<div class="col-md-12 col-sm-12 col-xs-12 text-right">
				<a href="qna.update" id="update-btn" class="btn btn-default">수정</a>
				<a id="deleteBtn" class="btn btn-default">삭제</a>
				<a href="qnaAnswer.insert" id="answerInsertBtn" class="btn btn-default">답변등록</a>
				<a href="qnaAnswer.update" id="answerUpdateBtn" class="btn btn-default">답변수정</a>
			</div>
			<div id="answerWrap" class="col-md-12 col-sm-12 col-xs-12">
				<div id="answerWrap2" class="col-md-12 col-sm-12 col-xs-12">
					<pre id="answerPre">
					<textarea id="answer" rows="13" style="resize: none;" disabled="disabled" placeholder="답변을 입력하세요">
죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송
죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송
죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송
최대한빨리처리해드리겠습니다 
죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송죄송
					</textarea>
					</pre>
				</div>
			</div>
			<div id="answerWrap3" class="col-md-12 col-sm-12 col-xs-12 text-right">
				<a href="qna.detail" id="updateBtn" class="btn btn-default">등록</a>
				<a href="qna.detail" id="updateBtn" class="btn btn-default">취소</a>
			</div>
		</div>
	</div>
	</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body></html>