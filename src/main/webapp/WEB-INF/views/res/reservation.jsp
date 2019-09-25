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
		/* $("#resForm").submit(function() {
			alert($("select[name='nodeidS']").val());
			alert($("select[name='nodeidA']").val());
			//return false;
		}) */
	})
</script>

	<section>
		<form action="reservation" method="post" id="resForm">
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
					<option>${arrive.nodeidA.nodename}</option>
				</c:forEach>
			</select>
			<label>출발시간</label>
			
			<input type="submit">
		</form>
	</section>
	
<%@ include file="../include/footer.jsp" %>