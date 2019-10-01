<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style>
	section {
		width: 1070px;
		margin: 0 auto;
	}
	table {
		border-collapse: collapse;
	}
	td, tr {
		border: 1px solid #aaa;
		padding: 10px 20px;
	}
	#seatChoice {
		overflow: hidden;
		color: #727272;
		background-color: #0066a8; /*02418c */
		padding: 10px 0;
		display: none;
	}
	#seatChoice h3 {
		color: white;
		display: inline-block;
		margin-left: 10px;
	}
	#seatChoice > img {
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
	#seatChoice .num {
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
	#sNum, #sWrap, #line {
		display: inline-block;
		float: left;
	}
	#sNum {
		border: 2px solid black;
		padding: 5px 20px;
		border-bottom: none;
	}
	#line {
		border-bottom: 2px solid black;
		width: 90%;
	}
	#sWrap {
		float: right;
	}
	#sWrap > img, #sWrap > b {
		float: left;
		margin-bottom: 5px;
		height: 25px;
		margin-right: 10px;
	}
	#sWrap > b {
		line-height: 25px;
	}
	#sWrap > b:last-child {
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
	.selSeat {
		margin-left: 10px;
		color: #1890D7;
		font-weight: bold;
	}
</style>

<script>
	$(function() {
		$("#search").click(function() {
			selPeople = 0;
			$.ajax({
				url: "${pageContext.request.contextPath}/res/reservation",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),"tTiNo":$("input[name='tTiNo']:checked").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					if(res.length == 0) {
						alert("기차없음");
					}
					
					$("table").empty();
					$("table").append("<tr><td>열차번호</td><td>출발</td><td>도착</td><td>좌석</td><td>가격</td></tr>");
					
					$(res).each(function(i, obj) {
						var start_time = new Date(obj.tStartTime);
						var arrive_time = new Date(obj.ttStartTime);
						var arriveTime = arrive_time.getFullYear()+"-"+(arrive_time.getMonth()+1)+"-"+("00" + arrive_time.getDate()).slice(-2)+" "+
										 arrive_time.getHours()+":"+("00" + arrive_time.getMinutes()).slice(-2);
						
						var $tr = $("<tr>");
						var $tiName = $("<td>").attr("data-code", obj.tCode).text(obj.tTiNo.tiName);
						var $span1 = $("<span>").addClass("st").html(start_time.getHours()+":"+("00" + start_time.getMinutes()).slice(-2));
						var $tStart = $("<td>").html(obj.tStart.nodename+"<br>").append($span1);
						var $tArrive = $("<td>").html(obj.nodeid.nodename+"<br>"+arrive_time.getHours()+":"+("00" + arrive_time.getMinutes()).slice(-2));
						var $td = $("<td>").append("<button class='searchSeat' data-time='"+arriveTime+"'>좌석선택</button>");
						var $price = $("<td>").text(obj.price);
						
						$tr.append($tiName).append($tStart).append($tArrive).append($td).append($price);
						$("table").append($tr);
					})
					
				}
			})
		})
		
		var compareCar = 0;
		$(document).on("click", ".searchSeat", function(){
			selPeople = 0;
			var startTime = $(this).attr("data-time");
			var tCode = $(this).parents("tr").find("td").attr("data-code");
			
			alert(tCode);
			
			$.ajax({
				url: "${pageContext.request.contextPath}/res/seat",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),
						"tTiNo":$("input[type='radio']:checked").val(),"startTime":startTime, "tCode":tCode},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#seatChoice").css("display", "block");
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
							var $div = $("<div>").addClass("seat").attr("data-seatnum", no).text(no);
							$("#seatList").append($div);
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
								var $div = $("<div>").addClass("seat").attr("data-seatnum", no).text(no);
								$("#seatList").append($div);
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
		
		var selPeople = 0;
		$(document).on("click", ".seat", function(){
			var seat = $(this).attr("data-seatnum")+"석";
			var adult = $("select[name='adult']").val();
			var selSeat  = $(".selSeat").text();
			
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
			
			if(selPeople > adult) {
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
			
			if(selPeople != $("select[name='adult']").val()) {
				alert("인원 수에 맞게 선택해 주세요.");
				return false;
			}
			
			$("input[name='tCode']").attr("value", $(".codeNum").text());
			if($(".codeNum").text().indexOf("K") >= 0) {
				$("input[name='tTiNo.tiName']").attr("value", "KTX");
			}else {
				$("input[name='tTiNo.tiName']").attr("value", "새마을");
			}
			$("input[name='tStart.nodename']").attr("value", $(".ss").text());
			$("input[name='nodeid.nodename']").attr("value", $(".as").text());
			/*
			<input type="hidden" name="tStartTime">
			<input type="hidden" name="price">
			<input type="hidden" name="ttStartTime">
			*/
			$("input[name='price']").attr("value", $(".price").text());
			
			alert($(".st").text());
			
		})
		
		
		$("#closeImg").click(function() {
			selPeople = 0;
			$("#seatChoice").css("display", "none");
			$(".selSeat").text("");
		})
		
	})
</script>

	<section>
		<div id="resForm">
			<div>
				<label>열차종류선택</label>
				<input type="radio" value="0" name="tTiNo" checked="checked">전체
				<c:forEach var="trainInfo" items="${tiList}">
					<input type="radio" value="${trainInfo.tiNo}" name="tTiNo">${trainInfo.tiName}
				</c:forEach>
			</div>

			<label>출발역</label>
			<select name="startStation">
				<c:forEach var="start" items="${tList}">
					<c:if test="${ss != start.tStart.nodename}">
						<option>${start.tStart.nodename}</option>
					</c:if>
					<c:if test="${ss == start.tStart.nodename}">
						<option selected="selected">${start.tStart.nodename}</option>
					</c:if>
				</c:forEach>
			</select>
			<label>도착역</label>
			<select name="arriveStation">
				<c:forEach var="arrive" items="${ttList}" varStatus="status">
					<c:if test="${as != arrive.nodeid.nodename}">
						<option>${arrive.nodeid.nodename}</option>
					</c:if>
					<c:if test="${as == arrive.nodeid.nodename}">
						<option selected="selected">${arrive.nodeid.nodename}</option>
					</c:if>
				</c:forEach>
			</select>
			<label>인원정보</label>
			<select name="adult">
				<c:forEach begin="1" end="9" var="adult">
					<c:if test="${people == adult}">
						<option selected="selected">${adult}</option>
					</c:if>
					<c:if test="${people != adult}">
						<option>${adult}</option>
					</c:if>
				</c:forEach>
			</select>
			<button id="search">조회</button>
		</div>
		<article>
			<table>
				<tr>
					<td>열차번호</td>
					<td>출발</td>
					<td>도착</td>
					<td>좌석</td>
					<td>가격</td>
				</tr>
				<c:forEach var="ttt" items="${tttList}">
					<tr>
						<td data-code="${ttt.tCode}">${ttt.tTiNo.tiName}<%-- <br>${ttt.tCode} --%></td>
						<td>${ttt.tStart.nodename}<br><span class="st"><fmt:formatDate pattern="HH:mm" value="${ttt.tStartTime}"/></span></td>
						<td>${ttt.nodeid.nodename}<br><fmt:formatDate pattern="HH:mm" value="${ttt.ttStartTime}"/></td>
						<td><button class="searchSeat" data-time="<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${ttt.ttStartTime}"/>">좌석선택</button></td>
						<td class="price">${ttt.price}</td>
					</tr>					
				</c:forEach>
			</table>			
		</article>
		<article id="seatChoice">
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
							<div id="sNum"><b>좌석번호</b></div>
							<div id="line">
								<div id="sWrap">
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
					<input type="hidden" name="tTiNo.tiName">
					<input type="hidden" name="tStart.nodename">
					<input type="hidden" name="nodeid.nodename">
					<!-- <input type="hidden" name="tStartTime"> -->
					<input type="hidden" name="price">
					<!-- <input type="hidden" name="ttStartTime"> -->
					<input type="submit" class="btnWrap" id="goRes" value="선택좌석예약하기">
				</form> 
			</div>
		</article>
	</section>
	
<%@ include file="../include/footer.jsp" %>