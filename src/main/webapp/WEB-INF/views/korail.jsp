<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#head1 {
		width: 1070px;
		margin: 0 auto;
	}
	#head2 {
		background-color: #083b82;
		clear: both;
	}
	#korailLogo {
		width: 1070px;
		margin: 0 auto;
		background: url("${pageContext.request.contextPath}/resources/images/lets_logo.png") no-repeat;
		padding: 10px 0;
	}
</style>
</head>
<body>
	<header>
		<div id="head1">
			HOME | 코레일멤버십 | 장바구니 | 마이페이지 | 고객센터
		</div>
		<div id="head2">
			<div id="head2_in">
				<div id="korailLogo"></div>
				<div><input type="text"></div>
			</div>
		</div>
	</header>
</body>
</html>