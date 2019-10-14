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
	.join_sec_left {
		float: left;
		width: 19.7%;
	}
	.join_sec_right {
		float: left;
		width: 80%;
		border-left: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	#join_back {
		background: url("${pageContext.request.contextPath}/resources/images/notice/cmt_snv_tit_bg.png") no-repeat;
		background-size: 100%;
		padding-left: 20px;
	}
	#join_back span {
		display: inline-block;
		margin-top: 40px;
		font-size: 0.7em;
		color: #ccc;
	}
	#join_back h3 {
		margin-bottom: 50px;
	}
	.join_sec_left p {
		border-top: 1px solid #aaa;
		padding: 10px 20px;
		font-size: 14px;
	}
	.join_sec_left p:last-child {
		border-bottom: 1px solid #aaa;
		border-top: none;
	}
	.join_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	#join_back2 {
		background: url("${pageContext.request.contextPath}/resources/images/login/tra_visual10.jpg") no-repeat right top;
		padding-left: 30px;
	}
	#join_back2 p {
		padding-top: 40px;
	}
	#join_back2 p a {
		font-size: 0.8em;
		color: #666;
		text-decoration: none;
	}
	#join_back2 h1 {
		padding-bottom: 60px;
		padding-top: 10px;
	}
	
	#my {
		background-color: #f3f5f7;
		border-bottom: 1px solid #dfe1e4;
		border-top: 1px solid #dfe1e4;
		padding: 20px 10px;
		overflow: hidden;
	}
	#my > img, #my > div {
		float: left;
	}
	#my > div b {
		border-bottom: 2px solid #246dc6;
		display: block;
		margin: 30px 0 0 10px;
		width: 130%;
		padding-bottom: 5px;
	}
	
	#join_list {
		padding: 0 30px;
	}
	.clear { 
		clear: both;
	}
	
	
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
	
	#resCancel, #salCancel {
		background: url(/korail/resources/images/login/btn_wit.png) repeat-x;
	    border: 1.5px solid #9e9e9e;
	    border-radius: 5px;
	    padding: 3px 5px;
	}
	
	.cancel {
		color: gray;
	}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.2.0/handlebars.min.js"></script>
<script id="template" type="text/x-handlebars-template">
	<tr>
		<th>예매날짜</th>
		<th>선택좌석</th>
		<th>출발정보</th>
		<th>도착정보</th>
		<th>결제여부</th>
	</tr>
	{{#each.}}
		{{#if resCancel}}
			<tr class="cancel">
				<td></td>					
				<td>{{tsCar.tsCar}}호차 {{tsCar.tsNo}}</td>
				<td>{{ttNo.tCode.tStart.nodename}} <br> {{tempdate ttNo.tCode.tStartTime}}</td>
				<td>{{ttNo.nodeid.nodename}} <br> {{tempdate ttNo.tCode.tArriveTime}}</td>
				<td>취소완료</td>
			</tr>
		{{else}}
			<tr>
				<td>{{tempdate resDate}}</td>					
				<td>{{tsCar.tsCar}}호차 {{tsCar.tsNo}}</td>
				<td>{{ttNo.tCode.tStart.nodename}} <br> {{tempdate ttNo.tCode.tStartTime}}</td>
				<td>{{ttNo.nodeid.nodename}} <br> {{tempdate ttNo.tCode.tArriveTime}}</td>
				<td>
					{{#if salNo}}
   						완료 <br>
						<button id="salCancel" data-claNum="${res.resClaNum}" data-salNo="${res.salNo.salNo}">결제취소</button>
 					{{else}}
						<button id="resCancel" data-claNum="{resClaNum}">예약취소</button>
					{{/if}}
				</td>
			</tr>
		{{/if}}
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
		$(document).on("click", "#resCancel", function() {
			var res = confirm("예약을 취소하시겠습니까?");
			
			if(res == true) {
				var resClaNum = $(this).attr("data-claNum");
				
				$("table").empty();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/res/resCancel2?resClaNum="+resClaNum,
					type : "get",
					dataType: "json",
					success : function(res) {
						console.log(res);
						
						var source = $("#template").html();
						var func = Handlebars.compile(source);
						var str = func(res);
						$("table").append(str); 
					}
				})
			}
		})
		
		$(document).on("click", "#salCancel", function() {
			var res = confirm("결제를 취소하시겠습니까?");
			
			if(res == true) {
				var resClaNum = $(this).attr("data-claNum");
				var salNo = $(this).attr("data-salNo");
				
				alert(resClaNum);
				alert(salNo);
				
				$("table").empty();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/res/saleCancel?resClaNum="+resClaNum+"&salNo="+salNo,
					type : "get",
					dataType: "json",
					success : function(res) {
						console.log(res);
						
						var source = $("#template").html();
						var func = Handlebars.compile(source);
						var str = func(res);
						$("table").append(str); 
					}
				})
			}
		})
	})
