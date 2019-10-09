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
	
	#resSucces {
		border-top: 3px dotted #0097d0;
		border-bottom: 3px dotted #0097d0;
		padding: 20px 0;
		text-align: center;
		font-size: 1.2em;
		margin: 10px 0;
		font-weight: bold;
	}
	#res_list table {
		width: 300px;
		margin: 20px auto;
	}
	th, td {
		padding: 3px 0;
	}
	#hr {
		border-top: 3px dotted #0097d0;
		margin: 10px 0;
		width: 100%;
		padding-top: 30px;
		text-align: center;
	}
	button {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		border: 1px solid #16539f;
		padding: 8px 30px;
		color: white;
		background-size: auto 100%;
		font-weight: bold;
		font-size: 16px;
	}
</style>
<script>
	$(function() {
		$("button").click(function() {
			location.href="${pageContext.request.contextPath}/";
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
				<a href="${pageContext.request.contextPath}/"><p class="res_color">승차권예약</p></a>
				<a href="${pageContext.request.contextPath}/res/reservation"><p>발권/취소/변경</p></a>
			</div>
		</div>
		<div class="res_sec_right">
			<div id="res_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">승차권</a> > 
					<a href="${pageContext.request.contextPath}/">승차권예약</a></p>
				<h1>발권</h1>
				<div id="orderWrap">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck01.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck02.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck03.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck04_on.png">
				</div>
				<div class="clear"></div>
			</div>
			<div id="res_list">
				<div id="resSucces">
					<c:if test="${Auth != null}">
						${Auth.memName}님
					</c:if>
					예매가 완료되었습니다.
				</div>
				<table>
					<c:forEach var="res" items="${resList}" begin="0" end="0">
						<tr>
							<th>열차정보</th>
							<td>${res.ttNo.tCode.tTiNo.tiName} ( ${res.ttNo.tCode.tCode} )</td>
						</tr>
						<tr>
							<th>예매시간</th>
							<td><fmt:formatDate pattern="MM월 dd일  HH시mm분" value="${res.resDate}"/></td>
						</tr>
						<tr>
							<th>예매인원수</th>
							<td>${res.resPeople}명</td>
						</tr>
						<tr>
							<th>출발역</th>
							<td>${res.ttNo.tCode.tStart.nodename}</td>
						</tr>
						<tr>
							<th>출발시간</th>
							<td><fmt:formatDate pattern="MM월 dd일  HH시mm분" value="${res.ttNo.tCode.tStartTime}"/></td>
						</tr>
						<tr>
							<th>도착역</th>
							<td>${res.ttNo.tCode.tArrive.nodename}</td>
						</tr>
						<tr>
							<th>도착시간</th>
							<td><fmt:formatDate pattern="MM월 dd일  HH시mm분" value="${res.ttNo.tCode.tArriveTime}"/></td>
						</tr>
					</c:forEach>
					<tr>
						<th>예매좌석</th>
						<td>
							<c:forEach var="res" items="${resList}">
								${res.tsCar.tsCar}호차 ${res.tsCar.tsNo}석 <br>
							</c:forEach>
						</td>
					</tr>
					<c:forEach var="sale" items="${saleList}" begin="0" end="0">
						<tr>
							<th>결제금액</th>
							<td><fmt:formatNumber pattern="###,###" value="${sale.salPrice}"/>원</td>
						</tr>
						<tr>
							<th>할인금액</th>
							<td><fmt:formatNumber pattern="###,###" value="${sale.salDiscount}"/>원</td>
						</tr>
						<tr>
							<th>결제방법</th>
							<c:if test="${sale.salClassify == true}">
								<td>계좌이체</td>
							</c:if>
							<c:if test="${sale.salClassify == false}">
								<td>카드</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
				<div id="hr">
					<button>확인</button>
				</div>
			</div>	
		</div>
		
	</section>
    
<%@ include file="../include/footer.jsp" %>