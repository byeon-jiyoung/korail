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
	.clear { 
		clear: both;
	}
	
	
</style>

<script>
	
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
				
			</div>
		</div>
		
	</section>
    
<%@ include file="../include/footer.jsp" %>