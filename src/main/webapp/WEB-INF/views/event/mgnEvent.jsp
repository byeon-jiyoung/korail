<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/headerMgn.jsp" %>

<style>
	.reg {
		display: none;
		font-size: 0.9em;
		color: red;
		margin-top: 10px;
	}
	.none {
		display: none;
	}
	#imgWrap img {
		width: 33%;
		height: 200px;
		float: left;
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
		background-color: white !important;
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
<script>
	$(function() {
		$("#efile").change(function() {
			$(".none").css("display", "block");
			
			for(var i=0; i<$(this)[0].files.length; i++) {
				var reader = new FileReader();
				
				reader.onload = function(e) { //밑에 reader.~~ 파일을 다 읽으면 여기로 이동해서 실행해라
					var $img = $("<img>").attr("src", e.target.result);
					$("#imgWrap").append($img);
				}
				
				reader.readAsDataURL($(this)[0].files[i]);
									//$(this)[0] => 자바스크립트객체로변함
			}
		})
		
		$("#eventForm").submit(function(e) {
			$(".reg").css("display", "none");
			
			if($("input[name='eTitle']").val()=="") {
				$("input[name='eTitle']").next(".reg").css("display", "inline-block");
				return false;
			}
			
			if($("textarea[name='eContent']").val()=="") {
				$("textarea[name='eContent']").next(".reg").css("display", "inline-block");
				return false;
			}
		})
	})
</script>
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/manager/korail">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Event</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						Event<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span>
					</div>
					<div class="panel-body articles-container">
						<c:forEach var="event" items="${list}">
							<div class="article border-bottom">
								<div class="col-xs-12">
									<div class="row">
										<div class="col-xs-2 col-md-3 date">
											<div class="large"><fmt:formatDate pattern="yyyy-MM-dd" value="${event.eRegdate}"/></div>
										</div>
										<div class="col-xs-10 col-md-9">
											<h4><a href="${pageContext.request.contextPath}/event/mgnRead?eNo=${event.eNo}&page=${pageMaker.cri.page}">${event.eTitle}</a></h4>
											<p>&nbsp;&nbsp;&nbsp;.....</p>
										</div>
									</div>
								</div>
								<div class="clear"></div>
							</div><!--End .article-->
						</c:forEach>
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
				</div><!--End .articles-->
			</div><!--/.row-->
		</div><!-- /.row -->
	</div>
</body>
</html>