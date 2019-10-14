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
		$("#navmenu li").eq(0).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(1).removeClass("active");
		$("#navmenu li").eq(1).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(2).addClass("active");
		$("#navmenu li").eq(2).find("em").removeClass("fa-toggle-off").addClass("fa-toggle-on");
		
		$('.cal').datepicker({
			beforeShowDay: noBefore
		})
		$('.cal').datepicker("setDate", new Date());

		$("select[name='tCode.tCode']").change(function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/manager/searchTrain?tCode="+$("select[name='tCode.tCode']").val(),
				type: "get",
				dataType: "json",
				success: function(res) {
					console.log(res);
					
					var time = new Date(res.train.tStartTime);
					var st_time = time.getFullYear()+"-"+("00" + (time.getMonth()+1)).slice(-2)+"-"+("00" + time.getDate()).slice(-2)+" "+
								("00"+ time.getHours()).slice(-2)+":"+("00" + time.getMinutes()).slice(-2);
					var time2 = new Date(res.train.tArriveTime);
					var ar_time = time2.getFullYear()+"-"+("00" + (time2.getMonth()+1)).slice(-2)+"-"+("00" + time2.getDate()).slice(-2)+" "+
								("00"+ time2.getHours()).slice(-2)+":"+("00" + time2.getMinutes()).slice(-2);
					
								
					$("#start").val(res.train.tStart.nodename);
					$("#arrive").val(res.train.tArrive.nodename);
					$("#startT").val(st_time);
					$("#arriveT").val(ar_time);
					$("input[name='price']").attr("placeholder", res.traintime.price).attr("data-oriPrice", res.traintime.price);
				}
			})
		})
		
		$("#trainTimeForm").submit(function() {
			if($("select[name='tCode.tCode']").val() == "열차번호를 선택하세요") {
				alert("열차번호를 선택하세요");
				return false;
			}
			if($("#start").val() == $("select[name='nodeid.nodeid']").attr("data-name")) {
				alert("출발역과 경유지가 같습니다");
				return false;
			}
			if($("#arrive").val() == $("select[name='nodeid.nodeid']").attr("data-name")) {
				alert("종착역과 경유지가 같습니다");
				return false;
			}
			
			var start = $("input[name='startday']").val() + " " + $("select[name='starthour']").val() + ":" + $("select[name='startminutes']").val();
			$("input[name='ttstartTime']").attr("value",start);
			
			if($("#startT").val() > start) {
				alert("경유지 출발시간이 더 작습니다. 시간을 다시 입력하세요.");
				return false;
			}
			if($("#arriveT").val() < start) {
				alert("경유지 출발시간이 더 큽니다. 시간을 다시 입력하세요.");
				return false;
			}
			
			if($("input[name='price']").val() == "") {
				alert("가격을 입력하세요");
				return false;
			}
			
			if($("input[name='price']").val() > $("input[name='price']").attr("data-oriPrice")) {
				alert("최대"+$("input[name='price']").attr("data-oriPrice")+"원을 넘을 수 없습니다.");
				return false;
			}
			
			alert("추가되었습니다.");
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
				<div class="panel panel-default" id="tt">
					<div class="panel-heading">
						Train Time information<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em>
					</span></div>
					<div class="panel-body">
						<form class="form-horizontal" action="traintime" method="post" id="trainTimeForm">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">열차번호</label>
									<div class="col-md-8">
										<select class="form-control" name="tCode.tCode">
											<option>열차번호를 선택하세요</option>
											<c:forEach var="train" items="${tList}">
												<option>${train.tCode}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">출발역</label>
									<div class="col-md-9">
										<input type="text" class="form-control price wid50" id="start" readonly="readonly">
										<label class="col-md-2 control-label" for="name">출발시간</label>
										<input type="text" class="form-control price wid50" id="startT" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">종착역</label>
									<div class="col-md-9">
										<input type="text" class="form-control price wid50" id="arrive" readonly="readonly">
										<label class="col-md-2 control-label" for="name">도착시간</label>
										<input type="text" class="form-control price wid50" id="arriveT" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="name">가격</label>
									<div class="col-md-9">
										<input type="text" class="form-control price wid50" name="price">
										<label class="col-md-2 control-label" for="name">경유지</label>
										<select class="form-control wid50" name="nodeid.nodeid">
											<c:forEach var="arrive" items="${ctList}">
												<option value="${arrive.nodeid}" data-name="${arrive.nodename}">${arrive.nodename}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="email">경유지 출발시간</label>
									<div class="col-md-9">
										<input type="text" class="cal form-control wid30" name="startday">
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
									<input type="hidden" name="ttstartTime">
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