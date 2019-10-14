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
		$("#navmenu li").eq(0).removeClass("active");
		$("#navmenu li").eq(0).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(1).removeClass("active");
		$("#navmenu li").eq(1).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(2).removeClass("active");
		$("#navmenu li").eq(2).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(3).removeClass("active");
		$("#navmenu li").eq(3).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(4).removeClass("active");
		$("#navmenu li").eq(4).find("em").removeClass("fa-toggle-on").addClass("fa-toggle-off");
		$("#navmenu li").eq(5).addClass("active");
		$("#navmenu li").eq(5).find("em").removeClass("fa-toggle-off").addClass("fa-toggle-on");
		
		$("#nofile").change(function() {
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
		
		$("#noticeForm").submit(function(e) {
			$(".reg").css("display", "none");
			
			if($("input[name='noTitle']").val()=="") {
				$("input[name='noTitle']").next(".reg").css("display", "inline-block");
				return false;
			}
			
			if($("textarea[name='noContent']").val()=="") {
				$("textarea[name='noContent']").next(".reg").css("display", "inline-block");
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
				<li class="active">Notice</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						Notice<span class="pull-right clickable panel-toggle panel-button-tab-left"><em class="fa fa-toggle-up"></em>
					</span></div>
					<div class="panel-body">
						<form class="form-horizontal" action="mgnInsert" method="post" id="noticeForm"  enctype="multipart/form-data">
							<fieldset>
								<div class="form-group">
									<label class="col-md-2 control-label" for="noTitle">Title</label>
									<div class="col-md-10">
										<input id="noTitle" name="noTitle" type="text" placeholder="Title" class="form-control">
										<span class="reg">제목을 입력하세요.</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="nofile">Image</label>
									<div class="col-md-10">
										<input id="nofile" name="imgFiles" type="file" placeholder="Your Image" class="form-control">
									</div>
								</div>
								<div class="form-group none">
									<label class="col-md-2 control-label">selected Image</label>
									<div class="col-md-10" id="imgWrap">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-2 control-label" for="noContent">Content</label>
									<div class="col-md-10">
										<textarea class="form-control" id="noContent" name="noContent" placeholder="Please enter your content here..." rows="10"></textarea>
										<span class="reg">내용을 입력하세요.</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12 widget-right">
										<button type="submit" class="btn btn-default btn-md pull-right">공지사항 등록</button>
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