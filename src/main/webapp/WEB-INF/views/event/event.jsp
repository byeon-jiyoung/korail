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
	.notice_sec_left {
		float: left;
		width: 19.7%;
	}
	.notice_sec_right {
		float: left;
		width: 80%;
		border-left: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	#notice_back {
		background: url("${pageContext.request.contextPath}/resources/images/notice/cmt_snv_tit_bg.png") no-repeat;
		background-size: 100%;
		padding-left: 20px;
	}
	#notice_back span {
		display: inline-block;
		margin-top: 40px;
		font-size: 0.7em;
		color: #ccc;
	}
	#notice_back h3 {
		margin-bottom: 50px;
	}
	.notice_sec_left p {
		border-top: 1px solid #aaa;
		padding: 10px 20px;
		font-size: 14px;
	}
	.notice_sec_left p:last-child {
		border-bottom: 1px solid #aaa;
	}
	.notice_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	
	
	
	#notice_back2 {
		background: url("${pageContext.request.contextPath}/resources/images/notice/tra_visual16.jpg") no-repeat right top;
		padding-left: 30px;
	}
	#notice_back2 p {
		padding-top: 40px;
	}
	#notice_back2 p a {
		font-size: 0.8em;
		color: #666;
		text-decoration: none;
	}
	#notice_back2 h1 {
		padding-bottom: 40px;
		padding-top: 10px;
	}
	#notice_list h4 {
		margin: 30px;
	}
	#notice_list span {
		font-size: 13px;
		font-weight: normal;
	}
	#notice_list b {
		color: #3590d2;
		font-weight: normal;
	}
	#searchDiv {
		overflow: hidden;
		margin-bottom: 10px;
	}
	#sectionSearchForm {
		float: right;
		margin-right: 30px;
	}
	#sectionSearchForm select {
		float: left;
		height: 23px;
		width: 70px;
		border: 1px solid #ccc;
		margin-right: 5px;
		font-size: 0.8em;
	}
	#sectionSearchForm input[name="search"] {
		float: left;
		height: 20px;
		width: 130px;
		border: 1px solid #ccc;
		margin-right: 5px;
	}
	#form_search {
		float: left;
		background: url("${pageContext.request.contextPath}/resources/images/notice/btn_srch.png") no-repeat;
		background-size: 100% 100%;
		width:65px;
		height: 23px;
		border: none;
		outline: none;
	}
	
	
	#notice_list table {
		border-top: 2px solid #0097d0;
		margin: 0 30px;
		border-collapse: collapse;
		width: 800px;
	}
	#notice_list table tr:first-child {
		background-color: #f8f8f8;
		border-bottom: 2px solid #aaa;
	}
	#notice_list table th {
		padding: 10px 0;
		font-size: 0.8em;
	}
	#notice_list table th:first-child {
		width: 10%;
	}
	#notice_list table th:nth-child(2) {
		width: 70%;
	}
	#notice_list table th:last-child {
		width: 20%;
	}
	
	#notice_etc {
		padding: 0 30px;
		margin-top: 20px;
		font-size: 0.8em;
	}
	.boardlist td {
		text-align: center;
		padding: 8px 0;
		color: #8C8C8C;
		border-bottom: 1px solid #bbb;
	}
	.boardlist td:nth-child(2) {
		text-align: left;
		padding-left: 20px;
	}
	.boardlist td:nth-child(1), .boardlist td:nth-child(3) {
		font-size: 0.9em;
	}
	.boardlist a {
		color: #8C8C8C;
		text-decoration: none;
	}
	
	/* ----------------- 페이징처리 css ----------------- */
	#paging {
		text-align: center;
		margin-top: 20px;
	}
	.pagination li {
		list-style: none;
		margin-right: 10px;
		display: inline-block;
	}
	.pagination li a {
		color: black;
		text-decoration: none;
	}
	.active {
		font-weight: bold;
		font-size: 1.1em;
	}
	.active a {
		color: #4285f4 !important;
	}
</style>

	<section>
		<div class="notice_sec_left">
			<div id="notice_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>레츠코레일 소식</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/notice/notice"><p>공지사항</p></a>
				<a href="${pageContext.request.contextPath}/event/event"><p class="notice_color">관광이벤트</p></a>
			</div>
		</div>
		<div class="notice_sec_right">
			<div id="notice_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/notice/notice">레츠코레일 소식</a> > 
					<a href="${pageContext.request.contextPath}/event/event">관광이벤트</a></p>
				<h1>관광이벤트</h1>
			</div>
			<div id="notice_list">
				<h4>
					<img src="${pageContext.request.contextPath}/resources/images/notice/bu_c_tit.gif"> 관광이벤트
					<span> | <b>신규서비스 및 이벤트</b>에 대한 공지 확인이 가능합니다.</span>
				</h4>
				<div id="searchDiv">
					<form id="sectionSearchForm">
						<select>
							<option>제목</option>
						</select>
						<input type="text" name="search">
						<input type="submit" value="" id="form_search">
					</form>
				</div>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
					</tr>
					<c:forEach var="event" items="${list}">
						<tr class="boardlist">
							<td>${event.eNo}</td>
							<td><a href="${pageContext.request.contextPath}/event/read?eNo=${event.eNo}&page=${pageMaker.cri.page}">${event.eTitle}</a></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${event.eRegdate}"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="paging">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a href="notice?page=${pageMaker.startPage-1}">&laquo;</a></li>
					</c:if>
					<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li ${pageMaker.cri.page == idx ? 'class="active"' : ''}><a href="notice?page=${idx}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li><a href="notice?page=${pageMaker.endPage+1}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			<div id="notice_etc">
				※ 첨부된 파일을 찾을 수 없다고 나오는 경우, <strong>웹브라우저의 '도구 > 인터넷옵션'의 고급탭을 클릭하여 'URL을 항상 UTF-8로 보냄(다시 시작해야 함)'</strong>의 설정을 <strong>체크해제</strong> 하신 후 웹브라우저를 다시 실행시키시면 정상적으로 다운로드 가능합니다.
			</div>
			<button>글쓰기</button>
		</div>
		
		<script>
			$("button").click(function() {
				location.href="${pageContext.request.contextPath}/event/insert";
			})
		</script>
	</section>
    
<%@ include file="../include/footer.jsp" %>