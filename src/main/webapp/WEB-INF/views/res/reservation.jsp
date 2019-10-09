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
	
	table {
		border-collapse: collapse;
		width: 100%;
	}
	td, th {
		border: 1px solid #aaa;
		padding: 10px 20px;
		text-align: center;
	}
	table tr:first-child {
		background-color: #f8f8f8;
	}
	table th:first-child, table td:first-child {
		border-left: none;
	}
	table th:last-child, .price {
		border-right: none;
	}
	tabld td img {
		width: 100%;
	}
	#resForm {
		overflow: hidden;
	}
	/* .searchSeat, .searchSeatRan {
		display: block;
	}
	.searchSeatRan {
		margin-bottom: 5px;
	} */
	#personnelInfo {
		border: 1px solid #c1c1c1;
		box-shadow: 2px 2px 0 rgba(0,0,0,0.1);
		background-color: white;
		width:30%;
		float: left;
		margin-right: 6px;
		padding: 15px 25px;
	}
	#personnelInfo > label {
		display: block;
		font-weight: bold;
		color: #464646;
		font-size: 14px;
		margin-bottom: 5px;
	}
	#personnelInfo > select {
		padding: 3px 0;
		width: 150px;
		margin-bottom: 5px;
	}
	#trainInfo {
		border: 4px solid #0095cd;
		background-color: #ecf1f4;
		width:55%;
		float: left;
		padding: 15px 25px;
		color: #383d41;
	}
	#trainInfo > ul {
		border: 1px solid #dadada;
		background-color: white;
		margin: 0 auto;
		padding: 10px 20px;
		color: #0097d0;
		font-weight: bold;
		font-size: 0.9em;
		margin-bottom: 15px;
	}
	#trainInfo > ul li {
		width: 120px;
		display: inline-block;
	}
	#trainInfo > ul li:nth-child(4) {
		margin-left: 125px;
		margin-top: 7px;
	}
	#trainInfo > label {
		color: #266dc8;
		font-weight: bold;
		font-size: 0.8em;
		margin: 0 10px 0 5px;
	}
	#trainInfo select, #trainInfo input[type="text"] {
		padding: 3px 0;
		border: 1px solid #2876d6;
		width: 200px;
		margin-bottom: 3px;
		color: #383d41;
	}
	#search {
		clear: both;
		display: block;
		float: right;
		margin: 3px 4px 0 0;
	}
	#startWrap {
		overflow: hidden;
		display: inline;
		float: right;
		margin-right: 42px;
	}
	#startWrap > select, #startWrap > span {
		width: auto !important;
		float: left;
	}
	#startWrap > input[type="text"] {
		width: 23px;
		float: left;
	}
	#startWrap > span {
		font-size: 0.8em;
		margin-right: 5px;
		padding-top: 3px;
	}
	#ultext {
		list-style: square;
		color: #333;
		font-size: 14px;
		margin: 50px 0 15px 20px;
	}
	
	
	
	/* ========== ajax로 추가한 부분 css ========== */
	.car {
		width: 60px;
		height: 44px;
		float: left;
		margin-right: 20px;
		background: url("${pageContext.request.contextPath}/resources/images/res/seat_num_bg.png") repeat-x;
		background-size: 100% 100%;
		color: #666;
		font-weight: bold;
		text-align: center;
		line-height: 40px;
		cursor: pointer;
	}
	.carColor {
		background: url("${pageContext.request.contextPath}/resources/images/res/seat_num_on.png") repeat-x;
		color: white;
	}
	.seat {
		width: 50px;
		height: 35px;
		line-height: 35px;
		float: left;
		text-align: center;
		font-weight: bold;
		color: white;
		background: url("${pageContext.request.contextPath}/resources/images/res/seat_o.png") no-repeat;
		background-size: 100% 100%;
		cursor: pointer;
	}
	.seatn {
		width: 50px;
		height: 35px;
		line-height: 35px;
		float: left;
		text-align: center;
		font-weight: bold;
		color: white;
		background: url("${pageContext.request.contextPath}/resources/images/res/seat_n.png") no-repeat;
		background-size: 100% 100%;
	}
	.selSeat {
		margin-left: 10px;
		color: #1890D7;
		font-weight: bold;
	}
	
	/*---------------- 값 저장하려고 만든 span태그 ---------------------*/
	.none {
		display: none;
	}
	
	/* ---------------------------modal----------------------------- */
	/* The Modal (background) */
	.modal {
	    display: none; /* Hidden by default */
	    position: fixed; /* Stay in place */
	    z-index: 1; /* Sit on top */
	    left: 0;
	    top: 0;
	    width: 100%; /* Full width */
	    height: 100%; /* Full height */
	    overflow: auto; /* Enable scroll if needed */
	    background-color: rgb(0,0,0); /* Fallback color */
	    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
	    background-color: #0066a8;/*02418c */
	    margin: 3% auto;
	    padding: 10px 0;
	    width: 80%;
	    color: #727272;
	    overflow: hidden;                       
	}
	.modal-content h3 {
		color: white;
		display: inline-block;
		margin-left: 10px;
	}
	.modal-content > img {
		float: right;
		margin-right: 10px;
	}
	#wrap {
		width: 95%;
		margin: 10px auto;
		background-color: white;
		padding: 20px;
		font-size: 14px;
		clear: both;
	}
	.modal-content .num {
		display: inline-block;
		width: 13px;
		background-color: #656565;
		color: white;
		text-align: center;
		font-size: 12px;
		font-weight: bold;
		margin-right: 5px;
	}
	.red {
		color: #d4226d;
	}
	#carList {
		overflow: hidden;
		margin-top: 40px;
	}
	#seatInfo {
		color: black;
		overflow: hidden;
		margin-top: 20px;
	}
	#sNum, #sWrap {
		display: inline-block;
		float: left;
	}
	#sNum {
		border: 2px solid black;
		padding: 5px 20px;
		border-bottom: none;
	}
	#sWrap {
		border-bottom: 2px solid black;
		width: 100%;
	}
	#imgWrap {
		float: right;
	}
	#imgWrap > img, #imgWrap > b {
		float: left;
		margin-bottom: 5px;
		height: 25px;
		margin-right: 10px;
	}
	#imgWrap > b {
		line-height: 25px;
	}
	#imgWrap > b:last-child {
		margin-right: 0;
	}
	#seatList {
		overflow: hidden;
		margin-top: 30px;
		border: 5px double #ddd;
		padding: 20px 5px;
	}
	#stationText {
		margin-top: 10px;
	}
	.circle {
		width: 5px;
		height: 5px;
		border-radius: 50%;
		background-color: #656565;
		display: inline-block;
		margin-right: 5px;
		margin-bottom: 2px;
	}
	.btnWrap {
		overflow: hidden;
	}
	.redBold {
		color: #d4226d;
		font-weight: bold;
		font-size: 1.2em;
		margin-right: 20px;
	}
	#nums {
		margin-top: 10px;
		display: inline-block;
	}
	#moveCar {
		border: #367ce6;
		color: white;
		padding: 5px 10px;
		font-weight: bold;
		float: right;
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
	}
	#goRes {
		border: #367ce6;
		color: white;
		padding: 5px 10px;
		font-weight: bold;
		float: right;
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		margin-top: 10px;
	}
	#goResForm {
		margin-bottom: 30px;
	}
	
	/* ---------------------- 조회한 기차가 없을 경우 -------------------------- */
	#none {
		display: none;
		border-top: 3px dotted #0097d0;
		border-bottom: 3px dotted #0097d0;
		padding: 50px 0;
		text-align: center;
		font-size: 0.8em;
	}
	#none > b {
		display: block;
	}
	.orange {
		color: #FF9600;
		margin: 10px;
	}
	.blue {
		color: #3590d2;
		margin: 10px;
	}
	#none > button {
		padding: 5px 10px;
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		border: none;
		color: white;
		background-size: auto 100%;
		margin-top: 10px;
	}
