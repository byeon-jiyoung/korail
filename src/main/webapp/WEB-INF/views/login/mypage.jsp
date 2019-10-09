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
	
	#join_list > div {
		font-size: 1.1em;
	}
	#join_list > img {
		float: right;
		margin-bottom: 10px;
	}
	#join_list > img::after {
		clear: both;
	}
	#morebtn {
		cursor: pointer;
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
		border-bottom: 2px solid #d6d3d3;
		padding: 10px 0;
	}
	td, .border {
		border-left: 1px solid #d6d3d3;
	}
	.mymy th {
		background-color: #F8F8F8;
		width: 16%;
		text-align: inherit;
		padding-left: 20px;
	}
	.mymy td {
		width: 34%;
		padding-left: 10px;
	}
	.pricetd {
		width: 84% !important;
	}
	.mymy button {
		background-color: #8C8C8C;
		color: white;
		padding: 3px 5px;
		border: none;
		border-radius: 5px;
	}
	.small {
		font-size: 0.8em;
		color: #5D5D5D;
	}
	.red {
		color: red;
	}
	
	
	/*----------------------------handlebars-----------------------------------*/
	.mymy2 th {
		background-color: #F8F8F8;
		width: 22%;
		text-align: right;
		padding-right: 10px;
	}
	.mymy2 span {
		font-size: 0.9em;
		padding-left: 5px;
	}
	.mymy2 ul {
		list-style: disc;
		font-size: 0.9em;
		padding-left: 15px;
		padding-top: 10px;
	}
	.mymy2 td {
		padding-left: 10px;
	}
	.mymy2 button {
		background: url("${pageContext.request.contextPath}/resources/images/login/btn_wit.png") repeat-x;
		border: 1.5px solid #9e9e9e;
		border-radius: 5px;
		padding: 3px 5px;
	}
	.phonedisplay, .addressdisplay, .pwdisplay, .tpwdisplay {
		display: none;
		margin-top: 5px;
	}
	.right {
		font-size: 0.9em;
		float: right;
		margin-bottom: 10px;
		display: none;
	}
	#modifyBtnwrap {
		float: right;
		display: none;
	}
	#modifyBtn {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		padding: 5px 15px;
		color: white;
		border: 1.5px solid #16539f;
	}
	.cancelBtn {
		background: url("${pageContext.request.contextPath}/resources/images/login/btn_bg_gray.png") repeat-x;
		border: 1.5px solid #9e9e9e;
		padding: 5px 15px;
	}
	.join_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	.phonecheckS {
		color: blue;
		display: none;
	}
	.reg, .phonecheckF, .error, .reg2 {
		color: red;
		display: none;
	}
	.reg2 {
		font-size: 0.8em;
	}
	
	#phonecheck, input[type="button"] {
		margin-top: 5px;
		background-color: #F8F8F8;
		border: 1px solid #D5D5D5;
		padding: 2px 5px;
		border-radius: 5px;
	}
	input {
		border: 1px solid #D5D5D5;
		padding: 3px 0;
	}
	.blue {
		color: #0e91f6;
	}
	
	/*------------ daum주소 -------------*/
	#sample4_jibunAddress, #sample4_extraAddress {
		display: none;
	}
	#sample4_postcode {
		width: 100px;
		margin-bottom: 5px;
	}
	#sample4_roadAddress {
		width: 220px;
	}
	#sample4_detailAddress {
		width: 280px;
	}
	
	/*-------------- 비밀번호변경 -------------------*/
	#chpwWrap {
		display: none;
	}
	#chpw {
		border: 1px solid #dfdfdf;
		background-color: #f4f6f8;
		padding: 15px 20px;
		font-size: 0.9em !important;
	}
	#chpw ul {
		color: #0078a5;
		list-style: disc;
		padding: 5px 0 0 20px;
	}
	#chpw2 {
		overflow: hidden;
		margin-top: 40px;
		font-size: 0.8em;
	}
	#chpw2 b {
		font-size: 1.2em;
	}
	#pwLeft {
		float: left;
		width: 45%;
		border-right: 2px solid #cfcfcf;
		padding: 10px 15px;
	}
	#pwRight {
		float: right;
		width: 45%;
		padding: 10px;
	}
	.btns {
		float: right;
		margin-top: 10px;
	}
	#updatetpwBtn, #updatepwBtn {
		background: url("${pageContext.request.contextPath}/resources/images/res/btn_bg_blue.png") repeat-x;
		padding: 5px 15px;
		color: white;
		border: 1.5px solid #16539f;
	}
	.txt_blu {
		color: #3590d2;
	}
	th {
		background-color: #F8F8F8;
	}
	td {
		padding-left: 10px;
	}
