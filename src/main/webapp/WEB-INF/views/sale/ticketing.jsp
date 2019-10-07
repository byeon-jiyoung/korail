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
</style>

	<section>
		<div class="res_sec_left">
			<div id="res_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>승차권</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/"><p class="res_color">승차권예약</p></a>
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
				<div id="resSucces">예매가 완료되었습니다.</div>
				<table>
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
					<c:forEach var="res" items="${resList}">
						<tr>
							<th>예매시간</th>
							<td><fmt:formatDate pattern="MM월 dd일  HH시mm분" value="${res.resDate}"/></td>
						</tr>
						<tr>
							<th>예매인원수</th>
							<td>${res.resPeople}명</td>
						</tr>
						<tr>
							<th>예매좌석</th>
							<td>${res.tsCar.tsCar}호차 ${res.tsCar.tsNo}석</td>
						</tr>
					</c:forEach>
					<%-- <tr>
						<th>출발역</th>
						<td>${sale.salDiscount}</td>
					</tr>
					<tr>
						<th>도착역</th>
						<td>${sale.salDiscount}</td>
					</tr> --%>
				</table>
				
			</div>	
		</div>
		
	</section>
    
<%@ include file="../include/footer.jsp" %>