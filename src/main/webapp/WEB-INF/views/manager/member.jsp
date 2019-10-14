<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/headerMgn.jsp" %>

<style>
	.wid50 {
		width: 35%;
		float: left;
		height: 34px !important;
		margin-right: 10px;
	}
	.article {
		width: 100%;
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
	.pagination .active {
		font-weight: bold;
		font-size: 1.1em;
	}
	.pagination .active a {
		color: #4285f4 !important;
	}
</style>
<script>
	//tap
	function openCity(evt, cityName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("city");
		for (i = 0; i < x.length; i++) {
			x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" w3-gray", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " w3-gray";
	}

	$(function() {
		$("#navmenu li").eq(0).removeClass("active");
		$("#navmenu li").eq(0).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(1).removeClass("active");
		$("#navmenu li").eq(1).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(2).removeClass("active");
		$("#navmenu li").eq(2).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(3).addClass("active");
		$("#navmenu li").eq(3).find("em").removeClass("fa-toggle-off").addClass("fa-toggle-on");
	
	})
</script>
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/manager/korail">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">member</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default articles">
					<div class="panel-heading">
						Member<span class="pull-right clickable panel-toggle panel-button-tab-left">
						<em class="fa fa-toggle-up"></em></span>
					</div>
					<div class="panel-body articles-container">
						<div class="w3-bar w3-black">
								<button class="w3-bar-item w3-button tablink w3-gray" onclick="openCity(event,'ALL')">ALL</button>
								<button class="w3-bar-item w3-button tablink" onclick="openCity(event,'MEMBER')">MEMBER</button>
								<button class="w3-bar-item w3-button tablink" onclick="openCity(event,'NOMEMBER')">NOMEMBER</button>
							</div>
							<div id="All" class="w3-container w3-border city">
								<c:forEach var="mem" items="${memList}">
									<p>
										<div class="article border-bottom">
											<div class="h">
												<div class="row">
													<div class="col-md-2 date">
														${mem.memId}
													</div>
													<div class="col-md-2">
														${mem.memName}
													</div>
													<div class="col-md-3">
														<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${mem.memJoin}" />
													</div>
													<div class="col-md-3">
														${mem.memPhone}
													</div>
												</div>
											</div>
											<div class="clear"></div>
										</div><!--End .article-->
									</p>
								</c:forEach>
							</div>
							<div id="KTX" class="w3-container w3-border city" style="display:none">
								<c:forEach var="train" items="${tList}">
									<c:if test="${train.tTiNo.tiNo == 1}">
										<p>
											<div class="article border-bottom">
												<div class="col-xs-12">
													<div class="row">
														<div class="col-xs-2 col-md-2 date">
															<div class="large">${train.tCode}</div>
															<div class="text-muted">KTX</div>
														</div>
														<div class="col-xs-10 col-md-10">
															<h4><a href="#">${train.tStart.nodename} ⇒ ${train.tArrive.nodename}</a></h4>
															<p>	
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${train.tStartTime}" /> ⇒
																<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${train.tArriveTime}" />
															</p>
														</div>
													</div>
												</div>
												<div class="clear"></div>
											</div><!--End .article-->
										</p>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</div>
					<div id="paging">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="mgnEvent?page=${pageMaker.startPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li ${pageMaker.cri.page == idx ? 'class="active"' : ''}><a href="gnEvent?page=${idx}">${idx}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li><a href="gnEvent?page=${pageMaker.endPage+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div><!--End .articles-->
			</div><!--/.row-->
		</div><!-- /.row -->
	</div>
</body>
</html>