<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/headerMgn.jsp" %>

<style>
	#sidebar-collapse {
		display: none;
	}
	.login-panel {
		margin-top: 100px;
	}
	#loginBtnwrap {
		text-align: center;
	}
	#loginBtn {
		padding: 10px 20px;
	}
</style>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default loginDiv">
				<div class="panel-heading">LOGIN</div>
				<div class="panel-body">
					<form role="form" id="loginForm" action="loginPost" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="ID" name="manId" type="text" autofocus="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="PASSWORD" name="manPw" type="password" value="">
							</div>
							<div id="loginBtnwrap">
								<input type="submit" class="btn btn-primary" id="loginBtn" value="Login">
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	
	<c:if test="${error == 'notMatch'}">
		<script>
			setTimeout(function(){
				alert("아이디와 비밀번호가 일치하지 않습니다.");
			}, 100); 
		</script>
		<%
			session.removeAttribute("error");
		%> 
	</c:if>
</body>
</html>