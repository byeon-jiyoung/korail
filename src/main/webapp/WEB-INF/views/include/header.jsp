<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0;
		padding: 0;
	}
	body {
		background-color: #f5f5f5;
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
	}
	#head1 li a {
		font-size: 0.8em;
		text-align: right;
		margin-bottom: 5px;
		font-weight: bold;
	}
	#head2 {
		background-color: #083b82;
		clear: both;
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
		border-bottom: 1px solid #0397d6;
		height: 60px;
		line-height: 60px;
		margin-bottom: 10px;
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
</head>
<body>
	<header>
		<div id="head1">
			<ul>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_home.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_login.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_mems.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_sh_basket.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_my.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_customer.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/include/gnb_enjoy.png"></a></li>
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