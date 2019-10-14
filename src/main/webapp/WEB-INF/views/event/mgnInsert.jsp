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
				<div class="panel panel-default">
					<div class="panel-heading">
						Event<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em>
					</span></div>
					<div class="panel-body">
						<form class="form-horizontal" action="insert" method="post" id="eventForm"  enctype="multipart/form-data">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="eTitle">Title</label>
									<div class="col-md-10">
										<input id="eTitle" name="eTitle" type="text" placeholder="Title" class="form-control">
										<span class="reg">제목을 입력하세요.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="efile">Image</label>
									<div class="col-md-10">
										<input id="efile" name="imgFiles" type="file" placeholder="Your email" class="form-control">
									</div>
								</div>
								<div class="form-group none">
									<label class="col-md-2 control-label">selected Image</label>
									<div class="col-md-10" id="imgWrap">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="eContent">Content</label>
									<div class="col-md-10">
										<textarea class="form-control" id="eContent" name="eContent" placeholder="Please enter your content here..." rows="10"></textarea>
										<span class="reg">내용을 입력하세요.</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right">이벤트 등록</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div><!--/.col-->
		</div><!-- /.row -->
	</div>
</body>
</html>