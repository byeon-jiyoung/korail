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
	/* ======================================================================================== */	
	header {
		width: 100%;
		background-color: #f5f5f5;
	}
	ul li {
		list-style: none;
		float: left;
	}
	#head1 {
		width: 1100px;
		margin: 0 auto;
		overflow: hidden;
	}
	#head1 ul {
		float: right;
		padding: 5px 0;
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
		width: 1100px;
		margin: 0 auto;
		height: 50px;
		line-height: 50px;
		overflow: hidden;
		background: url("${pageContext.request.contextPath}/resources/images/lets_logo.png") no-repeat;
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
	
	/* ======================================================================================== */
	nav {
		background-color: white;
	}
</style>
</head>
<body>
	<header>
		<div id="head1">
			<ul>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_home.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_login.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_mems.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_sh_basket.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_my.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_customer.png"></a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/gnb_enjoy.png"></a></li>
			</ul>
		</div>
		<div id="head2">
			<div id="head2_in">
				<form id="searchForm">
					<div>통합검색</div><img src="${pageContext.request.contextPath}/resources/images/btn_sel.png">
					<input type="text" size="25"><img src="${pageContext.request.contextPath}/resources/images/btn_sel.png">
					<input type="submit" value="검색">
				</form>
			</div>
		</div>
	</header>
	<nav>
		<ul>
			<li><a href="">승차권</a></li>
			<li><a href="">승차권</a></li>
			<li><a href="">승차권</a></li>
		</ul>
	</nav>
</body>
</html>