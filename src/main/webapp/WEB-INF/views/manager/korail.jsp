<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/headerMgn.jsp" %>

<style>
	.w3-black {
		background-color: #3069E1 !important;
		padding: 5px 0;
		overflow: hidden;
	}
	.w3-gray {
		font-weight: bold;
		background-color: #3069E1 !important;
	}
	.right {
		float: right;
		margin: 5px 10px 0 0;
	}
	#InsertTrain {
		background-color: #3069E1;
		border: none;
		color: white;
		font-weight: bold;
		font-size: 1.2em;
	}
	
	.panel-body {
		height: 550px;
		overflow: scroll;
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
		/* $(".traintime").click(function(e) {
			e.preventDefault();
			
			var code = $(this).attr("data-code");
			location.href = "${pageContext.request.contextPath}/manager/traintime?tCode="+code;
		}) */
		
		$("#InsertTrain").click(function() {
			location.href = "${pageContext.request.contextPath}/manager/train";
		})
	})
</script>
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/manager/korail">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Korail</li>
			</ol>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default articles">
						<div class="panel-heading">
							Train List<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span>
						</div>
						<div class="panel-body articles-container">
							<div class="w3-bar w3-black">
								<button class="w3-bar-item w3-button tablink w3-gray" onclick="openCity(event,'All')">All</button>
								<button class="w3-bar-item w3-button tablink" onclick="openCity(event,'KTX')">KTX</button>
								<button class="w3-bar-item w3-button tablink" onclick="openCity(event,'새마을호')">새마을호</button>
								<button class="w3-bar-item w3-button tablink" onclick="openCity(event,'무궁화호')">무궁화호</button>
								<button class="w3-bar-item w3-button tablink" onclick="openCity(event,'ITX-청춘')">ITX-청춘</button>
								<div class="right">
									<button id="InsertTrain">열차등록</button>
								</div>
							</div>
							<div id="All" class="w3-container w3-border city">
								<c:forEach var="train" items="${tList}">
									<p>
										<div class="article border-bottom">
											<div class="col-xs-12">
												<div class="row">
													<div class="col-xs-2 col-md-2 date">
														<div class="large">${train.tCode}</div>
														<c:if test="${train.tTiNo.tiNo == 1}">
															<div class="text-muted">KTX</div>
														</c:if>
														<c:if test="${train.tTiNo.tiNo == 2}">
															<div class="text-muted">새마을</div>
														</c:if>
													</div>
													<div class="col-xs-10 col-md-10">
														<h4><a href="#" data-code="${train.tCode}" class="traintime">${train.tStart.nodename} ⇒ ${train.tArrive.nodename}</a></h4>
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
							<div id="새마을호" class="w3-container w3-border city" style="display:none">
								<c:forEach var="train" items="${tList}">
									<c:if test="${train.tTiNo.tiNo == 2}">
										<p>
											<div class="article border-bottom">
												<div class="col-xs-12">
													<div class="row">
														<div class="col-xs-2 col-md-2 date">
															<div class="large">${train.tCode}</div>
															<div class="text-muted">새마을</div>
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
							<div id="무궁화호" class="w3-container w3-border city" style="display:none">
								<c:forEach var="train" items="${tList}">
									<c:if test="${train.tTiNo.tiNo == 3}">
										<p>
											<div class="article border-bottom">
												<div class="col-xs-12">
													<div class="row">
														<div class="col-xs-2 col-md-2 date">
															<div class="large">${train.tCode}</div>
															<div class="text-muted">무궁화</div>
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
							<div id="ITX-청춘" class="w3-container w3-border city" style="display:none">
								<c:forEach var="train" items="${tList}">
									<c:if test="${train.tTiNo.tiNo == 4}">
										<p>
											<div class="article border-bottom">
												<div class="col-xs-12">
													<div class="row">
														<div class="col-xs-2 col-md-2 date">
															<div class="large">${train.tCode}</div>
															<div class="text-muted">ITX</div>
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
					</div><!--End .articles-->
				</div><!--/.col-->
			</div><!--/.row-->
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Site Traffic Overview<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em></span>
					</div>
					<div class="panel-body">
						<div class="canvas-wrapper">
							<canvas class="main-chart" id="line-chart" height="200" width="600">
							</canvas>
						</div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>New Orders</h4>
						<div class="easypiechart" id="easypiechart-blue" data-percent="92" ><span class="percent">92%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Comments</h4>
						<div class="easypiechart" id="easypiechart-orange" data-percent="65" ><span class="percent">65%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>New Users</h4>
						<div class="easypiechart" id="easypiechart-teal" data-percent="56" ><span class="percent">56%</span></div>
					</div>
				</div>
			</div>
			<div class="col-xs-6 col-md-3">
				<div class="panel panel-default">
					<div class="panel-body easypiechart-panel">
						<h4>Visitors</h4>
						<div class="easypiechart" id="easypiechart-red" data-percent="27" ><span class="percent">27%</span></div>
					</div>
				</div>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	
	<script>
		window.onload = function () {
			var chart1 = document.getElementById("line-chart").getContext("2d");
			window.myLine = new Chart(chart1).Line(lineChartData, {
				responsive: true,
				scaleLineColor: "rgba(0,0,0,.2)",
				scaleGridLineColor: "rgba(0,0,0,.05)",
				scaleFontColor: "#c5c7cc"
			});
		};
	</script>

</body>
</html>