</style>

<script>
	$(function() {
		$("#search").click(function() {
			selPeople = 0;
			$(".selSeat").empty();
			
			var strDate = $("select[name=year]").val()+"-"+$("select[name=month]").val()+"-"+$("select[name=date]").val();
			var date = new Date();
			var date2 = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
			
			if(strDate < date2) {
				alert("현재 일자 보다 이전 일자를 선택하셨습니다. 일정을 다시 한번 선택하여 주십시오");
				return false;
			}
			
			$.ajax({
				url: "${pageContext.request.contextPath}/res/reservation",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),"tTiNo":$("input[name='tTiNo']:checked").val(),
						"date":strDate,"time":$("select[name=time]").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					if(res.length == 0) {
						$("#orderWrap").empty();
						$("#ultext").empty();
						$("article").empty();
						$("#resForm").empty();
						$("#none").css("display", "block");
						$("#res_back2 h1").text("안내메세지");
					}
					
					$("table").empty();
					$("table").append("<tr><th>열차분류</th><th>열차번호</th><th>출발</th><th>도착</th><th>좌석</th><th>가격</th></tr>");
					
					$(res).each(function(i, obj) {
						var start_time = new Date(obj.tStartTime);
						var arrive_time = new Date(obj.ttStartTime);
						var arriveTime = arrive_time.getFullYear()+"-"+(arrive_time.getMonth()+1)+"-"+("00" + arrive_time.getDate()).slice(-2)+" "+
										 arrive_time.getHours()+":"+("00" + arrive_time.getMinutes()).slice(-2);
					 	var startTime = start_time.getFullYear()+"-"+(start_time.getMonth()+1)+"-"+("00" + start_time.getDate()).slice(-2)+" "+
					 					start_time.getHours()+":"+("00" + start_time.getMinutes()).slice(-2);
					 	var price_str = String(obj.price).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');

					 	var $tr = $("<tr>");
						var $tiName = $("<td>").attr("data-code", obj.tCode).text(obj.tTiNo.tiName);
						var $tiCode = $("<td>").text(obj.tCode);
						var $span1 = $("<span>").addClass("st").html(("00" + start_time.getHours()).slice(-2)+":"+("00" + start_time.getMinutes()).slice(-2));
						var $tStart = $("<td>").html(obj.tStart.nodename+"<br>").append($span1);
						var $tArrive = $("<td>").html(obj.nodeid.nodename+"<br>"+("00" + arrive_time.getHours()).slice(-2)+":"+("00" + arrive_time.getMinutes()).slice(-2));
						var $imgRan = $("<img>").attr("src", "${pageContext.request.contextPath}/resources/images/res/icon3.png").attr("data-time", arriveTime).addClass("searchSeatRan");
						var $img = $("<img>").attr("src", "${pageContext.request.contextPath}/resources/images/res/icon4.png").attr("data-time", arriveTime).addClass("searchSeat");
						var $td = $("<td>").append($imgRan).append($img);
						var $price = $("<td>").addClass("price").text(price_str).attr("data-price", obj.price);
						
						var st2 = $("<span>").addClass("st2").html(startTime);
						var stTd = $("<td>").addClass("none").append(st2);
						
						var at = $("<span>").addClass("at").html(arriveTime);
						var atTd = $("<td>").addClass("none").append(at);
						
						$tr.append($tiName).append($tiCode).append($tStart).append($tArrive).append($td).append($price).append(stTd).append(atTd);
						$("table").append($tr);
					})
				}
			})
		})
		
		//예매버튼 클릭
		$(document).on("click", ".searchSeatRan", function(){
			
		})
		
		//좌석선택버튼 클릭
		var rownum = 0; //행에 따른 도착시간 받아오기 위해
		var compareCar = 0;
		$(document).on("click", ".searchSeat", function(){
			selPeople = 0;
			$(".selSeat").empty();
			
			var startTime = $(this).attr("data-time");
			var tCode = $(this).parents("tr").find("td").attr("data-code");
			
			rownum = $(this).closest("tr").index();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/res/seat",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),
						"tTiNo":$("input[type='radio']:checked").val(),"startTime":startTime, "tCode":tCode},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#myModal").show();
					$("#carList").empty();
					$("#seatList").empty();
					
					$(".redBold").html("<span class='ss'>" + $("select[name='startStation']").val() + "</span> ⇒ <span class='as'>" + $("select[name='arriveStation']").val() + "</span>행");
					
					$(res).each(function(i, obj) {
						var car = obj.tsCar;
						var no = obj.tsNo;
						
						//처음에 1호차가 선택되는게 디폴트
						if(car == 1) {
							var $divCar = $("<div>").addClass("car").addClass("carColor").attr("data-carnum", car).text(car+"호차");
						}else {
							var $divCar = $("<div>").addClass("car").attr("data-carnum", car).text(car+"호차");
						}
						
						//같은 호차면 div에 append안되게 막음
						if(compareCar != car) {
							$("#carList").append($divCar);
							compareCar = car;
						}
						
						//처음에 1호차가 선택되는게 디폴트
						if(compareCar == 1) {
							if(obj.tsChoice == false) {
								var $div = $("<div>").addClass("seat").attr("data-seatnum", no).text(no);
								$("#seatList").append($div);
							}else {
								var $div = $("<div>").addClass("seatn").attr("data-seatnum", no).text(no);
								$("#seatList").append($div);
							}
							$(".carText").html("<b><span class='codeNum'>" + obj.tCode.tCode + "</span>열차&nbsp;&nbsp;&nbsp;<span class='decCar'>1</span>호차</b>에 대한 좌석정보입니다.");
						}
						
						$(document).on("click", ".car", function(){
							selPeople = 0;

							$(".selSeat").text("");
							var car = $(this).attr("data-carnum");
							
							$(".car").removeClass("carColor");
							$(this).addClass("carColor");
							
							if(car != obj.tsCar && car > obj.tsCar) {
								$("#seatList").empty();
							}
							
							if(car == 1 && obj.tsCar == 1 && obj.tsNo == 1) {
								$("#seatList").empty();
							}
							
							if(car == obj.tsCar) {
								if(obj.tsChoice == false) {
									var $div = $("<div>").addClass("seat").attr("data-seatnum", no).text(no);
									$("#seatList").append($div);
								}else {
									var $div = $("<div>").addClass("seatn").attr("data-seatnum", no).text(no);
									$("#seatList").append($div);
								}
							}
							
							$(".carText").html("<b><span class='codeNum'>" + obj.tCode.tCode + "</span>열차&nbsp;&nbsp;&nbsp;<span class='decCar'>" + car +"</span>호차</b>에 대한 좌석정보입니다.");
						})
						
						/* 
						$("#moveCar").click(function() {
							if($(".decCar").text() == obj.tsCar) {
								var car = Number($(".decCar").text()) + 1;
								$(".carText").html("<b>" + obj.tCode.tCode + "열차&nbsp;&nbsp;&nbsp;<span class='decCar'>" + car +"</span>호차</b>에 대한 좌석정보입니다.");
							}
							$(".car").removeClass("carColor");
						}) 
						*/
					})
					
				}
			})
		})
		
		/* 
		$(document).on("click", ".searchSeatRan", function(){
			
		}
		*/
		
		var selPeople = 0;
		$(document).on("click", ".seat", function(){
			var seat = $(this).attr("data-seatnum")+"석";
			var selSeat  = $(".selSeat").text();
			var adult = Number($("select[name='adult']").val());
			var child = Number($("select[name='child']").val());
			var oldMan = Number($("select[name='oldMan']").val());
			
			var result = "";
			
			if($(this).css("background").indexOf("seat_s") < 0) {
				result = selSeat + " " +  seat;
				$(this).css("background", "url('${pageContext.request.contextPath}/resources/images/res/seat_s.png') no-repeat");
				$(this).css("background-size", "100% 100%");
				selPeople = selPeople + 1;
			}else {
				result = selSeat.replace(seat, "");
				$(this).css("background", "url('${pageContext.request.contextPath}/resources/images/res/seat_o.png') no-repeat");
				$(this).css("background-size", "100% 100%");
				selPeople = selPeople - 1;
			}
			
			if(selPeople > (adult+child+oldMan)) {
				alert("요청하신 승객 수를 초과하여 좌석을 선택할 수 없습니다.");
				$(this).css("background", "url('${pageContext.request.contextPath}/resources/images/res/seat_o.png') no-repeat");
				$(this).css("background-size", "100% 100%");
				selPeople = selPeople - 1;
				return false;
			}
			
			$(".selSeat").text(result);
		}) 
		
		$("#goResForm").submit(function() {
			if($(".selSeat").text() == "") {
				alert("좌석을 선택해 주세요.");
				return false;
			}
			
			if(selPeople != (Number($("select[name='adult']").val())+Number($("select[name='child']").val())+Number($("select[name='oldMan']").val()))) {
				alert("인원 수에 맞게 선택해 주세요.");
				return false;
			}
			
			$("input[name='tCode']").attr("value", $(".codeNum").text());
			if($(".codeNum").text().indexOf("K") >= 0) {
				$("input[name='tTiNo']").attr("value", 1);
			}else {
				$("input[name='tTiNo']").attr("value", 2);
			}
			$("input[name='tStart']").attr("value", $(".ss").text());
			$("input[name='tArrive']").attr("value", $(".as").text());
			
			$("input[name='price']").attr("value", $(".price").attr("data-price"));
			$("input[name='peoA']").attr("value", $("select[name='adult']").val());
			$("input[name='peoC']").attr("value", $("select[name='child']").val());
			$("input[name='peoO']").attr("value", $("select[name='oldMan']").val());
			
			/* var st = $(".st2").eq(0).text();
			st = new Date(st.substring(0, 4), st.substring(5, 7), st.substring(5, 7), st.substring(8, 10), st.substring(11, 13), st.substring(14, 16)); */
			$("input[name='tStartTime']").attr("value", $(".st2").eq(rownum-1).text());
			
			/* var at = $(".at").eq(0).text();
			at = new Date(at.substring(0, 4), at.substring(5, 7), at.substring(5, 7), at.substring(8, 10), at.substring(11, 13), at.substring(14, 16)); */
			$("input[name='tArriveTime']").attr("value", $(".at").eq(rownum-1).text());
			$("input[name='tsCar']").attr("value", Number($(".decCar").text()));
			$("input[name='tsNo']").attr("value", $(".selSeat").text());
		})
		
		$("#closeImg").click(function() {
			selPeople = 0;
			$(".selSeat").empty();
			$("#myModal").hide();
			$(".selSeat").text("");
			/* alert("선택좌석 예약하기 버튼을 정상적으로 선택하지 않았습니다..\n\r\n\r(선택좌석 예약하기 버튼을 클릭하셔야 정상적으로 예약이 됩니다.)"); */
		})
		
		//기차가 없는경우
		$("#noneBtn").click(function() {
			location.href = "${pageContext.request.contextPath}/";
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
				<a href="${pageContext.request.contextPath}/res/reservation"><p class="res_color">승차권예약</p></a>
				<a href="${pageContext.request.contextPath}/res/reservation"><p>발권/취소/변경</p></a>
			</div>
		</div>
		<div class="res_sec_right">
			<div id="res_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">승차권</a> > 
					<a href="${pageContext.request.contextPath}/">승차권예약</a> >
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
				<div id="resForm">
					<div id="personnelInfo">
						<label><img src="${pageContext.request.contextPath}/resources/images/res/bu_sq.png"> 인원정보</label>
						<select name="adult">
							<option value="0">어른 0명</option>
							<c:forEach begin="1" end="9" var="adult">
								<c:if test="${people == adult}">
									<option selected="selected" value="${adult}">어른 ${adult}명</option>
								</c:if>
								<c:if test="${people != adult}">
									<option value="${adult}">어른 ${adult}명</option>
								</c:if>
							</c:forEach>
						</select> <br>
						<select name="child">
							<option value="0">만 6세 ~ 12세</option>
							<c:forEach begin="1" end="9" var="child">
								<option value="${child}">어린이 ${child}명</option>
							</c:forEach>
						</select> <br>
						<select name="oldMan">
							<option value="0">만 65세이상</option>
							<c:forEach begin="1" end="9" var="oldMan">
								<option value="${oldMan}">경로 ${oldMan}명</option>
							</c:forEach>
						</select>
					</div>
					<div id="trainInfo">
						<ul>
							<li><input type="radio" value="0" name="tTiNo" checked="checked"> 전체</li>
							<c:forEach var="ti" items="${tiList}">
								<li><input type="radio" value="${ti.tiNo}" name="tTiNo"> ${ti.tiName}</li>
							</c:forEach>
						</ul>
						<label><img src="${pageContext.request.contextPath}/resources/images/res/bu_sq_arr03.png"> 출발역</label>
						<select name="startStation">
							<c:forEach var="start" items="${tList}">
								<c:if test="${ss != start.tStart.nodename}">
									<option>${start.tStart.nodename}</option>
								</c:if>
								<c:if test="${ss == start.tStart.nodename}">
									<option selected="selected">${start.tStart.nodename}</option>
								</c:if>
							</c:forEach>
						</select> <br>
						<label><img src="${pageContext.request.contextPath}/resources/images/res/bu_sq_arr03.png"> 도착역</label>
						<select name="arriveStation">
							<c:forEach var="arrive" items="${ttList}" varStatus="status">
								<c:if test="${as != arrive.nodeid.nodename}">
									<option>${arrive.nodeid.nodename}</option>
								</c:if>
								<c:if test="${as == arrive.nodeid.nodename}">
									<option selected="selected">${arrive.nodeid.nodename}</option>
								</c:if>
							</c:forEach>
						</select> <br>
						<label><img src="${pageContext.request.contextPath}/resources/images/res/bu_sq_arr03.png"> 출발일</label>
						<div id="startWrap">
							<c:set var="today" value="<%=new java.util.Date()%>" />
							<select name="year">
								<fmt:formatDate value="${today}" pattern="yyyy" var="year"/> 
								<c:forEach var="y" begin="0" end="2">
										<%-- <option value="<c:out value="${year + idx}"/>"><c:out value="${year + idx}"/></option> --%>
										<option>${year + y}</option>
								</c:forEach>
							</select><span>년</span>
							<select name="month">
								<fmt:formatDate value="${today}" pattern="MM" var="month"/> 
								<c:forEach var="m" begin="1" end="12">
									<c:if test="${month == m}">
										<c:if test="${m >= 10}">
											<option selected="selected" value="${m}">${m}</option>
										</c:if>
										<c:if test="${m < 10}">
											<option selected="selected" value="0${m}">${m}</option>
										</c:if>
									</c:if>
									<c:if test="${month != m}">
										<c:if test="${m >= 10}">
											<option value="${m}">${m}</option>
										</c:if>
										<c:if test="${m < 10}">
											<option value="0${m}">${m}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</select><span>월</span>
							<select name="date">
								<fmt:formatDate value="${today}" pattern="dd" var="date"/>
								<c:forEach var="d" begin="1" end="31">
									<c:if test="${date == d}">
										<option selected="selected">${d}</option>
									</c:if>
									<c:if test="${date != d}">
										<option>${d}</option>
									</c:if>
								</c:forEach>
							</select><span>일</span>
							<select name="time">
								<c:forEach var="t" begin="0" end="23">
									<c:if test="${t <= 11}">
										<option value="0${t}:00">${t}(오전 ${t})</option>
									</c:if>
									<c:if test="${t > 11}">
										<option value="${t}:00">${t}(오후 ${t-12})</option>
									</c:if>
								</c:forEach>
							</select><span>시</span>
							<fmt:formatDate value="${today}" pattern="E" var="day"/>
							<input type="text" value="${day}">
							<!-- 
							<fmt:parseDate value="20181101" var="dateFmt" pattern="yyyyMMdd"/>
							<fmt:formatDate value="${dateFmt}" pattern="E" var="today"/>
							 -->
						</div>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/res/btn_inq_tick.png" id="search">
				</div>
				<ul id="ultext">
					<li>승차권 예약을 원하시는 고객은 <img src="${pageContext.request.contextPath}/resources/images/res/icon1.png"> 또는 <img src="${pageContext.request.contextPath}/resources/images/res/icon2.gif"> 버튼을 클릭하여 주시기 바랍니다.</li>
					<li>일반열차는 와이파이(WiFi)서비스를 제공하지 않습니다.</li>
					<li>할인 승차권의 할인율은 별도 공지없이 변경될 수 있습니다.</li>
				</ul>
				<article>
					<table>
						<tr>
							<th>열차분류</th>
							<th>열차번호</th>
							<th>출발</th>
							<th>도착</th>
							<th>좌석</th>
							<th>가격</th>
							<!-- <th>소요시간</th> -->
						</tr>
						<c:forEach var="ttt" items="${tttList}">
							<tr>
								<td data-code="${ttt.tCode}">${ttt.tTiNo.tiName}<%-- <br>${ttt.tCode} --%></td>
								<td>${ttt.tCode}</td>
								<td>${ttt.tStart.nodename}<br><span class="st"><fmt:formatDate pattern="HH:mm" value="${ttt.tStartTime}"/></span></td>
								<td>${ttt.nodeid.nodename}<br><fmt:formatDate pattern="HH:mm" value="${ttt.ttStartTime}"/></td>
								<td>
									<img src="${pageContext.request.contextPath}/resources/images/res/icon3.png" class="searchSeatRan" data-time="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ttt.ttStartTime}"/>">
									<img src="${pageContext.request.contextPath}/resources/images/res/icon4.png" class="searchSeat" data-time="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ttt.ttStartTime}"/>">
								</td>
								<td class="price" data-price="${ttt.price}"><fmt:formatNumber pattern="###,###" value="${ttt.price}"/></td>
								<td class="none"><span class="st2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ttt.tStartTime}"/></span></td>
								<td class="none"><span class="at"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ttt.ttStartTime}"/></span></td>
								<%-- <td>
									<fmt:parseNumber value="${ttt.ttStartTime.time - ttt.tStartTime.time}" var="diffTime"/>
									<fmt:formatDate value="${diffTime}"/>
								</td> --%>
							</tr>					
						</c:forEach>
					</table>			
				</article>
				
				<!-- 기차가 없는 경우 -->
				<div id="none">
					<img src="${pageContext.request.contextPath}/resources/images/res/guide.png">
					<b class="orange">조회 결과가 없습니다.</b>
					<b class="blue">자세한 문의는 1544-7788(철도고객센터)로 문의하십시오.</b>
					<button id="noneBtn">확인</button>
				</div>
				
				
				<!-- Modal Start -->
				<div id="myModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
						<h3>좌석선택</h3>
						<img src="${pageContext.request.contextPath}/resources/images/res/btn_pop_close.png" id="closeImg">
						<div id="wrap">
							<p class="num">1</p><b>원하시는 좌석을 선택하여 주십시오.</b> <br>
							<p class="num">2</p>발매가 가능한 자석을 선택하실 수 있습니다. <br>
							<p class="num">3</p>원하시는 좌석을 선택 후 <b>선택좌석예약하기</b> 버튼을 클릭하시면 예약이 완료됩니다. <span class="red">(복수선택가능)</span> <br>
							<p class="num">4</p>원하지 않은 좌석이 선택된 경우 좌석을 한번 더 클릭하시면 취소됩니다. <br>
							<form action="finishRes" method="post" id="goResForm">
								<div id="resWrap">
									<div id="carList">
									</div>
									<div id="stationText">
										<p class="circle"></p><span class="redBold"></span><span class="carText"></span>
									</div>
									<div class="btnWrap"><button id="moveCar">다른 호차</button></div>
									<div id="seatInfo">
										<div id="sWrap">
											<div id="sNum"><b>좌석번호</b></div>
											<div id="imgWrap">
												<img src="${pageContext.request.contextPath}/resources/images/res/seat_n.png"> <b> : 예약불가</b>
												<img src="${pageContext.request.contextPath}/resources/images/res/seat_o.png"> <b> : 예약가능</b>
											</div>
										</div>
									</div>
									<div id="seatList">
									</div>
								</div>
								<div id="nums">
									<p class="circle"></p>선택한 좌석번호 :<span class="selSeat"></span>
								</div>
								<input type="hidden" name="tCode">
								<!-- <input type="hidden" name="tTiNo.tiName">
								<input type="hidden" name="tStart.nodename">
								<input type="hidden" name="nodeid.nodename"> 객체로 안받을거라서 이렇게 안함 -->
								<input type="hidden" name="tTiNo">
								<input type="hidden" name="tStart">
								<input type="hidden" name="tArrive">
								<input type="hidden" name="tStartTime">
								<input type="hidden" name="price">
								<input type="hidden" name="tArriveTime">
								<input type="hidden" name="peoA">
								<input type="hidden" name="peoC">
								<input type="hidden" name="peoO">
								<input type="hidden" name="tsCar">
								<input type="hidden" name="tsNo">
								<c:if test="${Auth != null}">
									<input type="hidden" name="memId" value="${Auth.memId}">
								</c:if>
								<c:if test="${Auth == null}">
									<input type="hidden" name="memId" value="">
								</c:if>
								<input type="submit" class="btnWrap" id="goRes" value="선택좌석예약하기">
							</form>
							<%-- 
							<form action="finishRes" method="post" id="randomForm">
								<input type="hidden" name="tCode">
								<input type="hidden" name="tTiNo">
								<input type="hidden" name="tStart">
								<input type="hidden" name="tArrive">
								<input type="hidden" name="tStartTime">
								<input type="hidden" name="price">
								<input type="hidden" name="tArriveTime">
								<input type="hidden" name="peoA">
								<input type="hidden" name="peoC">
								<input type="hidden" name="peoO">
								<input type="hidden" name="tsCar">
								<input type="hidden" name="tsNo">
								<c:if test="${Auth != null}">
									<input type="hidden" name="memId" value="${Auth.memId}">
								</c:if>
								<c:if test="${Auth == null}">
									<input type="hidden" name="memId" value="">
								</c:if>
							</form> 
							--%>
						</div>
					</div>
				</div>
				<!-- Modal End -->
			</div>
		</div>
		
		<c:if test="${tttList == '[]'}">
			<script>
				$("#orderWrap").empty();
				$("#ultext").empty();
				$("article").empty();
				$("#resForm").empty();
				$("#none").css("display", "block");
				$("#res_back2 h1").text("안내메세지");
			</script>
		</c:if>
	</section>
	
<%@ include file="../include/footer.jsp" %>