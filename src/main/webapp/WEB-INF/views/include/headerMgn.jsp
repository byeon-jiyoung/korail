<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/datepicker3.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css">

<!--Custom Font-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chart.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/chart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/easypiechart-data.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</head>

<style>
	.fa-bell {
		font-size: 22px;
	}
</style>
<script>
	$(function() {
		$("#goLogin").click(function() {
			location.href = "${pageContext.request.contextPath}/manager/login";
		})
		
		$("#logout_img").click(function() {
			var result = confirm("로그아웃 하시겠습니까?");
			
			if(result == true) {
				location.href = "${pageContext.request.contextPath}/manager/logout";
			}
		})
	})
</script>

<body>
	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">
					<%-- <img src="${pageContext.request.contextPath}/resources/images/include/lets_logo.png"> --%>
					Let's KORAIL
				</a>
				<ul class="nav navbar-top-links navbar-right">
					<li class="dropdown">
						<a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
							<em class="fa fa-bell"></em>
						</a>
						<ul class="dropdown-menu dropdown-alerts">
							<li>
								<a href="#" id="goLogin">
									<div>
										<em class="fa fa-envelope loginfont"></em>
										<c:if test="${Mgn == null}">
											<span class="loginfont"> LOGIN</span>
										</c:if>
										<c:if test="${Mgn != null}">
											<span class="loginfont" id="logout_img"> LOGOUT</span>
										</c:if>
									</div>
								</a>
							</li>
							<li class="clear"></li>
						</ul>
					</li>
				</ul>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="${pageContext.request.contextPath}/resources/images/manager/korail.jpg" class="img-responsive">
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">관리자(${Mgn.manId})</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		<ul class="nav menu" id="navmenu">
			<li class="active"><a href="${pageContext.request.contextPath}/manager/korail"><em class="fa fa-toggle-on">&nbsp;</em> Main</a></li>
			<li><a href="${pageContext.request.contextPath}/manager/train"><em class="fa fa-toggle-off">&nbsp;</em> Train</a></li>
			<li><a href="${pageContext.request.contextPath}/manager/traintime"><em class="fa fa-toggle-off">&nbsp;</em> Train Waypoint</a></li>
			<li><a href=""><em class="fa fa-toggle-off">&nbsp;</em> Member</a></li>
			<li><a href="${pageContext.request.contextPath}/event/mgnEvent"><em class="fa fa-toggle-off">&nbsp;</em> Event</a></li>
			<li><a href="${pageContext.request.contextPath}/notice/mgnNotice"><em class="fa fa-toggle-off">&nbsp;</em> Notice</a></li>
		</ul>
	</div><!--/.sidebar-->
	