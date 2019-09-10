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
		width: 60%;
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
		width: 60%;
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
	
	/* ====================================== nav ====================================== */	
	nav {
		background-color: white;
		border-bottom: 1px solid #0397d6;
		height: 60px;
		line-height: 60px;
	}
	#nav_ul {
		width: 60%;
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
	
	/* ====================================== footer ====================================== */	
	#footer1, #footer3 {
		background-color: white;
	}
	#footer1 {
		height: 60px;
	}
	#footer1 > div {
		width: 60%;
		height: 60px;
		margin: 0 auto;
	}
	#footer1 img {
		width: 13.5%;
		height: 60px;
	}
	#footer2 > div {
		width: 60%;
		margin: 0 auto;
		overflow: hidden;
		padding: 8px 0;
	}
	#footer2 ul li {
		float: left;
	}
	#footer2 ul li a {
		color: #5D5D5D;
		text-decoration: none;
		font-size: 0.8em;
		font-weight: bold;
	}
	#footer2 ul li:nth-child(2n) {
		font-size: 0.6em;
		color: #BDBDBD;
		padding: 0 5px;
		padding-top: 3px;
	}
	#footer2_select {
		float: right;
	}
	#footer2_select select, #footer2_select img {
		float: left;
		height: 20px;
	}
	#footer2_select select {
		width: 120px;
		margin-right: 5px;
		padding: 0 0 2px;
		font-size: 12px;
	}
	#footer3 > div {
		width: 60%;
		height: 70px;
		margin: 0 auto;
		overflow: hidden;
	}
	#footer3_1 {
		float: left;
		width: 20%;
		padding-top: 20px;
	}
	#footer3_2 {
		float: left;
		width: 80%;
		padding-top: 20px;
	}
	#footer3_2 img {
		float: right;
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
		<div id="nav_ul">
			<ul>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
				<li><a href=""><img src="${pageContext.request.contextPath}/resources/images/lnb_s_bar.gif"></a></li>
				<li><a href="">승차권</a></li>
			</ul>
		</div>
	</nav>
	<section>
		<div>
			
		</div>
	</section>
	<footer>
		<div id="footer1">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/ban01.png">
				<img src="${pageContext.request.contextPath}/resources/images/ban02.png">
				<img src="${pageContext.request.contextPath}/resources/images/ban03.png">
				<img src="${pageContext.request.contextPath}/resources/images/ban04.png">
				<img src="${pageContext.request.contextPath}/resources/images/ban05.png">
				<img src="${pageContext.request.contextPath}/resources/images/ban06.png">
				<img src="${pageContext.request.contextPath}/resources/images/ban07.png">
			</div>
		</div>
		<div id="footer2">
			<div>
				<div>
					<ul>
						<li><a href="">이벤트</a></li>
						<li> | </li>
						<li><a href="">이벤트</a></li>
					</ul>
				</div>
				<div id="footer2_select">
					<select>
						<option>코레일 Family</option>
					</select>
					<img src="${pageContext.request.contextPath}/resources/images/btn_go_sel.gif">
				</div>
			</div>
		</div>
		<div id="footer3">
			<div>
				<div id="footer3_1">
					<img src="${pageContext.request.contextPath}/resources/images/f_logo.png">
				</div>
				<div id="footer3_2">
					<img src="${pageContext.request.contextPath}/resources/images/f_add.png">
					<img src="${pageContext.request.contextPath}/resources/images/f_copy.png">	
				</div>
			</div>
		</div>
	</footer>
</body>
</html>