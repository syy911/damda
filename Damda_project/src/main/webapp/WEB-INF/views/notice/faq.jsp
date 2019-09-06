<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <jsp:include page="/resources/template/head.jsp"></jsp:include>
    <style type="text/css">
    	/*faqSubs start*/
    	#pgnameWrap {
		 	border:thin solid rgb(200,200,200);
		 	height: 45px;
		 	width:125px;
		 	margin: 0 auto;
	 	}
	 	#pgnameWrap h3 {
		 	margin: 0px;
		 	padding: 7px;
		 	text-align:center;
	 	}
    	/*faqSubs end*/
		/*faqContent start*/
		.faqMargin{
			margin:0px 0px 30px 0px;
		}
		.faqConType{
			border: 4px dashed darksalmon;
			border-radius: 9px 9px 9px 9px;
			font-size:17px;
			cursor: pointer;
		}
		.faqConSub{
			margin:10px 0px 10px 0px;
		}
		.faqIcons{
			margin:10px 0px 10px 0px;
		}
		.faqIconOne>img{
			width:25px;
			transition: 0.3s;
			float: right;
			margin:3px 0px 0px 0px;
		}
		/*faqContent end*/
		/*faqAns start*/
		.faqConAns{
			display:none;
			font-size:17px;
			margin:10px 10px 0px 0px;
		}
		.faqConAnsSize{
			margin:15px 0px 15px 0px;
		}
		/*faqAns end*/
    </style>
    <script type="text/javascript">
		$(function(){
			$('.faqConType').click(function(){
				$('.faqConAns').slideUp();
				$('.faqIconOne>img').css('transform','rotate(0deg)');
				if(!$(this).next().is(":visible")){
					$(this).next().slideDown();
					$(this).children().eq(1).children().children().css('transform','rotate(90deg)');
				}
			});

		});
    </script>
</head>

