<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style>
	section {
		width: 1070px;
		margin: 0 auto;
	}
	#time {
		display: none;
	}
</style>

<script>
	$(function() {
		$("#search").click(function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/res/reservation",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),"tTiNo":$("input[type='radio']:checked").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					$("#startTime").empty();
					$("#time").css("display", "inline");
					
					if(res.length == 0) {
						alert("기차없음");
					}
					
					$(res).each(function(i, obj) {
						var start_time = new Date(obj.tStartTime); 
						
						$option = $("<option>").text(start_time.getHours()+":"+start_time.getMinutes());
						$option.attr("value", start_time);
						$("#startTime").append($option);
					})
				}
			})
		})
		
		$("#startTime").change(function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/res/seat",
				type: "post",
				data: {"startStation":$("select[name='startStation']").val(),"arriveStation":$("select[name='arriveStation']").val(),
						"tTiNo":$("input[type='radio']:checked").val(),"startTime":$("#startTime").val()},
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					
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
			<span id="time">
				<label>출발시간</label>
				<select name="startTime" id="startTime"></select>
			</span>
			<button id="search">조회</button>
		</div>
	</section>
	
<%@ include file="../include/footer.jsp" %>