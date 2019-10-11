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
	
	
	#resimg_top {
		background: url("${pageContext.request.contextPath}/resources/images/res/tit_box_tick_bg.png") no-repeat;
		width: 100%;
		height: 100px;
		background-size: 800px 100%;
		margin: 0 30px;
	}
	#resimg_top img:nth-child(1) {
		margin-top: 40px;
		margin-left: 30px;
	}
	#resimg_top img:nth-child(2) {
		float: right;
		margin-right: 80px;
		margin-top: 15px;
	}
	
	table {
		border-top: 2px solid black;
		margin: 20px 30px;
		width: 800px;
		border-collapse: collapse;
		font-size: 0.8em;
		text-align: center;
	}
	table tr:first-child {
		background-color: #f8f8f8;
	}
	th, td {
		border: 1px solid #aaa;
		padding: 10px 0;
	}
	th:first-child, td:first-child {
		border-left: none;
	}
	th:last-child, td:last-child {
		border-right: none;
	}
	.red {
		color: red;
	}
	#table2 th:nth-child(1) {
		width: 140px;
	}
	#table2 th:nth-child(2),#table2 th:nth-child(3),#table2 th:nth-child(4),#table2 th:nth-child(5) {
		width: 100px;
	}
	
	#table2 select {
		width: 200px;
	}
	#rightDiv {
		float: right;
		border: 1px solid #9e9e9e;
		padding: 10px 20px;
		margin-right: 30px;
		font-size: 0.8em;
		line-height: 20px;
	}
	.sky {
		color: #3590d2;
	}
	.pink {
		color: #d4226d;
	}
	#clear {
		clear: both;
	}
	#btnWrap {
		float: right;
		clear: both;
		margin-right: 30px;
		margin-top: 20px;
	}
	#discountBtn {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_pink.png");
		border: 1px solid #bc1c60;
		padding: 5px 14px;
		color: white;
	}
	#saleBtn {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		border: 1px solid #16539f;
		padding: 5px 14px;
		color: white;
	}
	#cancelBtn {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_gray.png") repeat-x;
		padding: 5px 14px;
		border: 1px solid #9e9e9e;
	}
	
	/*--------------------------예약취소할때값넘기려고------------------------------------*/
	.classNum {
		display: none;
	}
	
	/*---------------------*/
	.none {
		display: none;
	}
</style>

<script>
	window.onload = function () {
		alert("20분 내에 결제하셔야 예약이 완료됩니다.");
		
		alert("1. 승차권 환불 위약금은 다음과 같습니다. \n <출발 전>\n - 월~목요일 : 출발 3시간 전까지 무료 \n - 월~목요일 : 출발 3시간 전 ~ 출발시간 전까지 5%" + 
				"\n - 금~일, 공휴일, 명절 : 출발 1일 전까지 400원(구매 후 7일 이내 환불 시 감면) \n - 금~일, 공휴일, 명절 : 당일  ~ 출발 3시간 전까지 5%" + 
				"\n - 금~일, 공휴일, 명절 : 출발 3시간 전 ~ 출발시간 전까지 10% \n\n <출발 후> \n - 출발시각 경과 후 20분까지 15%" + 
				"\n - 출발시간 20분 경과 후 ~ 60분까지 40% \n - 출발시각 60분 경과 후 ~ 도착역 도착시간 전까지 70% \n * 열차 출발 시각 이후에는 역창구에서 환불 신청하셔야 합니다." + 
				"\n * 도착역 도착 후에는 환불되지 않습니다. \n * 승차권을 구매한 당일에 환불 청구하실 경우 위약금을 감면받으실 수 있습니다.(열차 출발 3시간 전까지, 할인 승차권 제외)" + 
				"\n\n2. 레츠코레일에서 구입한 승차권을 역 창구에서 변경 시 할인이 취소될 수 있습니다. \n\n3. 할인 승차권의 할인율은 별도 공지없이 변경될 수 있습니다." + 
				"\n\n4. 열차정보, 구입기간, 매수 금액, 주의사항 등을 최종 확인하였습니다."); 
	}
	
	$(function() {
		$("#cancelBtn").click(function() {
			var resClaNum = $(".classNum").text();
			location.href = "${pageContext.request.contextPath}/res/resCancel?resClaNum="+resClaNum;
		})
		
		$("#saleBtn").click(function() {
			var totalPrice = $(".totalPrice").attr("data-totalPrice");
			var tName = "${ttt.tTiNo.tiName}";
			var tCode = "${ttt.tCode}";
			var ttNo = $(".none").text();
			var nomemPhone = "${nomemPhone}";
			location.href = "${pageContext.request.contextPath}/sale/sale?totalPrice="+totalPrice+"&tName="+tName+"&tCode="+tCode+"&ttNo="+ttNo+"&nomemPhone="+nomemPhone;
		})
	}) 
	
	/* 
	// 뒤로가기 방지
	window.history.forward(1);

	// 우클릭방지
	oncontextmenu='return false' 

	// 드래그 방지
	ondragstart='return false'

	// 선택복사 방지
	onselectstart='return false'
	*/
	
	//새로고침, 뒤로가기 막기
	document.onkeydown = function(e) {
		key = (e) ? e.keyCode : event.keyCode;
		if(key==8 || key==116) {
			if(e) {
				e.preventDefault();
			} else {
				event.keyCode = 0;
				event.returnValue = false;
			}
		}
	}
	
	/*
	//오른쪽마우스 막기
	document.oncontextmenu = function(e){
		if(e){
			e.preventDefault();
		} else {
			event.keyCode = 0;
			event.returnValue = false;
		}
	}
	*/
	
