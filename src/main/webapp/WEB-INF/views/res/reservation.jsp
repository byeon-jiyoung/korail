<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style>
	section {
		width: 1070px;
		margin: 0 auto;
	}
</style>

<script>
	$(function() {
		$("#resForm").submit(function(e) {
			e.preventDefault();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/res/reservation",
				type: "post",
				dataType:"json",
				success: function(res) {
					console.log(res);
					
					
				}
			})
		})
	})
</script>

	<section>
		<form action="reservation" method="post" id="resForm">
			<div>
				<label>열차종류선택</label>
				<c:forEach var="trainInfo" items="${tiList}">
					<input type="radio" value="${trainInfo.tiNo}" name="tiNo">${trainInfo.tiName}
				</c:forEach>
			</div>

			<label>출발역</label>
			<select name="nodeidS">
				<c:forEach var="start" items="${pList}">
					<c:if test="${start.nodeidS.nodename != startStation}">
						<option>${start.nodeidS.nodename}</option>
						<c:set var="startStation" value="${start.nodeidS.nodename}" />
					</c:if>
				</c:forEach>
			</select>
			<label>도착역</label>
			<select name="nodeidA">
				<c:forEach var="arrive" items="${pList}">
					<c:if test="${arrive.nodeidA.nodename != arriveStation}">
						<option>${arrive.nodeidA.nodename}</option>
						<c:set var="arriveStation" value="${arrive.nodeidA.nodename}" />
					</c:if>
				</c:forEach>
			</select>
			<label>출발시간</label>
			
			<input type="submit">
		</form>
	</section>
	
<%@ include file="../include/footer.jsp" %>