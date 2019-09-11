<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>    
    <jsp:include page="/resources/template/head.jsp"/>
    <style type="text/css">
#title {
        margin-top: 3%;
        margin-bottom: 3%;
    }
	
    h1 {
        width: 60%;
        border-bottom: 2px solid darksalmon;
        text-align: center;
        margin: 0px auto;
        padding-bottom: 3%;
    }
	
   #content{
   	display:flex;
   
   }
   #ctgcontent{
   	margin-left:4%;
   }
   #summary{
   	margin-right:3%;
   }
    .tab{
    	margin-top: 30px;
    	width:100%;   	
	}
	.tab .nav-tabs{
	    border:none;
	    border-bottom: 2px solid white;
	}
	.nav-tabs li{
		width:33.3%;
	}
	.nav-tabs li a{
		border-right:3px solid #ededed;
		border-left:3px solid #ededed;
		border-bottom:3px solid #ededed;
		text-align:center;
		border-radius:20px 20px 0px 0px;
		border-top:3px solid #ededed;
		background-color:darksalmon;
		color:white;
		font-weight:bold;
		transition:all 0.3s ease-in 0s;
	}
	.nav-tabs li a:hover{
	    background-color: white;
	    color:black;
	}
	.nav-tabs li.active a,
	.nav-tabs li.active a:focus,
	.nav-tabs li.active a:hover{
	    border-top: 3px solid darksalmon;
	    border-right:3px solid #ededed;
	    border-left:3px solid #ededed;
	    color: black;
	    background-color:white;
	    border-bottom:3px solid white;
	    border-radius:20px 20px 0px 0px;
	}
	
	.tab .tab-content{
		margin-top:0px;
	    padding: 20px;
	    line-height: 22px;
	    box-shadow:0px 1px 0px #808080;
	    width:100%;
	    margin:0px auto;
	    padding:0px auto;
	    border-radius:5px 5px 0px 0px;
	    border-top:0;
	    border-right:2px solid #ededed;
	    border-left:2px solid #ededed;
	    border-bottom:2px solid #ededed;
	}
	.tab .tab-content h3{
	    margin-top: 0;
	}
	.tab-pane{
		width:100%;
		margin-bottom:30px;
	}
	
	.selectctg{
		width:100%;
    	text-align:center;
    	margin-bottom:5%;
	}
	.selectctgbtn1{/*야채카테고리*/
    	background-color:white;
    	border-radius:20px 20px 20px 20px;
    	border:2px solid darksalmon;
    	font-size:12px;
    	font-weight:bold;
    	color:black;
    	width:23%;
    }
    .selectctgbtn2{/*토핑카테고리*/
    	background-color:white;
    	border-radius:20px 20px 20px 20px;
    	border:2px solid darksalmon;
    	font-size:12px;
    	font-weight:bold;
    	color:black;
    	width:45%;
    }
	.row{
		margin-top:3%;
	}
	.select{
		width:100%;	
		background-color:white;
		border-radius: 25px 25px 25px 25px;
	}
	.selectimg{
		width:100%;
		border-radius :25px 25px 25px 25px;
		border:1px solid white;
	}
	
    /*-----------*/
    .selectcheck{
    	text-align:center;
    }
    input[type="checkbox"]{
    	width:16px;
    	height:16px;
    	line-height:10px;
    }   
   
    /*-------------------content2-------------------*/
    #example {
        padding:0px auto;
        display:inline-block;
    }
    /*-------------------content2 : plate-------------------*/
    #plate{
    	width:100%;
    	margin:3% auto;
    	text-align:center;
    }
    #plateimg {
        width: 100%;
        background-color:darksalmon;
        border-radius:5% 5% 5% 5%;
    }
    #plateSize{
    	margin-top:30px;
	    width:100%;
	    text-align:center;
	    font-size:16px;
	    
    }
	/*-------------------content3 : summary-------------------*/
    #summary {
        border: 3px solid #ededed;
        border-radius:25px 25px 0px 0px;
        width: 100%;
        background-color:darksalmon;
        margin-top:30px;
        margin-bottom:30px;
    }
    .summaryTitle>p{
    	font-size:25px;
    	font-weight:bold;
    	text-align:center;
    	color:white;
    	margin:3% auto;
    }
    table{
    	border:3px solid white;
    	width:100%;
    	background-color:white;
    	font-size:18px;
    	margin-bottom:10px;
    }
    
    th{
    	width:100%;
    	height:40px;
    	text-align:center;
    	border:3px white;
    	background-color:#ededed;
    }  
    tr, td{
    	height:40px;
    	width:100%;
    	border-bottom:3px solid #ededed;
    	text-align:center;
    }
    #count{
    	display:flex;
    	width:100%;
    }
    .countBtn{
    	border:1px solid gray;
    	background-color:#ededed;
    	width:30px;
    	height:20px;
    	font-szie:20px;
    	color:gray;
    	margin:0px auto;
    	line-height:5px;
    }
    .num{
    	width:40px;
    	height:20px;
    }
    .summarytotal{
    	width:100%;
    	padding:10px;
    	background-color:white;
    	border:2px solid #ededed;
    	margin-bottom:10px;
    	display:flex; 	
    }
    .summarytotal>*{
    	padidng:0px auto;
		margin:0px auto;
	}
    .summarytotal p{
    	font-size:20px;
    	font-weight:bold;
    	text-align:center;
    }
    .summarytotal input{
    	margin:0px auto;
	    width:35%;
	    height:28px;
	    
    }
    .nextBtn{
	    	width:100%;
	    	margin-bottom:50px;
	    	margin:0px auto;
	    	display:inline-block;
	    }
	.save{
	    	width:100%;
	    	height:40px;
	    	font-size:14px;
	    	font-weight:bold;
	    	border:1px solid black;
	    	border-radius:25px 25px 25px 25px;
	    	background-color:white;
	    	margin:0 auto;
	    	margin-bottom:3%;
	    	
	    }
  	@media only screen and (max-width: 767px){/*----------------------반응형--------------------*/
	    .nav-tabs li{
	        width:100%;
	    }
	    .nav-tabs li a{
	    	border-radius:0px 0px 0px 0px;
	    }
	    .nav-tabs li.active a,
	    .nav-tabs li.active a:focus,
	    .nav-tabs li.active a:hover{
	        padding: 15px;
	        margin-top: 0px;
	    }
	    #content{
	    	display:inline-block;
	    }
	    .selectctgbtn1{/*야채카테고리*/
	    	background-color:white;
	    	border-radius:20px 20px 20px 20px;
	    	border:2px solid darksalmon;
	    	font-size:15px;
	    	font-weight:bold;
	    	color:black;
	    	width:23%;
	    }
	    .selectctgbtn2{/*토핑카테고리*/
	    	background-color:white;
	    	border-radius:20px 20px 20px 20px;
	    	border:2px solid darksalmon;
	    	font-size:15px;
	    	font-weight:bold;
	    	color:black;
	    	width:45%;
	    	height:30px;
	    }
	    #example{
	    	margin-top:30px;
	    }
	     #plate{
	    	width:100%;
	    	margin:5% auto;
	    	text-align:center;
	    }
	    #plateimg {	    	
	        width: 100%;
	    }
	    #plateSize{
	    	margin-top:20px;
	    	width:100%;
	    	text-align:center;
	    }
	    #ctgcontent{
		   	margin-left:0%;
		}
		#countInput{
	    	width:50px;
	    	height:20px;
	    	text-align:center;
	    }
		#summary{
		   	margin-right:0%;
		}
		.summarytotal{
    		padding:10px;
		}
		.summarytotal>*{
			margin:0px auto;
		}
		.summarytotal p{
			text-align:center;
	    	font-size:18px;
	    }
	    .summarytotal input{
	    	margin:0px auto;
	    	width:50%;
	    	height:28px;
	    }
	    .nextBtn{
	    	width:100%;
	    	margin-bottom:100px;
	    }
	    .save{
	    	width:100%;
	    	height:50px;
	    	font-size:15px;
	    	font-weight:bold;
	    	border:1px solid black;
	    	border-radius:25px 25px 25px 25px;
	    	background-color:white;
	    }
}
    </style>
    <script type="text/javascript">
    $(document).ready(function(){
    	/*-----------페이지------------*/
    	 	$("#vegepage2,#vegepage3,#vegepage4,#toppingpage2").hide();
    		$("#vege1").click(function(){
    			$('#vegepage2,#vegepage3,#vegepage4').hide();
    			$("#vegepage1").fadeIn().show();
    		});
    		$("#vege2").click(function(){
    			$('#vegepage1,#vegepage3,#vegepage4').hide();
    			$("#vegepage2").fadeIn().show();
    		});
    		$("#vege3").click(function(){
    			$(this).addClass("active");
    			$('#vegepage1,#vegepage2,#vegepage4').hide();
    			$("#vegepage3").fadeIn().show();
    		});
    		$("#vege4").click(function(){
    			$(this).addClass("active");
    			$('#vegepage1,#vegepage2,#vegepage3').hide();
    			$("#vegepage4").fadeIn().show();
    		});
    		$("#maintopping").click(function(){
    			$('#toppingpage2').hide();
    			$("#toppingpage1").fadeIn().show();
    		});
    		$("#subtopping").click(function(){
    			$('#toppingpage1').hide();
    			$("#toppingpage2").fadeIn().show();
    		});
    		$('.save').mouseover(function(){
    			$(this).css({
    				'background-color':'darksalmon',
    				'color':'white'	
    			});	
    		}).mouseout(function(){
    			$(this).css({
    				'background-color':'white',
    				'color':'black'	
    			});	
    		});
    		$('#Allcancel').click(function(){
    			$('.vegetable tbody tr').remove();
    			$('.toppingtable tbody tr').remove();
    			$('.saucetable tbody tr').remove();
    			$('#totalP').val(0);
    			$('input[type="checkbox"]').attr("checked",false);
    			$('input[type="checkbox"]').next().css("color","black");
    		});
    	});
    		  var arraylist=[];//장바구니
    		  var arraynum=[];
    		  var pricelist=[];//합계가격
    		  function up(num){
    				var num = num;
    				var cntID = '#countInput'+num;
    				var cnt = Number($(cntID).val());
    				$(cntID).val(++cnt);
    				//$('#price'+num+'').html($('#price'+num+'').text()+$('#countInput'+num+'').val());
    				price(cnt,num);
    				totalprice();
    			}
    			function down(num){
    				var id="#vegecb"+num;
    				var idarray = id.split('#');
    				var inputID = idarray[1];//vegecb1
    				var num = num;
    				var cntID='#countInput'+num;
    				var cnt = Number($(cntID).val());
    				$(cntID).val(--cnt);
    				price(cnt,num);
    				totalprice();
    				if(cnt<1){
    					var mincount = 1;
    					$(cntID).val(mincount);
    					$('#price'+num+'').text($('label[for='+inputID+']').attr('id')+"원");
    				}
    			}
    			
    	function item_click(num){
    		   var id="#vegecb"+num;
    		   var upId="up"+num;
    		   var downId="down"+num;
    		   var table1='<tr id="'+num+'"><td class="col-md-4 col-xs-4" id="chkname">';
    		   var table2='</td><td class="col-md-4 col-xs-4"><div id="count"><button type="button" class="countBtn" id="'+downId+
    		   			'" onclick="down('+num+')">-</button><input type="text" style="text-align:center" name="countIp" value="1" id="countInput'+num+'" class="num" readonly="readonly"/>'+
    		   			'<button type="button" class="countBtn" id="'+upId+'" onclick="up('+num+')">+</button></div></td><td class="col-md-4 col-xs-4" id="price'+num+'">';
    		   var table3='</td></tr>';
    		   if($(id).is(":checked")){
    			   
    			   var idarray = id.split('#');
    			   var inputId = idarray[1];//vegecb1
    			   var labeltext =$('label[for='+inputId+']').text();//채소1
    			   var labelid=$('label[for='+inputId+']').attr('id');//500
    			   
    			   arraylist.push($('label[for='+inputId+']').text());
    			   arraynum.push(num);
    			   
    		      $(id).next().css('color','darksalmon');
    			  if(num<7){
    			      $('.vegetable tbody').append(table1+$('label[for='+inputId+']').text()+table2+$('#price'+num+'').text()+'원'+table3);
    		   		price(1,num);
    		   		totalprice();
    		   			if($('.vegetable tbody tr').length>4){
    					}
    			  }
    			  if(num>=7){
    				  $('.toppingtable tbody').append(table1+$('label[for='+inputId+']').text()+table2+$('#price'+num+'').text()+'원'+table3);
    				  price(1,num);
    				  totalprice();
    				  	if($('.toppingtable tbody tr').length>6){
    					}
    			  }if(num>10){
    				  $('.saucetable tbody').append(table1+$('label[for='+inputId+']').text()+table2+$('#price'+num+'').text()+'원'+table3);
    				  price(1,num);
    				  totalprice();
    				  	if($('.saucetable tbody tr').length>3){
    					}
    			  }
    			//수량버튼 hover
    		      $("#"+upId).mouseover(function(){
    			  		$("#"+upId).css('background-color','darksalmon');
    			  }).mouseout(function(){
    			  		$("#"+upId).css('background-color','white');
    			  });

    			  $("#"+downId).mouseover(function(){
    			  		$("#"+downId).css('background-color','darksalmon');
    			  }).mouseout(function(){
    			  		$("#"+downId).css('background-color','white');
    			  });
    			  
    		   }else if($(id).is(":checked")==false){//체크해제됐을때
    			      $(id).next().css('color','black');
    			      $('tr[id="'+num+'"]').remove();
    			      arraylist.splice(arraylist.indexOf(num),1);
    			      arraynum.splice(arraynum.indexOf(num),1); 
    			   }
    	}//체크됐을때 summary
    	function price(cnt,num){//각 수량에 따른 가격
    		var id="#vegecb"+num;
    		var idarray = id.split('#');
    		var inputID = idarray[1];//vegecb1
    		var labelId = Number($('label[for='+inputID+']').attr('id'));
    		var price = labelId;
    		var total;
    		total=price*cnt;
    		$('#price'+num+'').text(total+"원");
    	}
    	//아이템클릭-다운/업클릭(cnt)=>각가격/ 합계 변동
    	function totalprice(){
    		var priceSplit = $('td:nth-child(3)').text().split("원");//각 가격
    		var priceSplitNumber = [];
    		var totalp=0;//0
    		for(var i=0;i<priceSplit.length-1;i++){		
    			priceSplitNumber.push(Number(priceSplit[i]));
    			totalp+=priceSplitNumber[i];
    		}
    		$('#totalP').val(totalp);
    	}
    	//그릇선택
    	function sizeSelect(num){
    		var table1='<tr id="'+num+'"><td class="col-md-4 col-xs-4" id="chkname">';
    		var table2='</td><td class="col-md-4 col-xs-4"></td><td class="col-md-4 col-xs-4" id="price'+num+'">';
    		var table3='</td></tr>';
    		
    		var sizeId="#size"+num;
    		var sizeidarray = sizeId.split('#');
    		var sizeInput = sizeidarray[1];//size1
    		var labeltext =$('label[for='+sizeInput+']').text();//small
    		
    		$('.sizetable tbody tr').remove();
    		$('input[type="radio"]').next().css('color','black');
    		if($(sizeId).is(":checked")){
    			$('.sizetable tbody').append(table1+$('label[for='+sizeInput+']').text()+table2+$('label[for='+sizeInput+']').attr('id')+'원'+table3);
    			totalprice();
    			$(sizeId).next().css('color','darksalmon');
    			arraylist.unshift(labeltext);	
    	   }
    	}
    	/*
    	 $('td:nth-child(3)').text(); : 가격리스트
    	 $('td:nth-child(1)').text(); : 구매목록리스트
    	 $('.sizetable tbody tr').text()  : 각 박스별 리스트(.sizetable tbody, .vegetable tbody)
    	 
    	 */
 </script>
