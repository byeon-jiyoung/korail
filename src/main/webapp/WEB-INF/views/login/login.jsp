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
		background: url("${pageContext.request.contextPath}/resources/images/login/tra_visual11.jpg") no-repeat right top;
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
		padding-bottom: 40px;
		padding-top: 10px;
	}
	
	#join_list {
		padding: 0 30px;
	}
	#join_list > div:first-child {
		margin-top: 20px;
	}
	#loginWrap {
		background-color: #deebf4;
		border: 1px solid #ccdbe6;
		width: 57%;
		float: left;
		padding: 30px;
		margin-top: 20px;
	}
	#loginWrap ul {
		margin-bottom: 30px;
		overflow: hidden;
	}
	#loginWrap li {
		float: left;
		font-size: 0.8em;
		margin-right: 17px;
	}
	#loginForm p {
		float: left;
	}
	#loginForm label {
		width: 177px;
		float: left;
		font-weight: bold;
		font-size: 0.8em;
		padding-top: 5px;
	}
	input[type="text"], input[type="password"] {
		padding: 3px 0;
		border: 1px solid #ddd;
		width: 180px;
		margin-bottom: 2px;
	}
	#loginWrap > div {
		float: right;
		padding-top: 10px;
	}
	#loginWrap button {
		background: url("${pageContext.request.contextPath}/resources/images/login/btn_bg_gray.png") repeat-x;
		border: 1px solid #9e9e9e;
		padding: 5px;
		font-size: 0.8em;
	}
	#loginWrap > span {
		font-size: 0.8em;
		padding-top: 30px;
		display: block;
		clear: both;
	}
	#loginBtn {
		margin-left: 10px;
	}
	#noMemDiv {
		background-color: #f0f0f0;
		border: 1px solid #ccdbe6;
		width: 25%;
		float: right;
		padding: 30px 30px 55px;
		font-size: 0.8em;
		margin-top: 20px;
	}
	#noMemDiv img {
		width: 100%;
		margin: 10px 0 0 0;
	}
	#goRes {
		margin-top: 30px !important;
	}
	.redColor {
		color: red;
	}
	#clear {
		clear: both;
	}
	#l_info {
		list-style: disc;
		padding-left: 20px;
		font-size: 0.8em;
		margin-top: 20px;
	}
</style>
<script>
	$(function() {
		$("#goJoin").click(function() {
			location.href = "${pageContext.request.contextPath}/join/join";
		})
	})
</script>
	<section>
		<div class="join_sec_left">
			<div id="join_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>로그인</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/"><p class="join_color">로그인</p></a>
				<a href="${pageContext.request.contextPath}/"><p>회원번호찾기</p></a>
				<a href="${pageContext.request.contextPath}/"><p>비밀번호찾기</p></a>
			</div>
		</div>
		<div class="join_sec_right">
			<div id="join_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">로그인</a> > 
					<a href="${pageContext.request.contextPath}/">로그인</a></p>
				<h1>로그인</h1>
			</div>
			<div id="join_list">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <b>코레일멤버십 로그인</b>
				</div>
				<div id="loginWrap">
					<ul>
						<li><input type="radio" name="classLogin" id="a"><label for="a"> 멤버십번호 로그인</label></li>
						<li><input type="radio" name="classLogin" id="b"><label for="b"> 이메일 아이디 로그인</label></li>
						<li><input type="radio" name="classLogin" id="c"><label for="c"> 휴대전화번호 로그인</label></li>
					</ul>
					<form id="loginForm" action="loginPost">
						<p>
							<label>코레일멤버십번호</label>
							<input type="text"> <br>
							<label>비밀번호</label>
							<input type="password">
						</p>
						<p id="loginBtn">
							<img src="${pageContext.request.contextPath}/resources/images/login/btn_login.png">
						</p>
					</form>
					<div>
						<button>멤버십(회원)번호 찾기</button>
						<button>비밀번호 찾기</button>
						<button id="goJoin">멤버십 가입</button>
					</div>
					<span>* 비밀번호 5회 오류시 로그인할 수 없습니다.</span>
				</div>
				<div id="noMemDiv">
					<span class="redColor">미등록고객</span>은 아래의 버튼을 이용하시기 바랍니다.
					<img src="${pageContext.request.contextPath}/resources/images/login/btn_no_res.png" id="goRes">
					<img src="${pageContext.request.contextPath}/resources/images/login/btn_no_ret.png">
				</div>
				<div id="clear"></div>
				<ul id="l_info">
					<li>「홈>마이페이지>회원정보 관리>이메일/휴대폰 인증」에서 이메일, 휴대폰 인증을 받으시면 이메일 또는 휴대폰번호로 로그인할 수 있습니다.</li>
					<li>로그인 후 10분간 입력이 없을 경우 <span class="redColor">자동으로 로그아웃</span> 됩니다.</li>
				</ul>
			</div>
		</div>
	</section>
    
<%@ include file="../include/footer.jsp" %>