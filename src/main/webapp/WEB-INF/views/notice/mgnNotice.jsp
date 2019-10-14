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
	
	#goInsert {
		float: right;
		font-size: 0.8em;
		color: black;
		font-weight: bold;
	}
	
	#read {
		display: none;
	}
	#nofile {
		width: auto;
		height: auto;
	}
	.no_img {
		width: 50%;
		
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
		
		$(".noticeRead").click(function() {
			$("#read").css("display", "block");
			
			var noNo = $(this).attr("data-no");
			
			$("#noTitle").empty();
			$("#noContent").empty();
			$("#writer").empty();
			$("#writedate").empty();
			$("#nofile").empty();
			
			$.ajax({
				url: "${pageContext.request.contextPath}/notice/mgnRead?noNo="+noNo,
				type: "get",
				dataType: "json",
				success: function(res) {
					console.log(res);
					
					var time = new Date(res.noRegdate);
					var write_time = time.getFullYear()+"-"+("00" + (time.getMonth()+1)).slice(-2)+"-"+("00" + time.getDate()).slice(-2)+" "+
								("00"+ time.getHours()).slice(-2)+":"+("00" + time.getMinutes()).slice(-2);
					
					$("#noTitle").val(res.noTitle);
					$("#noContent").val(res.noContent);
					$("#writer").val(res.noWriter);
					$("#writedate").val(write_time);
					
					if(res.noImg != null) {
						var img = $("<img>").attr("src", "displayFile?filename="+res.noImg).addClass("no_img");
						$("#nofile").append(img);
					}else {
						$("#nofile").append("이미지 없음")
					}
				}
			})
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
				<div class="panel panel-default articles">
					<div class="panel-heading">
						Notice<span class="pull-right clickable panel-toggle panel-button-tab-left">
						<em class="fa fa-toggle-up"></em></span>
						<a href="${pageContext.request.contextPath}/notice/mgnInsert" id="goInsert">공지사항추가</a>
					</div>
					<div class="panel-body articles-container">
						<c:forEach var="notice" items="${list}">
							<div class="article border-bottom">
								<div class="col-xs-12">
									<div class="row">
										<div class="col-xs-2 col-md-3 date">
											<div class="large"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noRegdate}"/></div>
										</div>
										<div class="col-xs-10 col-md-9">
											<h4><a href="#" class="noticeRead" data-no="${notice.noNo}">${notice.noTitle}</a></h4>
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
								<li><a href="mgnNotice?page=${pageMaker.startPage-1}">&laquo;</a></li>
							</c:if>
							<c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li ${pageMaker.cri.page == idx ? 'class="active"' : ''}><a href="mgnNotice?page=${idx}">${idx}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li><a href="mgnNotice?page=${pageMaker.endPage+1}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div><!--End .articles-->
			</div><!--/.row-->
		</div><!-- /.row -->
		
		<!-- read기능 -->
		<div class="row" id="read">
			<div class="col-md-12">
				<div class="panel panel-default articles">
					<div class="panel-body articles-container">
						<div class="form-horizontal">
							<div class="form-group">
								<label class="col-md-2 control-label" for="noTitle">작성일</label>
								<div class="col-md-10">
									<input type="text" id="writedate" class="form-control wid50">
									<label class="col-md-2 control-label" for="noTitle">작성자</label>
									<input type="text" id="writer" class="form-control wid50">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" for="noTitle">Title</label>
								<div class="col-md-10">
									<input id="noTitle" name="noTitle" type="text" class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" for="noContent">Content</label>
								<div class="col-md-10">
									<textarea class="form-control" id="noContent" name="noContent" rows="10"></textarea>
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label" for="nofile">Image</label>
								<div class="col-md-10">
									<div id="nofile" class="form-control"></div>
								</div>
							</div>
						</div>
					</div>
				</div><!--End .articles-->
			</div><!--/.row-->
		</div><!-- /.row -->
	</div>
</body>
</html>