</head>
<body>
   <!-- ***********************************header start*********************************** -->
   <jsp:include page="/resources/template/header_custom.jsp"/>
   <!-- ***********************************content start*********************************** -->
    <div class="container">
        <div class="col-md-6 col-md-offset-3" id="title">
            <h1> 커스텀 샐러드 </h1>
        </div>
     </div>
        <div class="col-md-12 col-xs-12" id="content">
            <div class="col-md-3 col-xs-12" id="ctgcontent">
            	<div class="tab" id="ctg">
	                <ul class="nav nav-tabs" id="ctglist">
	                    <li class="active" id="vege"><a href="#vegetab" data-toggle="tab">야채</a></li>
	                    <li id="toppping"><a href="#toppingtab" data-toggle="tab">토핑</a></li>
	                    <li id="sauce"><a href="#saucetab" data-toggle="tab">소스</a></li>
	                </ul>
	                <div class="tab-content tab" id="ctgdiv"><!-- move page -->	                	
	                	
	                    <div role="tabpane1" class="tab-pane fade in active" id="vegetab">
	                    	<div class="selectctg" id="vegetasteselect">
		                		<button class="selectctgbtn1" name="taste" id="vege1">씁쓸한 맛</button>
		                		<button class="selectctgbtn1" name="taste" id="vege2">아삭한 맛</button>
		                		<button class="selectctgbtn1" name="taste" id="vege3" >순한 맛</button>
		                		<button class="selectctgbtn1" name="taste" id="vege4">매운 맛</button>
		                	</div>
		                	<div id="vegepage1">
	                    		<div class="row" id="vegetabli1">
	                    			<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/custom_abocado_s.png" alt="" class="selectimg" >
	                    				<div class="selectcheck">
	                    					<input type="checkbox" id="vegecb1" name="vegechk" class="check_box" onclick="item_click(1)">
	                    					<label for="vegecb1" id="400">채소1</label>
	                    				</div>
		                    		</div></div>
			                   		<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/custom_rucola_s.png" alt="" class="selectimg">
			                   				<div class="selectcheck">
		                    					<input type="checkbox" id="vegecb2" name="vegechk" class="check_box" onclick="item_click(2)">
		                    					<label for="vegecb2" id="500">채소2</label>
		                    				</div>
			                   		</div></div>
									<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/example.PNG" alt="" class="selectimg">
										<div class="selectcheck">
		                    				<input type="checkbox" id="vegecb3" name="vegechk" class="check_box"  onclick="item_click(3)">
		                    				<label for="vegecb3" id="300">채소3</label>
		                    			</div>
									</div></div>
	                    		</div>
	                    	</div>
	                    	<div id="vegepage2">
	                    		<div class="row" id="vegetabli2">
	                    			<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/example.PNG" alt="" class="selectimg">
		                    			<div class="selectcheck">
		                    				<input type="checkbox" id="vegecb4" name="vegechk" class="check_box" onclick="item_click(4)">
		                    				<label for="vegecb4" id="200">채소4</label>
		                    			</div>
		                    		</div></div>
			                   		<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/example.PNG" alt="" class="selectimg">
			                   			<div class="selectcheck">
		                    				<input type="checkbox" id="vegecb5" name="vegechk" class="check_box" onclick="item_click(5)">
		                    				<label for="vegecb5" id="100">채소5</label>
		                    			</div>
			                   		</div></div>
									<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/example.PNG" alt="" class="selectimg">
										<div class="selectcheck">
		                    				<input type="checkbox" id="vegecb6" name="vegechkx" class="check_box" onclick="item_click(6)">
		                    				<label for="vegecb6" id="300">채소6</label>
		                    			</div>
									</div></div>
	                    		</div>
	                    	</div>
	                    </div>

	                    <div role="tabpane2" class="tab-pane fade" id="toppingtab">
	                    	<div class="selectctg" id="toppingselect">
		                		<button class="selectctgbtn2" id="maintopping" >고기/햄/생선</button>
		                		<button class="selectctgbtn2" id="subtopping">과일/치즈</button>
		                	</div>		
		                	<div id="toppingpage1">                	
	                    		<div class="row" id="toppingtabli1">
	                    			<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/example.PNG" alt="" class="selectimg">
		                    			<div class="selectcheck">
		                    				<input type="checkbox" id="vegecb7" name="topchk" class="check_box" onclick="item_click(7)">
		                    				<label for="vegecb7" id="600">과일1</label>
		                    			</div>
		                    		</div></div>
	                    		</div>
	                    	</div>
	                    	<div id="toppingpage2">
	                    		<div class="row" id="toppingtabli1">
	                    			<div class="col-md-4 col-xs-4"><div class="select"><img src="/resources/imgs/example.PNG" alt="" class="selectimg">
		                    			<div class="selectcheck">
		                    				<input type="checkbox" id="vegecb8" name="topchk" class="check_box" onclick="item_click(8)">
		                    				<label for="vegecb8" id="900">과일2</label>
		                    			</div>
		                    		</div></div>
	                    		</div>
	                    	</div>
	                 	</div>
	                    
	                 	<div role="tabpane3" class="tab-pane fade" id="saucetab">
	                    	
	                 	</div>
	            	</div>
	            </div>
            </div>
            <div class="col-md-5 col-xs-12" id="example">
            	<div class = "col-md-12 col-xs-12" id="plateSize">
            		<input type="radio" id="size1" class="check_box size" checked="checked" name="radiobox" value="small" onclick="sizeSelect(1)">
	                <label for="size1" id="0">small</label>
	                <input type="radio" id="size2" class="check_box size" name="radiobox" value="middle" onclick="sizeSelect(2)">
	                <label for="size2" id="500">middle</label>
	                <input type="radio" id="size3"class="check_box size" name="radiobox" value="big" onclick="sizeSelect(3)">
	                <label for="size3" id="1000">big</label>
            	</div>
            	<div class="col-md-12 col-xs-12" id="plate">
            		<img src="/resources/imgs/plate.png" alt="" id="plateimg">
            	</div>
          	</div>
          	<div class="col-md-3 col-xs-12">
          		<div class="col-md-12 com-xs-12" id="summary">
          			<div class="summaryTitle">
          				<p>My recipe</p>
          			</div>
          			<div class="summaryContent">
          				<table class="col-md-12 col-xs-12 sizetable" id="summaryContentTable">
          					<thead>
          						<th class="col-md-4 col-xs-4"></th>
          						<th class="col-md-4 col-xs-4">크기</th>
          						<th class="col-md-4 col-xs-4"></th>
          					</thead>
          					<tbody>
          						<tr id="1"><td class="col-md-4 col-xs-4" id="chkname">small
          						</td><td class="col-md-4 col-xs-4"></td><td class="col-md-4 col-xs-4" id="price1">0원
          						</td></tr>
          					</tbody>          					
						</table>
          				<table class="col-md-12 col-xs-12 vegetable" id="summaryContentTable">
          					<thead>
          						<th class="col-md-4 col-xs-4"></th>
          						<th class="col-md-4 col-xs-4">야	채</th>
          						<th class="col-md-4 col-xs-4"></th>
          					</thead>
          					<tbody>
          					</tbody>          					
						</table>
						<table class="col-md-12 col-xs-12 toppingtable" id="summaryContentTable">
          					<thead>
          						<th class="col-md-4 col-xs-4"></th>
          						<th class="col-md-4 col-xs-4">토	핑</th>
          						<th class="col-md-4 col-xs-4"></th>
          					</thead>
          					<tbody>
          					</tbody>          					
						</table>
						<table class="col-md-12 col-xs-12 saucetable" id="summaryContentTable">
          					<thead>
          						<th class="col-md-4 col-xs-4"></th>
          						<th class="col-md-4 col-xs-4">소	스</th>
          						<th class="col-md-4 col-xs-4"></th>
          					</thead>
          					<tbody>
          					</tbody>          					
						</table>
          			</div>
          			<div class="summarytotal">
          				<p>총 상품금액 : </p><input type="text" style="text-align:right" readonly="readonly" id="totalP" value="0" ><p>원</p>
          				<!-- 아이디매치로 가져오기 -->
          			</div>
          		</div>
          		<div class="col-md-12 col-xs-12 nextBtn" id="summarybtn_save"><!-- 버튼기능아직없음-->
	          		<button class="col-xs-12 save" type="button" id="saveMy">마이레시피로 저장</button>
	          		<button class="col-xs-12 save" type="button" id="saveCart">장바구니에 담기</button>
	          		<button class="col-xs-12 save" type="button" id="Allcancel">
	          			<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
	          		</button>
	          	</div>
          	</div>
    </div>
    <jsp:include page="/resources/template/footer.jsp"/>
</body>
</html>
