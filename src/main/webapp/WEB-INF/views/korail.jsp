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
		background-color: #e7f1ff;
	}
	#half_res {
		overflow: hidden;
	}
	#half_res p {
		float: left;
		width: 50%;
		text-align: center;
		padding: 10px 0;
		font-size: 0.9em;
		font-weight: bold;
	}
	#half_res p:first-child {
		background-color: #01285f;
		color: white;
	}
	#half_res p:last-child {
		background-color: #0397d6;
		color: #01285f;
	}
	#choiceStation {
		padding: 7px 20px;
		border-bottom: 1px dotted;
	}
	#article_reserve1 label {
		font-weight: bold;
		font-size: 0.9em;
		margin-right: 5px;
		width: 50px;
		float: left;
		padding-top: 3px;
	}
	#article_reserve1 select {
		width: 150px;
		padding: 3px 0;
		margin-bottom: 3px;
	}
	input[type="date"] {
		width: 145px;
		margin-bottom: 3px;
	}
	#resInfo {
		padding: 7px 20px;
	}
	#goRes {
		margin-left: 60px;
		cursor: pointer;
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
		cursor: pointer;
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
		width: 100%;
		height: 200px;
		position: relative;
	}
	#article_news img {
		width: 100%;
		height: 200px;
	}
	#newsA {
		position: absolute;
		bottom: 10px;
		left: 0;
		font-weight: bold;
		color: white;
		font-size: 0.9em;
		text-align: center;
		width: 90%;
		margin-left: 10px;
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
		width: 100%;
		height: 200px;
	}
	#article_best img {
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
					<div id="half_res">
						<p>승차권간편예매</p>
						<p>기차여행검색</p>
					</div>
					<div id="choiceStation">
						<label>출발역</label>
						<select name="start">
							<c:forEach var="train" items="${tList}">
								<option>${train.tStart.nodename}</option>
							</c:forEach>
						</select> <br>
						<label>도착역</label>
						<select name="arrive">
							<c:forEach var="traintime" items="${ttList}">
								<option>${traintime.nodeid.nodename}</option>
							</c:forEach>
						</select>
					</div>
					<div id="resInfo">
						<label>출발일</label>
						<input type="date"> <br>
						<label>시간</label>
						<select name="time">
							<c:forEach var="t" begin="0" end="23">
								<c:if test="${t <= 11}">
									<option>${t} (오전 ${t}) 시</option>
								</c:if>
								<c:if test="${t > 11}">
									<option>${t} (오후 ${t-12}) 시</option>
								</c:if>
							</c:forEach>
						</select> <br>
						<label>인원</label>
						<select name="people">
							<c:forEach var="p" begin="1" end="9">
								<option value="${p}">어른 ${p}명</option>
							</c:forEach>
						</select>
					</div>
					<img src="${pageContext.request.contextPath}/resources/images/btn_reserve.png" id="goRes">
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
					<a href="http://story.korail.com/main" target="_blank"><img src="${pageContext.request.contextPath}/resources/images/btn_more.png" class="more"></a>
					<div id="article_news">
						<img src="${pageContext.request.contextPath}/resources/images/3000.jpg">
						<a href="http://story.korail.com/main" target="_blank" id="newsA"><span>[코레일 KTX 단거리 할인상품]<br>셋이서 3만원, 2만원/KTX5000특가</span></a>
					</div>
				</div>
			</div>
			<div class="article_div2">
				<div>
					<img src="${pageContext.request.contextPath}/resources/images/tit_ktx_discount.png" alt="ktx 할인상품">
					<div id="article_ktx">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230150378540.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230147548250.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230155082130.jpg">
						<img src="${pageContext.request.contextPath}/resources/images/BnrDisplay_201710230155287430.jpg">
					</div>
				</div>
				<div class="article_div_div2">
					<img src="${pageContext.request.contextPath}/resources/images/tit_best_prd.png" alt="best 여행상품">
					<div id="article_best">
						<img src="${pageContext.request.contextPath}/resources/images/best.jpg">
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
			$("#goRes").click(function() {
				var start = $("select[name=start]").val();
				var arrive = $("select[name=arrive]").val();
				var people = $("select[name=people]").val();
				
				location.href = "${pageContext.request.contextPath}/res/reservation?start="+start+"&arrive="+arrive+"&people="+people;
			})
			
			$("#noticeMore").click(function() {
				location.href = "${pageContext.request.contextPath}/notice/notice";
			})
		</script>
	</section>
	
<%@ include file="include/footer.jsp" %>