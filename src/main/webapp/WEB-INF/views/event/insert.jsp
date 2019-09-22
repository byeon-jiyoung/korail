<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<section>
		<form action="insert" method="post" enctype="multipart/form-data">
			<div>
				<label>제목</label>
				<input type="text" name="eTitle">
			</div>
			<div>
				<label>내용</label>
				<textarea rows="10" cols="50" name="eContent"></textarea>
			</div>
			<div>
				<label>이미지</label>
				<input type="file" name="imgFiles" id="efile">
			</div>
			<input type="submit">
		</form>
		<div id="imgWrap"></div>
		
		<script>
			$("#efile").change(function() {
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
		</script>
	</section>
</body>
</html>