<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/headerMgn.jsp" %>

<style>
	.cal, .price {
		height: 34px !important;
	}
	.wid50 {
		width: 35%;
		float: left;
		height: 34px !important;
		margin-right: 10px;
	}
	.wid30 {
		width: 25%;
		float: left;
		margin-right: 10px;
	}
	.floatleft {
		float: left;
		display: block;
		margin: 10px 10px 0 0;
	}
	
	.reg, .reg2 {
		display: none;
		font-size: 0.9em;
		color: red;
		margin-top: 10px;
	}
</style>
<script>
	//이전 날짜들은 선택막기
	function noBefore(date){
	    if (date < new Date())
	        return false;
	    return true;
	}
	
	$(function() {
		$("#navmenu li").eq(0).removeClass("active");
		$("#navmenu li").eq(1).addClass("active");
		
		$('.cal').datepicker({
			beforeShowDay: noBefore
		})
		$('.cal').datepicker("setDate", new Date());
		
		$("#trainSubmit").click(function() {
			var date = new Date();
			var strDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+("00" + date.getDate()).slice(-2)+" "+
						  ("00" + date.getHours()).slice(-2)+":"+("00" + date.getMinutes()).slice(-2);
			
			var tCode = $("input[name='tCode']").val();
			var tiNo = $("select[name='tTiNo.tiNo']").val();
			
			var start = $("input[name='startday']").val() + " " + $("select[name='starthour']").val() + ":" + $("select[name='startminutes']").val();
			$("input[name='startTime']").attr("value",start);
			
			var arrive = $("input[name='arriveday']").val() + " " + $("select[name='arrivehour']").val() + ":" + $("select[name='arriveminutes']").val();
			$("input[name='arriveTime']").attr("value",arrive);
			
			$(".reg").css("display", "none");
			
			if(tCode=="") {
				$("input[name='tCode']").next(".reg").css("display", "inline-block");
				return false;
			}
			
			if($("select[name='tStart.nodeid']").val() == $("select[name='tArrive.nodeid']").val()) {
				$("select[name='tArrive.nodeid']").next(".reg").css("display", "inline-block");
				return false;
			}
			
			/* if($("select[name='starthour']").val()=="00") {
				$("select[name='startminutes']").nextAll(".reg").css("display", "inline-block");
				return false;
			}
			if($("select[name='arrivehour']").val()=="00") {
				$("select[name='arriveminutes']").nextAll(".reg").css("display", "inline-block");
				return false;
			} */

			if(start < strDate) {
				$("select[name='startminutes']").nextAll(".reg").css("display", "inline-block");
				return false;
			}
			if(start > arrive) {
				$("select[name='arriveminutes']").nextAll(".reg").css("display", "inline-block");
				return false;
			}
			if(start == arrive) {
				$("select[name='arriveminutes']").nextAll(".reg2").css("display", "inline-block");
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
				<li class="active">Train</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Train information<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em>
					</span></div>
					<div class="panel-body">
						<form class="form-horizontal" action="train" method="post" id="trainForm">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">열차종류</label>
									<div class="col-md-9">
										<select class="form-control wid50" name="tTiNo.tiNo">
											<c:forEach var="ti" items="${tiList}">
												<option value="${ti.tiNo}">${ti.tiName}</option>
											</c:forEach>
										</select>
										<label class="col-md-2 control-label" for="name">열차번호</label>
										<input type="text" class="form-control wid50" name="tCode">
										<span class="reg">열차이름을 입력하세요</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">출발역</label>
									<div class="col-md-9">
										<select class="form-control wid50" name="tStart.nodeid">
											<c:forEach var="start" items="${ctList}">
												<option>${start.nodename}</option>
											</c:forEach>
										</select>
										<label class="col-md-2 control-label" for="name">도착역</label>
										<select class="form-control wid50" name="tArrive.nodeid">
											<c:forEach var="arrive" items="${ctList}">
												<option>${arrive.nodename}</option>
											</c:forEach>
										</select>
										<span class="reg">출발역과 도착역이 같습니다.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">가격</label>
									<div class="col-md-9">
										<input type="text" class="form-control price wid30" name="price">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="email">출발시간</label>
									<div class="col-md-9">
										<input type="text" class="cal form-control wid30" name="startday">
										<select name="starthour" class="form-control wid30">
											<c:forEach var="t" begin="0" end="23">
												<c:if test="${t < 10}">
													<option value="0${t}">${t}</option>
												</c:if>
												<c:if test="${t >= 10}">
													<option value="${t}">${t}</option>
												</c:if>
											</c:forEach>
										</select>
										<span class="floatleft">시</span>
										<select class="form-control wid30" name="startminutes">
											<option>00</option>
											<option>15</option>
											<option>30</option>
											<option>45</option>
										</select>
										<span class="floatleft">분</span>
										<span class="reg">출발시간이 현재시간보다 작습니다. 다시 입력하세요</span>
									</div>
									<input type="hidden" name="startTime">
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="email">도착시간</label>
									<div class="col-md-9">
										<input type="text" class="cal form-control wid30" name="arriveday">
										<select name="arrivehour" class="form-control wid30">
											<c:forEach var="t" begin="0" end="23">
												<c:if test="${t <= 10}">
													<option value="0${t}">${t}</option>
												</c:if>
												<c:if test="${t > 10}">
													<option value="${t}">${t}</option>
												</c:if>
											</c:forEach>
										</select>
										<span class="floatleft">시</span>
										<select class="form-control wid30" name="arriveminutes">
											<option>00</option>
											<option>15</option>
											<option>30</option>
											<option>45</option>
										</select>
										<span class="floatleft">분</span>
										<span class="reg">도착시간이 출발시간보다 작습니다. 다시 입력하세요</span>
										<span class="reg2">출발시간과 도착시간이 같습니다. 다시 입력하세요</span>
									</div>
									<input type="hidden" name="arriveTime">
								</div>
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button class="btn btn-default btn-md pull-right" id="trainSubmit">등록</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div><!--/.col-->

			<div class="col-md-12">
				<div class="panel panel-default" id="tt">
					<div class="panel-heading">
						Train Time information<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em>
					</span></div>
					<div class="panel-body">
						<form class="form-horizontal" action="traintime" method="post" id="trainTimeForm">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">열차종류</label>
									<div class="col-md-9">
										<input type="text" class="form-control wid50" readonly="readonly" id="tTiNo">
										<label class="col-md-2 control-label" for="name">열차번호</label>
										<input type="text" class="form-control wid50" readonly="readonly" id="tCode" name="tCode.tCode">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">출발역</label>
									<div class="col-md-9">
										<input type="text" class="form-control wid50" readonly="readonly" id="tStart">
										<label class="col-md-2 control-label" for="name">도착역</label>
										<input type="text" class="form-control wid50" id="tArrive" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">가격</label>
									<div class="col-md-9">
										<input type="text" class="form-control price wid30" name="price">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">경유지</label>
									<div class="col-md-8">
										<select class="form-control" name="nodeid.nodeid">
											<c:forEach var="arrive" items="${ctList}">
												<option value="${arrive.nodeid}">${arrive.nodename}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="email">도착시간</label>
									<div class="col-md-9">
										<input type="text" class="cal form-control wid30" name="startday" readonly="readonly">
										<select name="starthour" class="form-control wid30">
											<c:forEach var="t" begin="0" end="23">
												<c:if test="${t < 11}">
													<option value="0${t}">${t} (오전 ${t}) 시</option>
												</c:if>
												<c:if test="${t >= 11}">
													<option value="${t}">${t} (오후 ${t-12}) 시</option>
												</c:if>
											</c:forEach>
										</select>
										<span class="floatleft">시</span>
										<select class="form-control wid30" name="startminutes">
											<option>00</option>
											<option>15</option>
											<option>30</option>
											<option>45</option>
										</select>
										<span class="floatleft">분</span>
									</div>
									<input type="hidden" name="startTime">
								</div>
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right" id="trainSubmit">등록</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div><!--/.col-->
			
		</div><!--/.row-->
	</div>	<!--/.main-->
	
</body>
</html>