</script>

	<section>
		<div class="join_sec_left">
			<div id="join_back">
				<span>MY PAGE</span>
				<h3>마이페이지</h3>
			</div>
			<div>
				<div id="my">
					<img src="${pageContext.request.contextPath}/resources/images/login/person.gif">
					<div>
						<b>${Auth.memName} 님</b>
					</div> 
				</div>
				<a href="${pageContext.request.contextPath}/login/mypage?memId=${Auth.memId}"><p id="memberMgn">회원정보관리</p></a>
				<a href="${pageContext.request.contextPath}/res/resticketGet?id=${Auth.memId}"><p class="join_color">승차권이용내역</p></a>
			</div>
		</div>
		<div class="join_sec_right">
			<div id="join_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">마이페이지</a></p>
				<h1>마이페이지</h1>
			</div>
			<div id="join_list">
				<div id="table_wrap">
					<table>
						<tr>
							<th>예매날짜</th>
							<th>선택좌석</th>
							<th>출발정보</th>
							<th>도착정보</th>
							<th>결제여부</th>
						</tr>
						<c:if test="${empty rList}">
							<tr>
								<td colspan="5" class="norList">예매내역이 없습니다</td>
							</tr>
						</c:if>
						<c:forEach var="res" items="${rList}">
							<c:if test="${res.resCancel == false}">
								<tr>
									<c:if test="${res.resDate != rd}">
										<td rowspan="${res.resPeople}"><fmt:formatDate pattern="MM월 dd일  HH시 mm분" value="${res.resDate}"/></td>
										<c:set var="rd" value="${res.resDate}"/>										
									</c:if>
									<td>${res.tsCar.tsCar}호차 ${res.tsCar.tsNo}</td>
									<td>
										${res.ttNo.tCode.tStart.nodename} <br>
										<fmt:formatDate pattern="MM월 dd일  HH시 mm분" value="${res.ttNo.tCode.tStartTime}"/>
									</td>
									<td>
										${res.ttNo.nodeid.nodename} <br>
										<fmt:formatDate pattern="MM월 dd일  HH시 mm분" value="${res.ttNo.ttStartTime}"/>
									</td>
									<c:if test="${res.salNo != null}">
										<td>
											완료 <br>
											<button id="salCancel" data-claNum="${res.resClaNum}" data-salNo="${res.salNo.salNo}">결제취소</button>
										</td>
									</c:if>
									<c:if test="${res.salNo == null}">
										<td>
											<button id="resCancel" data-claNum="${res.resClaNum}">예약취소</button>
										</td>
									</c:if>
								</tr>
							</c:if>
							<c:if test="${res.resCancel != false}">
								<tr class="cancel">
									<td></td>
									<td>${res.tsCar.tsCar}호차 ${res.tsCar.tsNo}</td>
									<td>
										${res.ttNo.tCode.tStart.nodename} <br>
										<fmt:formatDate pattern="MM월 dd일  HH시 mm분" value="${res.ttNo.tCode.tStartTime}"/>
									</td>
									<td>
										${res.ttNo.tCode.tArrive.nodename} <br>
										<fmt:formatDate pattern="MM월 dd일  HH시 mm분" value="${res.ttNo.tCode.tArriveTime}"/>
									</td>
									<c:if test="${res.salNo != null}">
										<td>완료</td>
									</c:if>
									<c:if test="${res.salNo == null}">
										<td>
											취소완료
										</td>
									</c:if>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		
	</section>
    
<%@ include file="../include/footer.jsp" %>