</style>

<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.2.0/handlebars.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script id="template" type="text/x-handlebars-template">
		<tr>
			<th><b class="red">*</b> 아이디</th>
			<td>${member.memId}</td>
		</tr>
		<tr>
			<th><b class="red">*</b> 성명</th>
			<td>${member.memName}</td>
		</tr>
		<tr>
			<th><b class="red">*</b> 비밀번호</th>
			<td><button type="button" class="changePw">비밀번호변경</button></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<c:if test="${member.memBirth == null}">
					<span class="small">(생년월일을 입력하지 않았습니다.)</span>
				</c:if>
				<c:if test="${member.memBirth != null}">
					<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${member.memBirth}"/>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td>
				<c:if test="${member.memEmail == ''}">
					<span class="small">(이메일을 입력하지 않았습니다.)</span>
				</c:if>
				<c:if test="${member.memEmail != ''}">
					${member.memEmail}
				</c:if>
			</td>
		</tr>
		<tr>
			<th><b class="red">*</b> 휴대폰번호</th>
			<td>${member.memPhone} <button id="changePhone" type="button">휴대폰번호변경</button>
				<div class="phonedisplay">
					<input type="text" name="memPhone"><span>-를 포함한 휴대폰번호</span><br>
					<button type="button" id="phonecheck">휴대폰번호 중복체크</button>
					<span class="reg">-를 포함한 휴대폰번호를 다시 입력해주세요</span>
					<span class="phonecheckF"><br>이미 가입되어 있는 휴대폰번호입니다. 아이디 찾기/비밀번호 찾기를 해주세요</span>
					<span class="phonecheckS">가입 가능한 휴대폰번호 입니다</span>
					<ul>
						<li>휴대폰 번호를 등록하시면 코레일 홈페이지, 코레일톡에 휴대폰번호로 로그인 할 수 있습니다.</li>
						<li>'비밀번호 찾기'시 등록된 휴대폰전화로 SMS 전송 가능합니다.</li>
						<li>휴대전화 번호<span class="blue">변경시, 인증을 통해서만 변경</span>이 가능합니다.</li>
					</ul>
				</div>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				<c:if test="${member.memAddress != '' || member.memDetailaddr != ''}">
					${member.memAddress} ${member.memDetailaddr} <button id="changeAddr" type="button">주소변경</button>
				</c:if>
				<c:if test="${member.memAddress == '' && member.memDetailaddr == ''}">
					<span class="small">(주소를 입력하지 않았습니다.)</span>
				</c:if>
				<div class="addressdisplay">
			    	<input type="text" id="sample4_postcode">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample4_roadAddress" name="memAddress">
					<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="sample4_detailAddress" name="memDetailaddr">
					<input type="text" id="sample4_extraAddress" placeholder="참고항목">
					<span>(상세주소 입력)</span>
				</div>
			</td>
		</tr>	
