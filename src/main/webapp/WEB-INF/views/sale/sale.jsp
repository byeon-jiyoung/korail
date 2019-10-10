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
	.sale_sec_left {
		float: left;
		width: 19.7%;
	}
	.sale_sec_right {
		float: left;
		width: 80%;
		border-left: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	#sale_back {
		background: url("${pageContext.request.contextPath}/resources/images/notice/cmt_snv_tit_bg.png") no-repeat;
		background-size: 100%;
		padding-left: 20px;
	}
	#sale_back span {
		display: inline-block;
		margin-top: 40px;
		font-size: 0.7em;
		color: #ccc;
	}
	#sale_back h3 {
		margin-bottom: 50px;
	}
	.sale_sec_left p {
		border-top: 1px solid #aaa;
		padding: 10px 20px;
	}
	.sale_sec_left p:last-child {
		border-bottom: 1px solid #aaa;
	}
	.sale_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	#sale_back2 {
		background: url("${pageContext.request.contextPath}/resources/images/join/tra_visual13.jpg") no-repeat right top;
		padding-left: 30px;
	}
	#sale_back2 p {
		padding-top: 40px;
	}
	#sale_back2 p a {
		font-size: 0.8em;
		color: #666;
		text-decoration: none;
	}
	#sale_back2 h1 {
		padding-top: 10px;
		font-size: 30px;
	}
	
	
	#sale_list {
		padding: 0 30px;
	}
	#orderWrap {
		float: right;
		margin: 40px 30px 10px 0;
	}
	.clear { 
		clear: both;
	}
	#saleimg_top {
		background: url("${pageContext.request.contextPath}/resources/images/res/tit_box_tick_bg.png") no-repeat;
		width: 100%;
		height: 100px;
		background-size: 800px 100%;
	}
	#saleimg_top img:nth-child(1) {
		margin-top: 40px;
		margin-left: 30px;
	}
	#saleimg_top img:nth-child(2) {
		float: right;
		margin-right: 30px;
		margin-top: 15px;
	}
	#sale_list > ul {
		list-style: disc;
		padding-left: 30px;
		color: #333;
		font-size: 14px;
		margin: 30px 0;
	}
	#pricewrap {
		border: 1px solid #ddd;
		padding: 15px 20px;
	}
	.red {
		color: red;
	}
	
	table {
		border-top: 2px solid black;
		margin: 20px 0;
		width: 100%;
		border-collapse: collapse;
		font-size: 0.9em;
	}
	th {
		background-color: #F8F8F8;
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
	th {
		width: 20%;
	}
	td {
		padding-left: 20px;
	}
	td span {
		font-size: 0.9em;
	}
	#btn {
		text-align: center;
	}
	#salBtn {
		padding: 8px 15px;
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		border: none;
		color: white;
		background-size: auto 100%;
	}
	table a {
		font-size: 0.9em;
		color: #266fcb;
	}
	table b {
		color: #266fcb;
	}
	input[type="text"] {
		width: 100px;
		margin-right: 10px;
	}
	input[name="memPhone"] {
		width: 150px;
	}
	.none {
		display: none;
	}
	
	/*--------------------------- 비회원 ---------------------------*/
	.phonecheckS, .phonecheckF {
		color: blue;
		display: none;
		font-size: 0.9em;
		margin-top: 5px;
	}
	.reg {
		color: red;
		display: none;
		font-size: 0.9em;
		margin-top: 5px;
	}
	#phonecheck {
		background-color: #F8F8F8;
		border: 1px solid #D5D5D5;
		margin-top: 5px;
		padding: 2px 5px;
	}
</style>

<script>
	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}

	function captureReturnKey(e) { 
	    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
	    return false; 
	} //submit 엔터키 막는방법 2 -> form태그에 onkeydown추가해줘야됨
	
	$(function() {
		/* $('input[type="text"]').keydown(function() {
			if (event.keyCode === 13) {
				event.preventDefault();
			};
		}); //submit 엔터키 막는방법 1  */
		
		/* $("input[type='text']").keypress(function(e) { 
		    if (e.keyCode == 13){
		        action();
		    }    
		}); //input type text에 enter키 이벤트 지정 */
		
		$("#salBtn").click(function() {
			var res = confirm("결제하시겠습니까?");
			var m = $("input[name='mileage']").val();
			
			if(res == true) {
				$("input[name='salClassify']").attr("value", $("input[type='radio']:checked").val());
				$("input[name='salPrice']").attr("value", ${totalPrice}-Number(m));
				$("input[name='salDiscount']").attr("value", Number(m));
			}else {
				return false;				
			}
			
			if(pcheck == false) {
				alert("휴대폰번호 중복체크를 해주세요.");
				return false;
			}
		})
		
		var p = $(".totalPrice").text();
		$("input[name='mileage']").change(function() {
			$(".reg").css("display", "none");
			
			var price = $(".totalPrice").attr("date-price");
			var to_price = price - $("input[name='mileage']").val();
			
			if($("input[name='mileage']").val() > $("#mil").text()) {
				$(".reg").css("display", "block");
				$("input[name='mileage']").val("");
				$(".totalPrice").text(p);
				return false;
			}else {
				$(".totalPrice").text(addComma(to_price)+"원");
			}
		})
		
		var pcheck = false;
		$("#phonecheck").click(function(e) {
			e.preventDefault();
			
			$(".reg").css("display", "none");
			$(".phonecheckF").css("display", "none");
			$(".phonecheckS").css("display", "none");
			
			var reg_tel = /^(010|011|016|017|018)[-]{1}[0-9]{3,4}[-]{1}[0-9]{4}$/;
			
			if($("input[name='memPhone']").val() == "" || reg_tel.test($("input[name='memPhone']").val()) == false) {
				$("input[name='memPhone']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/join/phonecheck2",
				type : "post",
				data : {"memPhone":$("input[name='memPhone']").val()},
				dataType: "text",
				success : function(res) {
					console.log(res);
					
					if(res == "yes") {
						$(".phonecheckS").css("display", "none");
						$(".phonecheckF").css("display", "inline");
						pcheck = false;
					}else {
						$(".phonecheckF").css("display", "none");
						$(".phonecheckS").css("display", "inline");
						pcheck = true;
					}
				}
			})
		})
	})
