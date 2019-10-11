<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style>
	nav {
		margin-bottom: 0;
	}
	section {
		width: 1070px;
		margin: 0 auto;
		overflow: hidden;
		background-color: white;
		border-left: 1px solid #d6d3d3;
		border-right: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	.res_sec_left {
		float: left;
		width: 19.7%;
	}
	.res_sec_right {
		float: left;
		width: 80%;
		border-left: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	#res_list {
		padding: 0 30px;
	}
	#res_back {
		background: url("${pageContext.request.contextPath}/resources/images/notice/cmt_snv_tit_bg.png") no-repeat;
		background-size: 100%;
		padding-left: 20px;
	}
	#res_back span {
		display: inline-block;
		margin-top: 40px;
		font-size: 0.7em;
		color: #ccc;
	}
	#res_back h3 {
		margin-bottom: 50px;
	}
	.res_sec_left p {
		border-top: 1px solid #aaa;
		padding: 10px 20px;
	}
	.res_sec_left p:last-child {
		border-bottom: 1px solid #aaa;
	}
	.res_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	#res_back2 {
		background: url("${pageContext.request.contextPath}/resources/images/res/tra_visual01.jpg") no-repeat right top;
		padding-left: 30px;
	}
	#res_back2 p {
		padding-top: 40px;
	}
	#res_back2 p a {
		font-size: 0.8em;
		color: #666;
		text-decoration: none;
	}
	#res_back2 h1 {
		padding-top: 10px;
		font-size: 30px;
	}
	#orderWrap {
		float: right;
		margin: 40px 30px 10px 0;
	}
	.clear { 
		clear: both;
	}
	#res_list {
		padding: 0 30px;
	}
	
	
	#chpwWrap {
		overflow: hidden;
		margin-top: 40px;
		font-size: 0.8em;
	}
	#chpwWrap b {
		font-size: 1.2em;
		padding-bottom: 5px;
		display: inline-block;
	}
	#pwLeft {
		float: left;
		width: 45%;
		border-right: 2px solid #cfcfcf;
		padding: 10px 15px;
	}
	#pwRight {
		float: right;
		width: 45%;
		padding: 10px;
	}
	.btns {
		float: right;
		margin-top: 10px;
	}
	#updatetpwBtn, #updatepwBtn {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		padding: 5px 15px;
		color: white;
		border: 1.5px solid #16539f;
	}
	.txt_blu {
		color: #3590d2;
	}
	th {
		background-color: #F8F8F8;
	}
	td {
		padding-left: 10px;
	}
	.backcolor {
		background-color: #e0eaf7;
	}
	#confirmPw, #confirmTpw {
		background-color: #8C8C8C;
		color: white;
		padding: 3px 5px;
		border: none;
		border-radius: 5px;
		margin-top: 5px;
	}
	
	
	#res_list img {
		display : inline-block;
		margin-top: 20px;
	}
	#res_list input[type="text"] {
		width: 200px;
		padding: 3px 0;
		margin-top: 10px;
	}
	#res_list >span {
		font-size: 0.9em;
	}
	#res_list button {
		background-color: #8C8C8C;
	    color: white;
	    padding: 5px 10px;
	    border: none;
	    border-radius: 2px;
	    padding-top: 3px;
	    display: inline-block;
	}
	.reg {
		color: red;
		display: none;
		font-size: 0.8em;
	}
	.pt {
		color: #5D5D5D;
		font-size: 0.8em;
		margin-left: 5px;
		display: inline-block;
	}
	
	/*--------------handlebars---------------------*/
	table {
		border-collapse: collapse;
		border-top: 2px solid black;
		width: 100%;
		margin: 20px 0 10px 0;
		font-size: 0.9em;
	}
	th, td {
		border-top: 1px solid #d6d3d3;
		border-bottom: 1px solid #d6d3d3;
		padding: 10px 0;
		text-align: center;
	}
	th {
		background-color: #F8F8F8;
		border-bottom: 2px solid #d6d3d3;
	}
	.norList {
		padding: 30px 0;
	}
	
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.2.0/handlebars.min.js"></script>
<script id="template" type="text/x-handlebars-template">
	<tr>
		<th>예매날짜</th>
		<th>선택좌석</th>
		<th>출발정보</th>
		<th>도착정보</th>
	</tr>	
	{{#each.}}
	<tr>
		<td>{{tempdate resDate}}</td>					
		<td>{{tsCar.tsCar}}호차 {{tsCar.tsNo}}.</td>
		<td>{{ttNo.tCode.tStart.nodename}} <br> {{tempdate ttNo.tCode.tStartTime}}</td>
		<td>{{ttNo.nodeid.nodename}} <br> {{tempdate ttNo.tCode.tArriveTime}}</td>
	</tr>
	{{/each}}
</script>

<script>
	Handlebars.registerHelper("tempdate", function(time){ //helper를 만들어서 적용시킬 수 있다.
		var date = new Date(time);
		var month = date.getMonth() + 1;
		var day = date.getDate();
		var hour = date.getHours();
		var minute = ("00"+date.getMinutes()).slice(-2);
		
		return month + "월 " + day + "일 " + hour + "시 " + minute + "분";
	})
	
	$(function() {
		$("button").click(function() {
			$(".reg").css("display", "none");
			
			var reg_tel = /^(010|011|016|017|018)[-]{1}[0-9]{3,4}[-]{1}[0-9]{4}$/;
			
			if($("input[name='nomemPhone']").val() == "" || reg_tel.test($("input[name='nomemPhone']").val()) == false) {
				$("input[name='nomemPhone']").nextAll(".reg").css("display", "inline");
				return false;
			}	
						
			$("#list").empty();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/res/searchRes",
				type : "post",
				data : {"nomemPhone":$("input[name='nomemPhone']").val()},
				dataType: "json",
				success : function(res) {
					console.log(res);
						
					var source = $("#template").html();
					var func = Handlebars.compile(source);
					var str = func(res);
					$("#list").append(str); 
					
					if(res.length == 0) {
						var tr = $("<tr>");
						var td = $("<td colspan='4' class='norList'>").text("조회하신 번호의 예매내역이 없습니다.");
						
						tr.append(td);
						$("#list").append(tr);
					}
				}
			})
		})
	})
</script>

	<section>
		<div class="res_sec_left">
			<div id="res_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>승차권</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/res/reservation"><p>승차권예약</p></a>
				<a href="${pageContext.request.contextPath}/res/searchRes"><p class="res_color">승차권조회</p></a>
			</div>
		</div>
		<div class="res_sec_right">
			<div id="res_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">승차권</a> > 
					<a href="${pageContext.request.contextPath}/">승차권조회</a> >
					<a href="${pageContext.request.contextPath}/">일반승차권</a></p>
				<h1>일반승차권</h1>
				<div id="orderWrap">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck01_on.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck02.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck03.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck04.png">
				</div>
				<div class="clear"></div>
			</div>
			<div id="res_list">
				<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <span>휴대폰 번호를 입력하시면, 예매내역을 확인하실 수 있습니다.</span> <br>
				<input type="text" name="nomemPhone"><span class="pt">-를 포함한 휴대폰번호</span>
				<button>조회</button><br>
				<span class="reg">-를 포함한 휴대폰번호를 다시 입력해주세요</span>
				
				<div>
					<table id="list">
					</table>
				</div>
			</div>
		</div>
	</section>
	
<%@ include file="../include/footer.jsp" %>