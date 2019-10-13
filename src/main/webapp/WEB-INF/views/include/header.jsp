<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Korail</title>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	a {
		color: black;
		text-decoration: none;
	}
	body {
		background-color: #f5f5f5;
		min-width: 1070px;
	}
	ul {
		list-style: none;
	}
	/* ====================================== header ====================================== */	
	header {
		width: 100%;
	}
	#head1 {
		width: 1070px;
		margin: 0 auto;
		overflow: hidden;
	}
	#head1 ul {
		float: right;
		padding: 5px 0;
	}
	#head1 ul li {
		float: left;
		font-size: 12px;
		font-weight: bold;
		cursor: pointer;
	}
	#head1 li a {
		font-size: 0.8em;
		text-align: right;
		margin-bottom: 5px;
		font-weight: bold;
	}
	#head1 ul li > span {
		cursor: default;
	}
	.color {
		color: #2594da;
		margin-top: 1px;
		display: inline-block;
	}
	#head2 {
		background-color: #083b82;
		clear: both;
		border-top: 2px solid #0397d6;
	}
	#head2_in {
		width: 1070px;
		margin: 0 auto;
		height: 50px;
		line-height: 50px;
		overflow: hidden;
	}
	#head2_in a {
		float: left;
	}
	#searchForm {
		margin-left: 250px;
		height: 20px;
		background-color: #fff;
		width: 350px;
		margin-top: 10px;
		padding: 5px 0;
		line-height: 20px;
	}
	#searchForm > div {
		font-size: 0.8em;
		padding: 0 15px;
		color: #666;
		display: inline-block;
		float: left;
	}
	#searchForm > img {
		float: left;
	}
	#searchForm > input[type="text"] {
		border: none;
		outline: none;
		float: left;
		height: 21px;
		padding: 0 5px;
	}
	#searchForm > input[type="submit"] {
		border: none;
		outline: none;
		background-color: #fff;
		font-weight: bold;
		padding-left: 10px;
	}
	
	/* ====================================== nav ====================================== */	
	nav {
		background-color: white;
		border-bottom: 1.5px solid #0397d6;
		height: 60px;
		line-height: 60px;
		margin-bottom: 10px;
		box-shadow: 2px 2px 3px rgba(0,0,0,0.2); 
	}
	#nav_ul {
		width: 1070px;
		margin: 0 auto;
	}
	#nav_ul ul li {
		float: left;
	}
	#nav_ul ul li:nth-child(2n+1) {
		width: 19%;
		text-align: center;
	}
	#nav_ul ul li a {
		color: black;
		text-decoration: none;
		font-weight: bold;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
		$("#logout_img").click(function() {
			var result = confirm("로그아웃 하시겠습니까?");
			
			if(result == true) {
				location.href = "${pageContext.request.contextPath}/login/logout";
			}
		})
	})
</script>
</head>
<body>
	<header>
		<div id="head1">
			<ul>
				<li><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/include/gnb_home.png"></a></li>
				<c:if test="${Auth == null}">
					<li><a href="${pageContext.request.contextPath}/login/login"><img src="${pageContext.request.contextPath}/resources/images/include/gnb_login.png"></a></li>
				</c:if>
				<c:if test="${Auth != null}">
					<li><span><span class="color">${Auth.memName}</span>님 환영합니다.</span></li>
					<li><img src="${pageContext.request.contextPath}/resources/images/include/gnb_logout.png" id="logout_img"></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/login/mypage?memId=${Auth.memId}"><img src="${pageContext.request.contextPath}/resources/images/include/gnb_my.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_customer.png"></a></li>
				<li><a href="${pageContext.request.contextPath}/manager/korail"><img src="${pageContext.request.contextPath}/resources/images/include/gnb_enjoy.png"></a></li>
			</ul>
		</div>
		<div id="head2">
			<div id="head2_in">
				<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/include/lets_logo.png"></a>
				<form id="searchForm">
					<div>통합검색</div><img src="${pageContext.request.contextPath}/resources/images/include/btn_sel.png">
					<input type="text" size="25"><img src="${pageContext.request.contextPath}/resources/images/include/btn_sel.png">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</header>
	<nav>
		<div id="nav_ul">
			<ul>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
			</ul>
		</div>
	</nav>