</script>

	<section>
		<div class="sale_sec_left">
			<div id="sale_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>승차권</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/"><p class="sale_color">승차권예약</p></a>
				<a href="${pageContext.request.contextPath}/res/reservation"><p>발권/취소/변경</p></a>
			</div>
		</div>
		<div class="sale_sec_right">
			<div id="sale_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">승차권</a> > 
					<a href="${pageContext.request.contextPath}/">승차권예약</a></p>
				<h1>결제</h1>
				<div id="orderWrap">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck01.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck02.png">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck03_on.gif">
					<img src="${pageContext.request.contextPath}/resources/images/res/step_tck04.png">
				</div>
				<div class="clear"></div>
			</div>
			<div id="sale_list">
				<div id="saleimg_top">
					<img src="${pageContext.request.contextPath}/resources/images/sale/tit_tick03.gif">
					<img src="${pageContext.request.contextPath}/resources/images/sale/tit_tick03_img.png">
				</div>
				<ul>
					<li>결제방법은 신용카드, 계좌이체, 포인트구매로 3가지가 있습니다.</li>
					<li>장바구니에 담기는 승차권과 여행상품을 담아 한번에 통합결제 하는 방법입니다.</li>
					<li>장바구니를 통해 결제를 진행하시려는 분은 결제 정보 입력 없이 바로 장바구니 담기를 클릭하시기 바랍니다.</li>
				</ul>
				<div id="pricewrap">
					총 결제 금액은 <b class="red"><fmt:formatNumber pattern="###,###" value="${totalPrice}"/></b>원 입니다.				
				</div>
				<form action="ticketing" method="post" onkeydown="return captureReturnKey(event)">
					<table>
						<tr>
							<th>결제수단</th>
							<td>
								<input type="radio" name="card" id="a" checked="checked" value="0"> <label for="a">신용카드</label>
								<input type="radio" name="card" id="b" value="1"> <label for="b">계좌이체</label>
							</td>
						</tr>
						<tr>
							<c:if test="${Auth != null}">
								<th>마일리지</th>
								<td>
									<c:if test="${Auth.memMileage == 0}">
										<input type="hidden" name="memPhone" value="${Auth.memPhone}">
										<input type="text" name="mileage" class="none"><b>(${Auth.memMileage}원 사용가능)</b>
									</c:if>
									<c:if test="${Auth.memMileage != 0}">
										<input type="text" name="mileage"><b>(<fmt:formatNumber pattern="###,###" value="${Auth.memMileage}"/>원 사용가능)</b>
										<div class="none" id="mil">${Auth.memMileage}</div>
										<span class="reg">보유하신 마일리지만큼 사용가능합니다.</span>
									</c:if>
								</td>
							</c:if>
							<c:if test="${Auth == null}">
								<th>휴대폰번호</th>
								<td>
									<input type="text" name="mileage" class="none">
									<%-- <a href="${pageContext.request.contextPath}/login/login">(※ 회원전용입니다. 로그인하시겠습니까?)</a> --%>
									<input type="text" name="memPhone"><span>-를 포함한 휴대폰번호</span><br>
									<button type="button" id="phonecheck">휴대폰번호 중복체크</button>
									<span class="reg">-를 포함한 휴대폰번호를 다시 입력해주세요</span>
									<span class="phonecheckF"><br>이미 가입되어 있는 휴대폰번호입니다. 비회원으로 예매하시겠습니까?
									<a href="${pageContext.request.contextPath}/login/login">(※ 로그인하시겠습니까?)</a></span>
									<span class="phonecheckS">비회원으로 예매가능합니다.</span>
								</td>
							</c:if>
						</tr>
						<tr>
							<th>총결제금액</th>
							<td><b class="red totalPrice" date-price="${totalPrice}"><fmt:formatNumber pattern="###,###" value="${totalPrice}"/>원</b></td>
						</tr>
					</table>
					<input type="hidden" name="memId" value="${Auth.memId}">
					<input type="hidden" name="tName" value="${tName}">
					<input type="hidden" name="tCode" value="${tCode}">
					<input type="hidden" name="ttNo" value="${ttNo}">
					<input type="hidden" name="salClassify">
					<input type="hidden" name="salPrice" value="${totalPrice}">
					<input type="hidden" name="salDiscount">
					<input type="hidden" name="nomemPhone" value="${nomemPhone}">
					<div id="btn">
						<button id="salBtn">결제하기</button>
					</div>
				</form>
			</div>
		</div>
	</section>
    
<%@ include file="../include/footer.jsp" %>