</script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 참고 항목 변수
	
	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('sample4_postcode').value = data.zonecode;
	            document.getElementById("sample4_roadAddress").value = roadAddr;
	            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	            } else {
	                document.getElementById("sample4_extraAddress").value = '';
	            }
	
	            var guideTextBox = document.getElementById("guide");
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            if(data.autoRoadAddress) {
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                guideTextBox.style.display = 'block';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                guideTextBox.style.display = 'block';
	            } else {
	                guideTextBox.innerHTML = '';
	                guideTextBox.style.display = 'none';
	            }
	        }
	    }).open();
	}

	$(function() {
		$("#morebtn").click(function() {
			var id = "${Auth.memId}";
			
			$(".mymy2").empty();
			
			$(".mymy").hide();
			$("#morebtn").css("display", "none");
			$(".right").css("display", "block");
			$("#modifyBtnwrap").css("display", "block");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/login/mypagedetail?memId="+id,
				type: "get",
				dataType: "json",
				success: function(res) {
					console.log(res);
					
					var source = $("#template").html();
					var fn = Handlebars.compile(source);
					var str = fn(res);
					$(".mymy2").append(str);
				}
			})
		})
		
		$(document).on("click", ".changePw", function() {
			$("#join_list > table").hide();
			$("#join_list > div").hide();
			$("#join_list > img").hide();
			$(".right").css("display", "none");
			$("#modifyForm").hide();
			$("#join_back2 h1").text("비밀번호변경");
			$("#chpwWrap").css("display", "block");
		})
		
		$(".cancelBtn").click(function() {
			var id = "${Auth.memId}";
			location.href = "${pageContext.request.contextPath}/login/mypage?memId="+id;
		})
		
		$(document).on("click", "#changePhone", function() {
			$(".phonedisplay").toggle();
		})
		
		var pcheck = false;
		$(document).on("click", "#phonecheck", function(e) {
			e.preventDefault();
			
			$(".reg").css("display", "none");
			
			var reg_tel = /^(010|011|016|017|018)[-]{1}[0-9]{3,4}[-]{1}[0-9]{4}$/;
			
			if($("input[name='memPhone']").val() == "" || reg_tel.test($("input[name='memPhone']").val()) == false) {
				$("input[name='memPhone']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/join/phonecheck",
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
		
		$(document).on("click", "#changeAddr", function() {
			$(".addressdisplay").toggle();
		})
		
		$("#modifyForm").submit(function() {
			if($("input[name='memPhone']").val() == "") {
				$("input[name='memPhone']").val("${member.memPhone}");
				pcheck = true;
			}
			if($("input[name='memAddress']").val() == "") {
				$("input[name='memAddress']").val("${member.memAddress}");
			}
			if($("input[name='memDetailaddr']").val() == "") {
				$("input[name='memDetailaddr']").val("${member.memDetailaddr}");
			}

			if(pcheck == false) {
				alert("휴대폰번호 중복체크를 해주세요.");
				return false;
			}
		})
		
		//기존비밀번호가 일치하는지 확인
		$(document).on("click", "#confirmPw", function() {
			var pw = "${member.memPw}";
			var id = "${member.memId}"; 
			
			$.ajax({
				url: "${pageContext.request.contextPath}/login/confirmPw",
				date: {"pw":pw, "id":id},
				type: "post",
				dataType: "text",
				success: function(res) {
					console.log(res);
					
					
				}
			})
		})
		
		$("#pwForm").submit(function() {
			$(".reg").css("display", "none");
			$(".reg2").css("display", "none");
			$(".error").css("display", "none");
			
			var reg_pw = /^[a-z][a-z0-9!@#$*%]{8,14}$/i;
			
			if($("input[name='memPw']").val() == "") {
				$("input[name='memPw']").nextAll(".reg").css("display", "block");
				return false;
			}
			
			if($("input[name='newmemPw']").val() == "" || reg_pw.test($("input[name='newmemPw']").val()) == false) {
				$("input[name='newmemPw']").nextAll(".reg2").css("display", "block");
				return false;
			}
			
			if($("input[name='newmemPwCheck']").val() == "") {
				$("input[name='newmemPwCheck']").nextAll(".reg").css("display", "block");
				return false;
			}
			
			if($("input[name='newmemPw']").val() != $("input[name='newmemPwCheck']").val()) {
				$("input[name='newmemPwCheck']").nextAll(".error").css("display", "block");
				return false;
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
				<a href="${pageContext.request.contextPath}/login/mypage?memId=${Auth.memId}"><p id="memberMgn" class="join_color">회원정보관리</p></a>
				<a href=""><p id="ticketList">승차권이용내역</p></a>
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
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <b>나의 기본정보</b>
				</div>
				<img src="${pageContext.request.contextPath}/resources/images/login/more.png" id="morebtn">
				<table class="mymy">
					<tr>
						<th>회원명</th>
						<td>${member.memName}</td>
						<th class="border">아이디</th>
						<td>${member.memId}</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><button class="changePw">비밀번호변경</button></td>
						<th class="border">생년월일</th>
						<c:if test="${member.memBirth == null}">
							<td><span class="small">(생년월일을 입력하지 않았습니다.)</span></td>
						</c:if>
						<c:if test="${member.memBirth != null}">
							<td><fmt:formatDate pattern="yyyy년 MM월 dd일" value="${member.memBirth}"/></td>
						</c:if>
					</tr>
					<tr>
						<th>이메일</th>
						<c:if test="${member.memEmail == ''}">
							<td><span class="small">(이메일을 입력하지 않았습니다.)</span></td>
						</c:if>
						<c:if test="${member.memEmail != ''}">
							<td>${member.memEmail}</td>
						</c:if>
						<th class="border">휴대폰번호</th>
						<td>${member.memPhone}</td>
					</tr>
					<tr>
						<th>주소</th>
						<c:if test="${member.memAddress == '' && member.memDetailaddr == ''}">
							<td colspan="3"><span class="small">(주소를 입력하지 않았습니다.)</span></td>
						</c:if>
						<c:if test="${member.memAddress != '' || member.memDetailaddr != ''}">
							<td colspan="3">${member.memAddress} ${member.memDetailaddr}</td>
						</c:if>
					</tr>
				</table>
				<table class="mymy">
					<tr>
						<th>마일리지</th>
						<td class="pricetd"><fmt:formatNumber pattern="###,###" value="${member.memMileage}" />원</td>
					</tr>
				</table>
				
				<!-- 비밀번호변경버튼 클릭 시 보이는 화면 -->
				<div id="chpwWrap">
					<div id="chpw">
						<b><img src="${pageContext.request.contextPath}/resources/images/login/icon_check.gif"> 이 페이지에서 이용 가능한 서비스</b>
						<ul>
							<li>홈페이지 비밀번호 (영문자, 숫자, 특수문자 8자리이상) 변경</li>
							<li>현장발권 비밀번호(4자리) 변경</li>
							<li>개인정보와 관련된 숫자, 연속된 숫자, 동일 반복된 숫자 등은 사용하지 마십시오.</li>
						</ul>
					</div>
					<div id="chpw2">
						<div id="pwLeft">
							<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <b> 홈페이지 비밀번호 변경</b> <br>
							<strong>코레일 홈페이지, 코레일 톡</strong>에서 사용하는 비밀번호입니다. <br>
							<span class="txt_blu"> 영문자, 숫자, 특수문자 8자리이상의 비밀번호입니다.</span>
							<form action="changePw" method="post" id="pwForm">
								<input type="hidden" name="memId" value="${member.memId}">
								<table>
									<tr>
										<th><span class="red">*</span> 기존 비밀번호 입력</th>
										<td>
											<input type="password" name="memPw">
											<button type="button" id="confirmPw">비밀번호확인</button>
											<span class="reg">비밀번호를 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th><span class="red">*</span> 신규 비밀번호 입력</th>
										<td>
											<input type="password" name="newmemPw">
											<span class="reg2">영문자,숫자,특수문자 8자리이상 입력하세요</span>
										</td>
									</tr>
									<tr>
										<th><span class="red">*</span> 비밀번호 확인 입력</th>
										<td>
											<input type="password" name="newmemPwCheck">
											<span class="reg">비밀번호를 입력해주세요</span>
											<span class="error">비밀번호가 일치하지 않습니다</span>
										</td>
									</tr>
								</table>
								<div class="btns">
									<button id="updatepwBtn">수정완료</button>
									<button type="button" class="cancelBtn">취소</button>
								</div>
							</form>
						</div>
						<div id="pwRight">
							<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <b> 현장발권 비밀번호 변경</b> <br>
							<strong>자동발매기, 역창구</strong>에서 사용하는 현장발권(마일리지 포함) 비밀번호입니다. <br>
							<span class="txt_blu"> 숫자 4자리 비밀번호입니다.</span>
							<form action="changeTpw" method="post" id="tpwForm">
								<input type="hidden" name="memId" value="${member.memId}">
								<table>
									<tr>
										<th><span class="red">*</span> 기존 비밀번호 입력</th>
										<td>
											<input type="password" name="memTpw">
											<button type="button">비밀번호확인</button>
											<span class="reg">비밀번호 확인란을 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th><span class="red">*</span> 신규 비밀번호 입력</th>
										<td><input type="password" name="newmemTpw"></td>
									</tr>
									<tr>
										<th><span class="red">*</span> 비밀번호 확인 입력</th>
										<td>
											<input type="password" name="newmemTpwCheck">
											<span class="reg">비밀번호 확인란을 입력해주세요</span>
											<span class="error">비밀번호가 일치하지 않습니다</span>
										</td>
									</tr>
								</table>
								<div class="btns">
									<button id="updatetpwBtn">수정완료</button>
									<button type="button" class="cancelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				<!-- 더보기버튼 클릭 시 보이는 화면 -->				
				<span class="right"><b class="red">*</b> 표시 필수입력 항목</span>				
				<form action="udpateMember" method="post" id="modifyForm">
					<input type="hidden" name="memId" value="${member.memId}">
					<table class="mymy2">
					</table>
					<div id="modifyBtnwrap">
						<button type="submit" id="modifyBtn">수정완료</button>
						<button class="cancelBtn">취소</button>
					</div>
				</form>
			</div>
		</div>
	</section>
    
<%@ include file="../include/footer.jsp" %>