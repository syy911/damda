<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
    #content #MOVE_TOP_BTN{
    	width:10%;
    	height:10%;
    }
    footer .logo-part{
    	height:30%;
    }
    #eventtable{
    	margin-top:3%;
    }
    .eventTH, .eventTD{
    	text-align:center;
    	border:2px solid #ededed;
    }
	#eventtable *{
		text-align:center;
	}
	.banner{
		width:100%;
		margin:2% auto;
	}
	#eventinputbtn{
			border:1px solid dimgray;
			background-color:salmon;
			border-radius:50px 50px 50px 50px;		
			width:100%;
			margin:20% auto;
			color:white;
			font-size:20px;
		}
	@media only screen and (max-width: 767px){
		
		#eventinputbtn{
			border:1px solid dimgray;
			background-color:salmon;
			border-radius:50px 50px 50px 50px;		
			width:100%;
			margin:20% auto;
			color:white;
			font-size:20px;
		}
	    .eventTD{
			font-size:15px;
			height:50%;
		}
		.eventTD p{
			margin:0px auto;
		}
		.eventHEAD{
			display:none;
		}
		.eventTR > .eventTD{
			display:flex;
		}
		
	}	
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
        loginuser="user";
    	var loginuser = session.setAttribute("user","master");
    	$('#eventinputbtn').hide();
    	if(session.sgetAttribute("user")=="hell"){
    		$('#eventinputbtn').show();
    	}	
    })
    
    </script>
</head>
<body>
    <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header.jsp"/>
   <!-- ***********************************content start*********************************** -->
   <div class="row col-md-12">
	
		<table id="eventtable" class="col-md-8 col-md-offset-2 col-xs-12">
			<thead class="eventHEAD">
				<th class="col-md-8 eventTH">이벤트</th>
				<th class="col-md-4 eventTH">개최기간</th>
			</thead>
			<tbody >
				<c:forEach items="${eventlist}" var="eventlist">
					<tr class="eventTR">
						<td class="eventTD">
							<div class="col-md-12 col-xs-12 eventIMG">
								<a href="/event/detail/${eventlist.eventnum }"><img src="/resources/imgs/mainSlider02.png" class="banner" alt=""></a>
							</div>
						</td>
						<td class="eventTD"><p class="when" id="eventdate" name="eventdate">${eventlist.eventdateSta} ~ ${eventlist.eventdateEnd }</p></td>
					</tr>
				</c:forEach>			
			</tbody>
		</table>
	</div>
	</div>	<div class="row">
		<div class="col-md-2 col-md-offset-5 col-xs-4 col-xs-offset-4" id="btnbox">
			<button type="button" id="eventinputbtn" onclick="location.href='input' ">이벤트 등록</button>					
		</div>
	</div>
</div>
    <!-- ***********************************content end*********************************** -->
    <!-- ***********************************footer*********************************** -->
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>
