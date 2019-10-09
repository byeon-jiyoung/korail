<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/headerMgn.jsp" %>

	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default loginDiv">
				<div class="panel-heading">Log in</div>
				<div class="panel-body">
					<form role="form">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="ID" name="manId" type="text" autofocus="">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="PASSWORD" name="manPw" type="password" value="">
							</div>
							<div id="loginBtnwrap">
								<a href="${pageContext.request.contextPath}/manager/home" class="btn btn-primary" id="loginBtn">Login</a>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	
</body>
</html>