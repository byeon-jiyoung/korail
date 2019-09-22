<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="include/header.jsp" %>

<style>
	/* ====================================== section ====================================== */	
	section {
		width: 1070px;
		margin: 0 auto;
	}
	article {
		overflow: hidden;
		margin-bottom: 20px;
	}
	.article_div1, .article_div2, .article_div3 {
		float: left;
	}
	.article_div1 {
		width: 25%;
		margin-right: 4%;
	}
	.article_div_div2 {
		margin-top: 15px;
	}
	.article_div2 {
		width: 45%;
		margin-right: 4%;
	}
	.article_div3 {
		width: 20%;
		height: 440px;
	}
	.article_event {
		width: 100%;
		border: 1px solid #c5c6c7;
		height: 215px;
	}
	.article_event:first-child {
		margin-bottom: 8px;
	}
	.article_event img {
		width: 100%;
		height: 100%;
	}
	
	#article_reserve1 {
		border: 1px solid black;
		height: 250px;
	}
	#article_reserve2 img {
		width: 50%;
		height: 60px;
		float: left;
	}
	#article_notice_img {
		height: 440px;
		border: 1px solid black;
	}
	
	.more {
		float: right;
	}
	#article_notice_ul {
		border: 1px solid #c5c6c7;
		border-top: 2px solid black;
		max-width: 100%;
		height: 175px;
		margin-top: 5px;
		padding: 15px 10px 10px;
		background-color: white;
	}
	#article_notice_ul li {
		border-bottom: 1px solid #ebebeb;
		padding: 4px;
		font-size: 0.9em;
	}
	#article_notice_ul li:nth-child(2n) {
		background-color: #fafafa;
	}
	#article_notice_ul li:last-child {
		border: none;
	}
	#article_notice_ul a {
		color: #666;
	}
	
	#article_news {
		border: 1px solid black;
		width: 100%;
		height: 200px;
	}
	#article_ktx {
		width: 100%;
		height: 190px;
		border: 1px solid #c5c6c7;
		padding: 5px 0;
		background-color: #e5e5e5;
		margin-top: 5px;
	}
	#article_ktx img {
		width: 24.5%;
		height: 100%;
		float: left;
	}
	#article_ktx img:first-child {
		margin-left: 1%;
	}
	#article_best {
		border: 1px solid black;
		width: 100%;
		height: 200px;
	}
	#article_guide {
		width: 100%;
		height: 450px;
		margin-top: 5px;
	}
	#article_guide img {
		width: 50%;
		float: left;
		height: 110.5px;
	}
</style>

	<section>
		<article>
			<div class="article_div1">
				<div id="article_reserve1">
				</div>
				<div id="article_reserve2">
					<img src="${pageContext.request.contextPath}/resources/images/tab_site11.jpg">
					<img src="${pageContext.request.contextPath}/resources/images/tab_site12.jpg">
					<img src="${pageContext.request.contextPath}/resources/images/tab_site13.jpg">
					<img src="${pageContext.request.contextPath}/resources/images/tab_site14.jpg">
					<img src="${pageContext.request.contextPath}/resources/images/tab_site15.jpg">
					<img src="${pageContext.request.contextPath}/resources/images/tab_site16.jpg">
				</div>
			</div>
			<div class="article_div2">
				<div id="article_notice_img"></div>
			</div>
			<div class="article_div3">
				<c:forEach var="event" items="${eventList}">
					<div class="article_event">
						<a href="${pageContext.request.contextPath}/event/read?eNo=${event.eNo}">
							<img src="${pageContext.request.contextPath}/event/displayFile?filename=${event.eImg}">
						</a>
					</div>
				</c:forEach>
			</div>
		</article>
		<article>
			<div class="article_div1">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/tit_news.png" alt="공지사항">
					<img src="${pageContext.request.contextPath}/resources/images/btn_more.png" class="more" id="noticeMore">
					<div id="article_notice_ul">
						<ul>
							<c:forEach var="notice" items="${noticeList}">
								<li>
									<span><img src="${pageContext.request.contextPath}/resources/images/bu_arr_new.png"></span>
									<a href="${pageContext.request.contextPath}/notice/read?noNo=${notice.noNo}">${notice.noTitle}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="article_div_div2">
					<img src="${pageContext.request.contextPath}/resources/images/aaaa.png" alt="레일스토리 소식"> 
					<img src="${pageContext.request.contextPath}/resources/images/btn_more.png" class="more">
					<div id="article_news">
						
					</div>
				</div>
			</div>
			<div class="article_div2">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/tit_ktx_discount.png" alt="ktx 할인상품">
					<img src="${pageContext.request.contextPath}/resources/images/btn_more.png" class="more">
					<div id="article_ktx">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230150378540.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230147548250.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230155082130.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230155287430.jpg">
					</div>
				</div>
				<div class="article_div_div2">
					<img src="${pageContext.request.contextPath}/resources/images/tit_best_prd.png" alt="best 여행상품">
					<img src="${pageContext.request.contextPath}/resources/images/btn_more.png" class="more">
					<div id="article_best">
						
					</div>
				</div>
			</div>
			<div class="article_div3">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/tit_guide.png" alt="종합이용가이드">
					<img src="${pageContext.request.contextPath}/resources/images/btn_more.png" class="more">
					<div id="article_guide">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img9.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img2.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img10.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img4.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img5.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img6.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img7.png">
						<img src="${pageContext.request.contextPath}/resources/images/guide_img8.png">
					</div>
				</div>
			</div>
		</article>
		
		<script>
			$("#noticeMore").click(function() {
				location.href = "${pageContext.request.contextPath}/notice/notice";
			})
		</script>
	</section>
	
<%@ include file="include/footer.jsp" %>