</script>

	<section>
		<div class="res_sec_left">
			<div id="res_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>승차권</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/"><p class="res_color">승차권예약</p></a>
				<a href="${pageContext.request.contextPath}/res/reservation"><p>승차권조회</p></a>
			</div>
		</div>
		<div class="res_sec_right">
			<div id="res_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">승차권</a> > 
					<a href="${pageContext.request.contextPath}/">승차권 예약</a></p>
				<h1>예약</h1>
				<div id="orderWrap">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck01.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck02_on.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck03.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck04.png">
				</div>
				<div class="clear"></div>
			</div>
			<div id="res_list">
				<div id="resimg_top">
					<img src="${pageContext.request.contextPath}/resources/images/res/tit_tick02.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/tit_tick02_img.png">
				</div>
				<span class="classNum">${resClaNum}</span>
				<table>
					<tr>
						<th>승차일자</th>
						<th>열차번호</th>
						<th>열차종별</th>
						<th>출발역</th>
						<th>출발시각</th>
						<th>도착역</th>
						<th>도착시간</th>
						<th>예약매수</th>
						<th class="red">총결제금액</th>
					</tr>
					<tr>
						<td><fmt:formatDate pattern="MM월dd일" value="${ttt.tStartTime}"/></td>
						<td>${ttt.tCode}</td>
						<td>${ttt.tTiNo.tiName}</td>
						<td>${ttt.tStart.nodename}</td>
						<td><fmt:formatDate pattern="HH:mm" value="${ttt.tStartTime}"/></td>
						<td>${ttt.nodeid.nodename}</td>
						<td><fmt:formatDate pattern="HH:mm" value="${ttt.ttStartTime}"/></td>
						<c:forEach var="res" items="${resList}" begin="0" end="0">
							<td>${res.resPeople}</td>
							<td class="red totalPrice" data-totalPrice="${(a*res.ttNo.price)+(c*res.ttNo.price*0.9)+(o*res.ttNo.price*0.85)}">
								<fmt:formatNumber pattern="###,###" value="${(a*res.ttNo.price)+(c*res.ttNo.price*0.9)+(o*res.ttNo.price*0.85)}"/>원
							</td>
							<td class="none">${res.ttNo.ttNo}</td>
						</c:forEach>
					</tr>
				</table>
				<table id="table2">
					<tr>
						<th>좌석정보</th>
						<th>승객유형</th>
						<th>운임요금</th>
						<th>할인금액</th>
						<th>영수금액</th>
						<th>운임추가할인선택</th>
					</tr>
					<tr>
						<c:forEach var="res" items="${resList}">
							<tr>
								<td>
									${res.tsCar.tsCar}호차 ${res.tsCar.tsNo}
								</td>
								<c:if test="${a > 0}">
									<td>성인</td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price}"/></td>
									<td>0</td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price}"/></td>
								</c:if>
								<c:if test="${c > 0 && a <= 0}">
									<td>어린이</td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price}"/></td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price * 0.1}"/></td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price - (res.ttNo.price * 0.1)}"/></td>
								</c:if>
								<c:if test="${o > 0 && c <= 0 && a <= 0}">
									<td>경로</td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price}"/></td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price * 0.15}"/></td>
									<td><fmt:formatNumber pattern="###,###" value="${res.ttNo.price - (res.ttNo.price * 0.15)}"/></td>
									<c:set var="o" value="${o-1}" />
								</c:if>
								<c:set var="a" value="${a-1}" />
								<c:if test="${a < 0}">
									<c:set var="c" value="${c-1}" />
								</c:if>
								<td>
									<c:if test="${Auth != null}">
										<select>
											<option>선택안함</option>
										</select>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</tr>
				</table>
				<div id="rightDiv">
					<span class="sky"><b>[할인증 적용 방법 변경]</b> 각종 할인증을 적용하는 방식이 변경되었습니다.</span> <br>
					* 운임추가 할인 선택 => <span class="pink">할인적용</span> => 결제하기 <br>
					* 특실요금은 할인대상에서 제외됩니다. 
				</div>
				<div id="clear"></div>
				<div id="btnWrap">
					<!-- <button id="discountBtn">할인적용</button> -->
					<button id="saleBtn">결제하기</button>
					<button id="cancelBtn">예약취소</button>
				</div>
			</div>
		</div>
		
	</section>
    
<%@ include file="../include/footer.jsp" %>