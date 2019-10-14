<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<style>
	/* ====================================== footer ====================================== */	
	#footer1, #footer3 {
		background-color: white;
	}
	#footer1, #footer2, #footer3 {
		border-top: 1px solid #d6d3d3;
	}
	#footer1 {
		height: 60px;
	}
	#footer1 > div {
		width: 1070px;
		height: 60px;
		margin: 0 auto;
	}
	#footer1 img {
		width: 13.5%;
		height: 60px;
	}
	#footer2 > div {
		width: 1070px;
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
		width: 1070px;
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
	
	<footer>
		<div id="footer1">
			<div>
				<img src="${pageContext.request.contextPath}/resources/images/include/ban01.png">
				<img src="${pageContext.request.contextPath}/resources/images/include/ban02.png">
				<img src="${pageContext.request.contextPath}/resources/images/include/ban03.png">
				<img src="${pageContext.request.contextPath}/resources/images/include/ban04.png">
				<img src="${pageContext.request.contextPath}/resources/images/include/ban05.png">
				<img src="${pageContext.request.contextPath}/resources/images/include/ban06.png">
				<img src="${pageContext.request.contextPath}/resources/images/include/ban07.png">
			</div>
		</div>
		<div id="footer2">
			<div>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath}/event/event">이벤트</a></li>
						<li> | </li>
						<li><a href="${pageContext.request.contextPath}/notice/notice">공지사항</a></li>
					</ul>
				</div>
				<div id="footer2_select">
					<select>
						<option>코레일 Family</option>
					</select>
					<img src="${pageContext.request.contextPath}/resources/images/include/btn_go_sel.gif">
				</div>
			</div>
		</div>
		<div id="footer3">
			<div>
				<div id="footer3_1">
					<img src="${pageContext.request.contextPath}/resources/images/include/f_logo.png">
				</div>
				<div id="footer3_2">
					<img src="${pageContext.request.contextPath}/resources/images/include/f_add.png">
					<img src="${pageContext.request.contextPath}/resources/images/include/f_copy.png">	
				</div>
			</div>
		</div>
	</footer>
	
</body>
</html>