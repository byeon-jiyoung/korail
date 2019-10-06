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
	}
	.join_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	#join_back2 {
		background: url("${pageContext.request.contextPath}/resources/images/join/tra_visual13.jpg") no-repeat right top;
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
	#join_list {
		padding: 0 30px;
	}
	#join_list > b {
		font-size: 1.2em;
	}
	#join_list > span {
		font-size: 0.8em;
		font-weight: bold;
		float: right;
		padding-top: 15px;
	}
	.red {
		color: red;
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
	td, .pw {
		border-left: 1px solid #d6d3d3;
	}
	th {
		background-color: #F8F8F8;
		width: 20%;
		text-align: right;
		padding-right: 10px;
	}
	td {
		padding-left: 10px;
	}
	table span {
		font-size: 0.9em;
		padding-left: 5px;
	}
	.blue {
		color: #0e91f6;
	}
	table ul {
		list-style: disc;
		font-size: 0.9em;
		padding-left: 15px;
		padding-top: 10px;
	}
	form > p {
		color: red;
		font-size: 0.8em;
		margin-bottom: 20px;
	}
	input {
		border: 1px solid #D5D5D5;
		padding: 3px 0;
	}
	#idcheck, input[type="button"], #phonecheck {
		background-color: #F8F8F8;
		border: 1px solid #D5D5D5;
		margin-top: 5px;
		padding: 2px 5px;
	}
	form > div {
		float: right;
	}
	#clean, #cancel, #joinPost {
		padding: 5px 10px;
		background-color: #F6F6F6;
		border: 1px solid #D5D5D5;
	}
	#joinPost {
		background: url("${pageContext.request.contextPath}/resources/images/join/btn_bg_blue.gif") repeat-x;
		background-size: auto 100%;
		color: white;
		border: 1px solid #266fcb;
	}
	
	/*------------ ajax -------------*/
	.idcheckS, .phonecheckS {
		color: blue;
		display: none;
	}
	.error, .reg, .idcheckF, .phonecheckF {
		color: red;
		display: none;
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
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		$("#clean").click(function() { //다시쓰기버튼
			check = false;
		})
		
		$("#cancel").click(function() { //취소버튼
			check = false;
			location.href = "${pageContext.request.contextPath}/";
		})
		
		var check = false; //아이디중복체크버튼
		$("#idcheck").click(function(e) {
			e.preventDefault();
			
			var id = $("input[name='memId']").val();
			var reg_id = /^[a-z][a-z0-9]{6,15}$/i;
			
			$(".reg").css("display", "none");
			
			if(id == "" || reg_id.test(id) == false) {
				$("input[name='memId']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath}/join/idcheck",
				type : "post",
				data : {"memId":id},
				dataType: "text",
				success : function(res) {
					console.log(res);
					
					if(res == "yes") {
						$(".idcheckS").css("display", "none");
						$(".idcheckF").css("display", "inline");
						$("input[name='memId']").val("");
						check = false;
					}else {
						$(".idcheckF").css("display", "none");
						$(".idcheckS").css("display", "inline");
						check = true;
					}
				}
			})
		})
		
		var pcheck = false;
		$("#phonecheck").click(function(e) {
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
		
		$("#joinForm").submit(function() {
			if(check == false) {
				alert("아이디 중복체크를 해주세요.");
				return false;
			}
			
			if(pcheck == false) {
				alert("휴대폰번호 중복체크를 해주세요.");
				return false;
			}
			
			$(".reg").css("display", "none");
			$(".error").css("display", "none");
			
			var reg_name = /^[가-힣]{2,5}$/;
			var reg_pw = /^[a-z][a-z0-9!@#$*%]{8,14}$/i;
			var reg_tpw =  /^[0-9]{4}$/;
			var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							//^[0-9a-zA-Z] => 첫글자는 숫자 또는 영문자
							//([-_.]?[0-9a-zA-Z])*@ => @ 앞에(- 또는 _ 또는 .이 0번 또는 1번, 그 뒤에는 숫자,영문자)이 한번 또는 여러번	
							//([-_.]?[0-9a-zA-Z])*. => . 앞에(- 또는 _ 또는 .이 0번 또는 1번, 그 뒤에는 숫자,영문자)이 한번 또는 여러번
							//[a-zA-Z]{2,3}$ => . 뒤 마지막 문자열은 영문자가 2~3개
			
			if($("input[name='memName']").val() == "" || reg_name.test($("input[name='memName']").val()) == false) {
				$("input[name='memName']").next(".reg").css("display", "inline");
				return false;
			}
				
			if($("input[name='memPw']").val() == "" || reg_pw.test($("input[name='memPw']").val()) == false) {
				$("input[name='memPw']").nextAll().css("display", "none");
				$("input[name='memPw']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			if($("input[name='memPwCheck']").val() == "") {
				$("input[name='memPwCheck']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			if($("input[name='memPw']").val() != $("input[name='memPwCheck']").val()) {
				$("input[name='memPwCheck']").nextAll(".error").css("display", "inline");
				return false;
			}
			
			if($("input[name='memTpw']").val() == "" || reg_tpw.test($("input[name='memTpw']").val()) == false) {
				$("input[name='memTpw']").nextAll().css("display", "none");
				$("input[name='memTpw']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			if($("input[name='memTpwCheck']").val() == "") {
				$("input[name='memTpwCheck']").nextAll(".reg").css("display", "inline");
				return false;
			}
			
			if($("input[name='memTpw']").val() != $("input[name='memTpwCheck']").val()) {
				$("input[name='memTpwCheck']").nextAll(".error").css("display", "inline");
				return false;
			}
			
			if($("input[name='birth']").val() != "") {
				var birth = new Date($("input[name='birth']").val()).getTime();
				var today = new Date().getTime();
		      	 
				if(birth > today) {
					$("input[name='birth']").next(".reg").css("display", "inline");
						 return false;
				} 
			}
			
			if($("input[name='memEmail']").val() != "") {
				if(reg_email.test($("input[name='memEmail']").val()) == false) {
					$("input[name='memEmail']").next(".reg").css("display", "inline");
					return false;
				}
			}
			
			alert("회원가입에 성공하였습니다. 로그인해주세요");
		})
	})
</script>
	<section>
		<div class="join_sec_left">
			<div id="join_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>코레일멤버십</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/"><p>멤버십소개</p></a>
				<a href="${pageContext.request.contextPath}/"><p class="join_color">멤버십가입신청</p></a>
				<a href="${pageContext.request.contextPath}/"><p>멤버십탈퇴</p></a>
			</div>
		</div>
		<div class="join_sec_right">
			<div id="join_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">코레일멤버십</a> > 
					<a href="${pageContext.request.contextPath}/">멤버십가입신청</a></p>
				<h1>멤버십가입신청</h1>
			</div>
			<div id="join_list">
				<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <b>고객 기본정보</b>
				<span><b class="red">*</b> 표시 필수입력 항목</span>
				<form action="join" method="post" id="joinForm">
					<table>
						<tr>
							<th><b class="red">*</b> 아이디</th>
							<td colspan="2">
								<input type="text" name="memId"><span>영문자,숫자 6자리 이상 아이디</span><br>
								<button type="button" id="idcheck">아이디 중복체크</button>
								<span class="idcheckF">이미 존재하는 아이디 입니다</span>
								<span class="idcheckS">사용 가능한 아이디 입니다</span>
								<span class="reg">영문자,숫자 6자리 이상 입력하세요</span>
							</td>
						</tr>
						<tr>
							<th><b class="red">*</b> 성명</th>
							<td colspan="2">
								<input type="text" name="memName">
								<span class="reg">한글(2~5자리) 입력하세요</span>
							</td>
						</tr>
						<tr>
							<th rowspan="3"><b class="red">*</b> 홈페이지</th>
							<th class="pw">비밀번호</th>
							<td>
								<input type="password" name="memPw"><span>영문자,숫자,특수문자 8자리이상 비밀번호</span>
								<span class="reg">영문자,숫자,특수문자 8자리이상 입력하세요</span>
							</td>
						</tr>
						<tr>
							<th class="pw">비밀번호 확인</th>
							<td>
								<input type="password" name="memPwCheck">
								<span class="reg">비밀번호 확인란을 입력해주세요</span>
								<span class="error">비밀번호가 일치하지 않습니다</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="blue">코레일홈페이지, 코레일톡에서 사용하는 로그인 비밀번호입니다.<br>&nbsp;영문자, 숫자, 특수문자 8자리이상의 비밀번호를 설정하셔야 합니다.</span>
							</td>
						</tr>
						<tr>
							<th rowspan="3"><b class="red">*</b> 현장발권</th>
							<th class="pw">비밀번호</th>
							<td>
								<input type="password" name="memTpw"><span>숫자 4자리 비밀번호</span>
								<span class="reg">숫자 4자리로 입력해주세요</span>
							</td>
						</tr>
						<tr>
							<th class="pw">비밀번호 확인</th>
							<td>
								<input type="password" name="memTpwCheck">
								<span class="reg">비밀번호 확인란을 입력해주세요</span>
								<span class="error">비밀번호가 일치하지 않습니다</span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="blue">자동발매기, 역창구에서 사용하는 현장발권 비밀번호입니다.<br>&nbsp;역에서 발권하고자 하는 고객님은 숫자 4자리 비밀번호를 알고 가셔야 합니다.</span>
							</td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td colspan="2">
								<input type="date" name="birth">
								<span class="reg">생일을 다시 입력해주세요</span>
							</td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td colspan="2">
								<input type="text" name="memEmail">
								<span class="reg">이메일을 다시 입력해주세요</span>
							</td>
						</tr>
						<tr>
							<th><b class="red">*</b> 휴대폰번호</th>
							<td colspan="2">
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
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="2">
			                  	<input type="text" id="sample4_postcode">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" name="memAddress">
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" name="memDetailaddr">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목">
								<span>(상세주소 입력)</span>
							</td>
						</tr>
					</table>
					<p>※ 필수사항 외 고객정보 미기재 시 고객센터에서 개인정보 변경 불가</p>
					<div>
						<input type="reset" id="clean" value="다시쓰기">
						<input type="reset" id="cancel" value="취소">
						<input type="submit" id="joinPost" value="신청">
					</div>
				</form>
			</div>
		</div>
	</section>
    
<%@ include file="../include/footer.jsp" %>