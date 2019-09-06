<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!--  font -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <style type="text/css">
    #content #MOVE_TOP_BTN{
    	width:10%;
    	height:10%;
    }
    footer .logo-part{
    	height:25%;
    }
	input{
	    border:0px;
	    width: 100%;
	    resize: none;
    }
    .eventDate>*{
    	z-index:99;
    }
    .eventDatediv p{
    	display:inline-block;
    	width:100%;
    }
    .eventDatediv input{
    	display:inline-block;
    	width:30%;
    	border:1px solid #ededed;
    	text-align:center;
    }
    #eventContent{
    	width:100%;
    	height:300px;
    }
    #eventText> textarea{
    	height:500px;
    }
    .ui-datepicker{ font-size: 10px; width: 200px; }
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 11px; }
	.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 11px; }
	.eventBTN{
		margin-bottom:15%;
	}
    @media only screen and (max-width: 767px){
    	#pgnameWrap h3{
    		font-size:15px;
    		font-weight:bold;
    	}
    	.ui-datepicker{ font-size: 8px; width: 250px; }
		.ui-datepicker select.ui-datepicker-month{ width:50%; font-size: 12px; }
		.ui-datepicker select.ui-datepicker-year{ width:50%; font-size: 12px; }
		.eventDatediv {
	    	width:100%;
	    	font-size:12px;
	    }
	    .eventDatediv p{
	    	display:flex;
	    	width:100%;
	    }
	    .eventDatediv input{
	    	display:flex;
	    	width:30%;
	    	border:1px solid #ededed;
	    	text-align:center;
	    }
    }
 </style>
 <script type="text/javascript">
 function SubmitEvent(){
	 $("#insertbtn").click(function(){
		$("#eventEdit").submit();
	 });
 } 
 $(function(){
	$('#resetbtn,#submitbtn').hide();
	$('#editbtn').click(function(){//수정클릭
		$('#editbtn,#deletebtn,#backbtn').hide();//수정삭제돌아가기hide
		$('#resetbtn,#submitbtn').show();//등록취소show
			$('#eventsub, #eventdate, #eventcontent').removeAttr('readonly');
		});
 });
 $(function() {
	 
	  $( "#datepicker,#datepicker2" ).datepicker({
		  showButtonPanel: true,
		  closeText: '닫기',
	    dateFormat: 'yy-mm-dd',
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
 </script>
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
   
   <div class="container-fluid text-center">
    <div class="row">
       <div class="col-md-offset-2 col-md-8">
          <div class="col-md-12 col-sm-12 col-xs-12">
         </div>
         <form id="eventEdit"  method="post">
         <input type="hidden" name="method" value="put" id="method"/>
         <!-- form이 지원하지않는 put이나 delete로 메소드타입 변경 가능 -->
         <div id="eventInsert" class="col-md-12 col-sm-12 col-xs-12">
            <br /><br />
            <table class="table text-left table-bordered">
            <thead>
               <tr>
               <form action="/event/" method="delete">
	               	<th class="col-md-2 col-sm-2 col-xs-3">글번호</th>
	               	  <th class="col-md-10 col-sm-10 col-xs-9">
	                     <input type="text" id="eventnum" name="eventnum" value="${eventone.eventnum }" readonly="readonly">
	                  </th>
	           </form>
               </tr>   
               <tr>
                  <th class="col-md-2 col-sm-2 col-xs-3">제목</th>
                  <th class="col-md-10 col-sm-10 col-xs-9">
                     <input type="text" id="eventsub" name="eventsub" value="${eventone.eventsub }" readonly="readonly">
                  </th>
               </tr>
               <tr>
                  <th>개최기간</th>
                  <th id="when">
                  	<div class="col-md-10 col-sm-10 col-xs-9 eventDatediv">
                  		<p name="eventdate" id="eventdate" readonly="readonly">
                  			<input type="text" name="eventdateSta" id="datepicker" readonly="readonly" value="${eventone.eventdateSta }"> ~ <input type="text" name="eventdateEnd" id="datepicker2" readonly="readonly" value="${eventone.eventdateEnd }">
                  		</p>
                  	</div>
                  </th>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <td colspan="2" id="eventText" class="col-md-12 text-left">
                  	<div class="col-md-12 col-xs-12">
                  		<textarea class="col-md-12 col-sm-12 col-xs-12" readonly="readonly" type="text" name="eventcontent" id="eventcontent">${eventone.eventcontent}</textarea>
                  	</div>
                  </td>
               </tr>
               <tr>
                  <th class="col-md-2 col-sm-2 col-xs-3">배너이미지</th>
                  <th class="col-md-10 col-sm-10 col-xs-9">
                     <div class="form-group">
                        <input id="eventfileInput" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
                        <div class="bootstrap-filestyle input-group">
                           <input type="text" id="userfile" class="form-control" name="userfile" disabled="disabled">
                           <span class="group-span-filestyle input-group-btn" tabindex="0">
                           <label for="fileInput" class="btn btn-default ">이미지 업로드
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
         <div class="col-md-12 col-sm-12 col-xs-12 center eventBTN">
         	<button type="button" onclick="editbtn" id="editbtn" class="btn btn-default">수정</button>
         	<button type="button" onclick="location.href='/event/delete/${eventone.eventnum }'" id="deletebtn">삭제</button>
         	<button type="button" onclick="location.href='/event/'" id="backbtn" class="btn btn-default">돌아가기</button>
         	<button type="submit" id="submitbtn" class="btn btn-default">등록</button>
         	<button type="reset"  id="resetbtn" class="btn btn-default">취소</button>
         </div>
         </form>
         <!--------------------------------------------------------------------------------------------------------------------->
      </div>
      
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>
