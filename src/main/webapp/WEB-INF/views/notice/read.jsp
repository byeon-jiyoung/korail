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
	
	#notice_list table {
		border-top: 2.5px solid black;
		margin: 0 30px;
		border-collapse: collapse;
		width: 800px;
		overflow: hidden;
	}
	#notice_list table td {
		padding: 8px 10px;
		font-size: 0.8em;
		text-align: center;
		border-bottom: 1px solid #aaa;
	}
	#notice_list table .titleleft {
		text-align: left !important;
	}
	#notice_list table .label {
		background-color: #f8f8f8;
		border-right: 1px solid #aaa;
		font-weight: bold;
	}
	#notice_list table .no_content {
		font-size: 1em;
		text-align: left !important;
		padding: 20px;
	}
	#notice_list table .no_img {
		display: block;
		max-width: 100%;
		margin-top: 10px;
	}
	#notice_list table .leftborder {
		border-left: 1px solid #aaa;
	}
	
	#goNoticeList {
		float: right;
		margin-right: 30px;
		margin-top: 10px;
		background-color: #266fcb;
		border: 1px solid #266fcb;
		color: white;
		padding: 5px 10px;
		border-radius: 2px;
	}
	
	#notice_etc {
		padding: 0 30px;
		margin-top: 60px;
		font-size: 0.8em;
	}
</style>
	<section>
		<div class="notice_sec_left">
			<div id="notice_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>레츠코레일 소식</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/notice/notice"><p class="notice_color">공지사항</p></a>
				<a href="${pageContext.request.contextPath}/event/event"><p>관광이벤트</p></a>
			</div>
		</div>
		<div class="notice_sec_right">
			<div id="notice_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/notice/notice">레츠코레일 소식</a> > 
					<a href="${pageContext.request.contextPath}/notice/notice">공지사항</a></p>
				<h1>공지사항</h1>
			</div>
			<div id="notice_list">
				<h4>
					<img src="${pageContext.request.contextPath}/resources/images/notice/bu_c_tit.gif"> 공지사항
					<span> | <b>신규서비스 및 이벤트</b>에 대한 공지 확인이 가능합니다.</span>
				</h4>
				<table>
					<tr>
						<td class="label">제목</td>
						<td colspan="5" class="titleleft">${notice.noTitle}</td>
					</tr>
					<tr>
						<td class="label">작성자</td>
						<td><%-- ${notice.noWriter} --%>관리자</td>
						<td class="label leftborder">등록일</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noRegdate}"/></td>
						<td class="label leftborder">조회수</td>
						<td>${notice.noReadcnt}</td>
					</tr>
					<tr>
						<td colspan="6" class="no_content">
							${notice.noContent}
							<c:if test="${notice.noImg != null}">
								<img src="displayFile?filename=${notice.noImg}" class="no_img">
							</c:if>
						</td>
					</tr>
				</table>
				<a href="${pageContext.request.contextPath}/notice/notice?page=${cri.page}"><button id="goNoticeList">목록</button></a>
			</div>
			<div id="notice_etc">
				※ 첨부된 파일을 찾을 수 없다고 나오는 경우, <strong>웹브라우저의 '도구 > 인터넷옵션'의 고급탭을 클릭하여 'URL을 항상 UTF-8로 보냄(다시 시작해야 함)'</strong>의 설정을 <strong>체크해제</strong> 하신 후 웹브라우저를 다시 실행시키시면 정상적으로 다운로드 가능합니다.
			</div>
		</div>
	</section>

<%@ include file="../include/footer.jsp" %>