<body>
	<jsp:include page="/resources/template/header.jsp"></jsp:include>
	
	<div class="row">
		<div class="col-md-6 col-md-offset-3 col-xs-10 col-xs-offset-1" id="faqContents">
		<!-- sub start -->
			<div class="row">
				<div class="container-fluid" id="faqSub">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<br /><br />
					<div id="pgnameWrap">
						<h3>FAQ</h3>
					</div>
					<br /><br />
				</div>
				</div>
			</div>
		<!-- sub end -->
		<!-- content start -->
			<!-- Q1 -->
			<div class="faqMargin">
				<div class="row faqConType">
					<div class="col-xs-11 faqConSub">Q. 계정을 분실하였어요.</div>
					<div class="col-xs-1 faqIcons">
						<div class="faqIconOne">
							<img src="/resources/icon/bottum.png"/>
						</div>
					</div>
				</div>
				<div class="row faqConAns">
					<div class="faqConAnsSize">
						<div>A. 아이디찾기와 비밀번호 찾기는 [로그인] - [아이디/비밀번호 찾기]를 통해 찾으실 수 있습니다. <br/><br/>
						<span style="color:#e9af8e;">*위의 방법으로도 찾지 못하셨다면 Q&A를 통해 문의글을 작성해주시기 바랍니다.</span>
						</div>
					</div>
				</div> 
			</div>
			<!-- Q2 -->
			<div class="faqMargin">
				<div class="row faqConType">
					<div class="col-xs-11 faqConSub">Q. 주문 취소는 언제 가능한가요?</div>
					<div class="col-xs-1 faqIcons">
						<div class="faqIconOne">
							<img src="/resources/icon/bottum.png"/>
						</div>
					</div>
				</div>
				<div class="row faqConAns">
					<div class="faqConAnsSize">
						<div>A. 주문은 상품준비중, 배송보류 단계에서만 취소가 가능합니다. <br />
						회원일 경우 로그인 후 [마이페이지] - [주문내역] - [취소신청] 버튼을 눌러 취소하시려는 샐러드에 대해 취소를 접수해주시기 바랍니다. <br / >
						비회원일 경우, 비회원 주문조회를 이용하여 접수해주시기 바랍니다. <br /><br />
						해당 부분이 어려우시다면, Q&A게시판에 주문번호와 함께 취소 요청 글을 작성해주시기 바랍니다. <br/><br/>
						<span style="color:#e9af8e;">* 배송준비중 단계에서는 주문 취소 처리가 불가합니다.</span>
						</div>
					</div>
				</div> 
			</div>
			<!-- Q3 -->
			<div class="faqMargin">
				<div class="row faqConType">
					<div class="col-xs-11 faqConSub">Q. 환불/교환하고 싶어요.</div>
					<div class="col-xs-1 faqIcons">
						<div class="faqIconOne">
							<img src="/resources/icon/bottum.png"/>
						</div>
					</div>
				</div>
				<div class="row faqConAns">
					<div class="faqConAnsSize">
						<div>A. 환불의 경우 샐러드에 하자가 있을 경우 환불이 가능합니다.<br/><br/>
						A. 교환은 대체로 불가능하며 샐러드를 주문해주신 시간 30분이내 문의 전화를 해주셔야합니다.<br/><br/>
						<span style="color:#e9af8e;">* 단, 제품의 하자를 증명할 수 있는 사진 첨부는 필수입니다.</span>
						</div>
					</div>
				</div> 
			</div>
			<!-- Q4 -->
			<div class="faqMargin">
				<div class="row faqConType">
					<div class="col-xs-11 faqConSub">Q. 리뷰/후기를 작성했는데 적립금이 지급되지 않아요.</div>
					<div class="col-xs-1 faqIcons">
						<div class="faqIconOne">
							<img src="/resources/icon/bottum.png"/>
						</div>
					</div>
				</div>
				<div class="row faqConAns">
					<div class="faqConAnsSize">
						<div>A. 후기의 경우 샐러드를 주문해주신 날짜를 기준으로 30일 이내에 작성해주셔야 합니다. <br />
						30일 이내의 주문건임에도 적립금이 지급되지 않았다면<br/>
						후기 양식에 맞게 작성되지 않았을 수 있으니 참고 부탁드립니다.<br/><br/>
						<span style="font-size:15px;"> 텍스트후기(500p) : 텍스트 50자 이상</span><br/>
						<span style="font-size:15px;"> 포토후기(500p) : 제품 또는 사용사진</span><br/>
						<span style="font-size:15px;"> 포토텍스트후기(1000p) : 제품 또는 사용사진과 텍스트 50자 이상(글자 중복은 제외됩니다.)</span><br/>
						<span style="font-size:15px;"> 포토텍스트후기(1000p) : 제품 또는 사용사진과 텍스트 50자 이상(글자 중복은 제외됩니다.)</span><br/><br/>
						<span style="color:#e9af8e;">* 위의 조건에 했음에도 적립금이 들어오지 않는다면 Q&A 문의글을 작성해주시기 바랍니다.</span>
						</div>
					</div>
				</div> 
			</div>
			<!-- Q5 -->
			<div class="faqMargin">
				<div class="row faqConType">
					<div class="col-xs-11 faqConSub">Q. 샐러드 먹은 후 부작용이 생겼을 경우 어떻게 하나요?</div>
					<div class="col-xs-1 faqIcons">
						<div class="faqIconOne">
							<img src="/resources/icon/bottum.png"/>
						</div>
					</div>
				</div>
				<div class="row faqConAns">
					<div class="faqConAnsSize">
						<div>A. 제품을 먹은 기준으로 20일 이내 고객센터 또는 Q&A게시판에 문의글을 작성해주시기 바랍니다. <br/>
						해당 제품으로 인한 부작용이라는 전문의 확진서가 있을 시 전액 환불이 가능합니다.<br/><br/>
						<span style="font-size:15px; color:#e9af8e;">* 단, 고객님의 특정 알레르기 진단일 경우 본인에게 책임이 있습니다.</span>
						</div>
					</div>
				</div> 
			</div>
			<!-- content end -->
		</div>
	</div>
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<jsp:include page="/resources/template/footer.jsp"></jsp:include>
</body></html>
