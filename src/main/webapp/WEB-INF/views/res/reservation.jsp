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
	}
	#seatChoice h3 {
		color: white;
		margin-left: 2.5%;
	}
	#wrap {
		width: 95%;
		margin: 10px auto;
		background-color: white;
		padding: 20px;
		font-size: 14px;
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
	.redBold {
		color: #d4226d;
		font-weight: bold;
		font-size: 1.2em;
		margin-right: 20px;
	}
	#nums {
		margin-top: 10px;
	}
	.btnWrap {
		overflow: hidden;
	}
	#goRes {
		background-color: #367ce6;
		border: #367ce6;
		color: white;
		padding: 5px 10px;
		font-weight: bold;
		float: right;
	}
	
	
	
	.seat {
		width: 50px;
		height: 50px;
		border: 1px solid black;
		float: left;
	}
</style>

<script>
	$(function() {
		$("#search").click(function() {
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
					$("table").append("<tr><td>열차번호</td><td>출발</td><td>도착</td><td>좌석</td><td>가격</td><td></td></tr>");
					
					$(res).each(function(i, obj) {
						var start_time = new Date(obj.tStartTime);
						var arrive_time = new Date(obj.ttStartTime);
						
						/* $option = $("<option>").text(start_time.getHours()+":"+start_time.getMinutes());
						$option.attr("value", start_time);
						*/

						var $tr = $("<tr>");
						var $tiName = $("<td>").text(obj.tTiNo.tiName);
						var $tStart = $("<td>").html(obj.tStart.nodename+"<br>"+start_time.getHours()+":"+("00" + start_time.getMinutes()).slice(-2));
						var $tArrive = $("<td>").html(obj.nodeid.nodename+"<br>"+arrive_time.getHours()+":"+("00" + arrive_time.getMinutes()).slice(-2));
						var $td = $("<td>").append("<button class='searchSeat' data-time='"+obj.ttStartTime+"'>좌석선택</button>");
						var $price = $("<td>").text(obj.price);
						var $input = $("<td>").append("<input type='radio' name='choice'>");
						
						$tr.append($tiName).append($tStart).append($tArrive).append($td).append($price).append($input);
						$("table").append($tr);
					})
				}
			})
		})
		
		$(document).on("click", ".searchSeat", function(){
			var startTime = $(this).attr("data-time");
			var tCode = $(this).parents("tr").find("td").attr("data-code");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/res/seat",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),
						"tTiNo":$("input[type='radio']:checked").val(),"startTime":startTime, "tCode":tCode},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#seatList").empty();
					
					$(res).each(function(i, obj) {
						var car = obj.tsCar;
						var no = obj.tsNo;
						var seat = car + "," + no;
						
						$div = $("<div>").addClass("seat").attr("data-seatNum", seat);
						
						$("#seatList").append($div);
					})
				}
			})
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
					<c:if test="${start.tStart.nodename != startS}">
						<option>${start.tStart.nodename}</option>
						<%-- <c:set var="startS" value="${start.tStart.nodename}" /> --%>
					</c:if>
				</c:forEach>
			</select>
			<label>도착역</label>
			<select name="arriveStation">
				<c:forEach var="arrive" items="${ttList}" varStatus="status">
					<c:if test="${arrive.nodeid.nodename != arriveS}">
						<option>${arrive.nodeid.nodename}</option>
						<%-- <c:set var="arriveS" value="${arrive.tArrive.nodename}" /> --%>
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
					<td></td>
				</tr>
				<c:forEach var="ttt" items="${tttList}">
					<tr>
						<td data-code="${ttt.tCode}">${ttt.tTiNo.tiName}<%-- <br>${ttt.tCode} --%></td>
						<td>${ttt.tStart.nodename}<br><fmt:formatDate pattern="HH:mm" value="${ttt.tStartTime}"/></td>
						<td>${ttt.nodeid.nodename}<br><fmt:formatDate pattern="HH:mm" value="${ttt.ttStartTime}"/></td>
						<td><button class="searchSeat" data-time="<fmt:formatDate pattern="yyyy-MM-dd KK:mm" value="${ttt.ttStartTime}"/>">좌석선택</button></td>
						<td>${ttt.price}</td>
						<td><input type="radio" name="choice"></td>
					</tr>					
				</c:forEach>
			</table>			
		</article>
		<article id="seatChoice">
			<h3>좌석선택</h3>
			<div id="wrap">
				<p class="num">1</p><b>원하시는 좌석을 선택하여 주십시오.</b> <br>
				<p class="num">2</p>발매가 가능한 자석을 선택하실 수 있습니다. <br>
				<p class="num">3</p>원하시는 좌석을 선택 후 <b>선택좌석예약하기</b> 버튼을 클릭하시면 예약이 완료됩니다. <span class="red">(복수선택가능)</span> <br>
				<p class="num">4</p>원하지 않은 좌석이 선택된 경우 좌석을 한번 더 클릭하시면 취소됩니다. <br>
				<div>
					<div>
					
					</div>
					<div id="stationText">
						<p class="circle"></p><span class="redBold">서울 ⇒ 부산행</span><span>KTX 일반실</span>
					</div>
					<div>
						
					</div>
				</div>
				<div id="nums">
					<p class="circle"></p>선택한 좌석번호 :
				</div> 
				<div class="btnWrap"><button id="goRes">선택좌석예약하기</button></div>
			</div>
		</article>
	</section>
	
<%@ include file="../include/footer.jsp" %>