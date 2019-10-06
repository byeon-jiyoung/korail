<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>

<style>
	nav {
		margin-bottom: 0;
	}
	section {
		width: 1070px;
		margin: 0 auto;
		overflow: hidden;
		background-color: white;
		border-left: 1px solid #d6d3d3;
		border-right: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	.join_sec_left {
		float: left;
		width: 19.7%;
	}
	.join_sec_right {
		float: left;
		width: 80%;
		border-left: 1px solid #d6d3d3;
		min-height: 1000px;
	}
	#join_back {
		background: url("${pageContext.request.contextPath}/resources/images/notice/cmt_snv_tit_bg.png") no-repeat;
		background-size: 100%;
		padding-left: 20px;
	}
	#join_back span {
		display: inline-block;
		margin-top: 40px;
		font-size: 0.7em;
		color: #ccc;
	}
	#join_back h3 {
		margin-bottom: 50px;
	}
	.join_sec_left p {
		border-top: 1px solid #aaa;
		padding: 10px 20px;
		font-size: 14px;
	}
	.join_sec_left p:last-child {
		border-bottom: 1px solid #aaa;
	}
	.join_color {
		background-color: #266fcb;
		color: white;
		font-weight: bold;
	}
	#join_back2 {
		background: url("${pageContext.request.contextPath}/resources/images/join/tra_visual13.jpg") no-repeat right top;
		padding-left: 30px;
	}
	#join_back2 p {
		padding-top: 40px;
	}
	#join_back2 p a {
		font-size: 0.8em;
		color: #666;
		text-decoration: none;
	}
	#join_back2 h1 {
		padding-bottom: 60px;
		padding-top: 10px;
	}
	#join_list {
		padding: 0 30px;
	}
	#join_list > b {
		font-size: 1.2em;
	}
	.stipulation {
		font-size: 0.8em;
		margin: 30px 0;
		overflow: hidden;
	}
	.textarea {
		padding: 10px;
		width: 97%;
		height: 150px;
		border: 1px solid #ddd;
		overflow-y: auto;
    	overflow-x: hidden;
		margin: 10px 0;
	}
	.color {
		color: #0e91f6;
		font-weight: bold;
		font-size: 1.2em;
	}
	.stipulation > p {
		float: right;
	}
	#all {
		text-align: center;
		margin: 20px 0;
	}
	button {
		float: right;
		background: url("${pageContext.request.contextPath}/resources/images/join/btn_bg_blue.gif") repeat-x;
		background-size: auto 100%;
		padding: 7px 15px;
		border: none;
		color: white;
	}
</style>
<script>
	$(function() {
		$("#allcheck").click(function() {
			if($("#allcheck").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	        }else{ //클릭이 안되있으면
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	        }
		})
		
		$("button").click(function() {
			if($("#agree1").prop("checked")==false) {
				alert("회원약관을 읽어보시고 동의하셔야 합니다.");
				return false;
			}
			if($("#agree2").prop("checked")==false) {
				alert("개인정보 수집 및 이용에 대한 안내를 읽어보시고 동의하셔야 합니다.");
				return false;
			}
			if($("#agree3").prop("checked")==false) {
				alert("개인정보 제3자 제공에 대한 안내를 읽어보시고 동의하셔야 합니다.");
				return false;
			}
			location.href = "${pageContext.request.contextPath}/join/join"
		})
	})
</script>
	<section>
		<div class="join_sec_left">
			<div id="join_back">
				<span>LET'S KORAIL TRAIN</span>
				<h3>코레일멤버십</h3>
			</div>
			<div>
				<a href="${pageContext.request.contextPath}/"><p>멤버십소개</p></a>
				<a href="${pageContext.request.contextPath}/"><p class="join_color">멤버십가입신청</p></a>
				<a href="${pageContext.request.contextPath}/"><p>멤버십탈퇴</p></a>
			</div>
		</div>
		<div class="join_sec_right">
			<div id="join_back2">
				<p><img src="${pageContext.request.contextPath}/resources/images/notice/ico_home.gif"> 
					<a href="${pageContext.request.contextPath}/">홈</a> > 
					<a href="${pageContext.request.contextPath}/">코레일멤버십</a> > 
					<a href="${pageContext.request.contextPath}/">멤버십가입신청</a> >
					<a href="${pageContext.request.contextPath}/">멤버십가입신청 약관동의</a></p> 
				<h1>멤버십가입신청</h1>
			</div>
			<div id="join_list">
				<img src="${pageContext.request.contextPath}/resources/images/login/but.gif"> <b>약관동의</b>
				<div class="stipulation">
					<img src="${pageContext.request.contextPath}/resources/images/join/bu3.gif"> <b>홈페이지 회원약관</b>
					<div class="textarea">
						제1조(목적)<br>
						이 약관은 한국철도공사(이하 “공사”라고 한다)가 운영하는 코레일 홈페이지(www.korail.com), 레츠코레일 홈페이지(www.letskorail.com), 코레일톡에서 제공하는 커뮤니티를 이용함에 있어 공사와 이용자간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
						<br><br>
						제2조(정의)<br>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
						1. "서비스"라 함은 코레일 홈페이지, 레츠코레일 홈페이지 및 코레일톡에서 이용자가 게시글 또는 댓글 작성, 사진·UCC를 업로드 하거나 조회하는 등 커뮤니티 관련 서비스를 의미합니다.<br>
						2. "이용자"란 약관에 따라 공사가 제공하는 서비스를 이용할 수 있는 회원 및 비회원을 말합니다.<br>
						3. "회원”이라 함은 코레일멤버십회원으로 공사가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
						4. "비회원”이라 함은 코레일멤버십 회원에 해당되지 않으나, 소셜로그인 등 별도의 인증 절차를 거쳐 공사가 제공하는 서비스를 이용하는 자를 말합니다.<br>
						5. "게시물"이라 함은 이용자가 서비스를 이용함에 있어 서비스상에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
						<br><br>
						제3조(약관의 게시와 개정)<br>
						① 공사는 이 약관의 내용을 이용자가 조회·확인할 수 있도록 홈페이지 초기 화면에 게시합니다.<br>
						② 공사는 "약관의규제에관한법률", "개인정보보호법" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있으며, 개정한 약관은 온라인에 7일 이상 게시함으로써 효력을 발휘합니다.<br>
						③ 이 약관에 동의하는 것은 정기적으로 약관의 변경사항을 확인하는 것에 동의함을 의미하며, 변경된 약관에 대한 정보를 알지 못해 발생하는 이용자의 피해는 공사에서 책임지지 않습니다.<br>
						④ 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있으며, 제3항의 기간내에 명시적으로 거부의사를 표명하지 않은 경우 약관의 변경 사항에 동의한 것으로 간주합니다.
						<br><br>
						제4조(약관의 해석)<br>
						① 이 약관은 공사가 제공하는 서비스에 관하여 적용합니다.<br>
						② 이 약관에서 정하지 아니한 사항이나 해석에 대해서는 관계법령 또는 관련 약관에 따릅니다.
						<br><br>
						제5조(이용계약 체결)<br>
						① 공사의 서비스 이용을 위한 회원가입은 이용자가 홈페이지에서 본인인증을 거쳐 약관의 내용에 동의한 후, 공사가 정한 온라인가입신청서에 성명, 비밀번호, 연락처 등 필수 입력사항을 입력하고 가입신청을 함과 동시에 서비스 이용을 승낙함을 원칙으로 합니다.<br>
						② 다만, 공사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.<br>
						1. 가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 공사의 회원 재가입 승낙을 얻은 경우에는 예외로 함.<br>
						2. 허위의 정보를 기재하거나, 공사가 제시하는 내용을 기재하지 않은 경우<br>
						3. 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우<br>
						③ 이용계약의 성립 시기는 공사가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
						<br><br>
						제6조(회원정보의 변경)<br>
						① 회원은 홈페이지 ‘마이페이지’메뉴를 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 회원번호 등은 수정이 불가능합니다.<br>
						② 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 회원정보 관리페이지에서 이를 변경하여야 합니다. 이 경우 변경사항을 공사에 알리지 않아 발생한 불이익에 대하여 공사는 책임지지 않습니다.
						<br><br>
						제7조(개인정보보호 의무)<br>
						공사는 "개인정보보호법" 등 관계 법령이 정하는 바에 따라 이용자의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 공사의 개인정보처리방침이 적용됩니다. 다만, 공사의 공식 사이트 이외의 링크된 사이트에서는 공사의 개인정보처리방침이 적용되지 않습니다.
						<br><br>
						제8조(회원의 아이디 및 비밀번호의 관리에 대한 의무)<br>
						① 회원의 아이디와 비밀번호에 관한 관리책임은 회원에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.<br>
						② 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 본인의 비밀번호를 수정하는 등의 조치를 취해야하며 즉시 공사에 통지하고 공사의 안내에 따라야 합니다.<br>
						③ 제2항의 경우에 해당 회원이 공사에 그 사실을 통지하지 않거나, 통지한 경우에도 공사의 안내에 따르지 않아 발생한 불이익에 대하여 공사는 책임지지 않습니다.
						<br><br>
						제9조(이용자에 대한 통지)<br>
						① 공사가 이용자에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자 우편주소, 휴대전화메세지, 그 밖의 방법으로 제공할 수 있습니다.<br>
						② 공사는 이용자 전체에 대한 통지의 경우 온라인에 7일 이상 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
						<br><br>
						제10조(공사의 의무)<br>
						① 공사는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 서비스를 제공하기 위하여 최선을 다하여 노력합니다.<br>
						② 공사는 이용자가 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.<br>
						③ 공사는 서비스 이용과 관련하여 발생하는 이용자의 불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템을 구비합니다.<br>
						④ 공사는 서비스 이용과 관련하여 이용자로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. 이용자가 제기한 의견이나 불만사항에 대해서는 전자우편 등을 통하여 이용자에게 처리과정 및 결과를 전달합니다.
						<br><br>
						제11조(이용자의 의무)<br>
						① 이용자는 다음 행위를 하여서는 안 됩니다.<br>
						1. 신청 또는 변경 시 허위내용의 등록<br>
						2. 타인의 정보도용<br>
						3. 공사가 게시한 정보의 변경<br>
						4. 공사가 정한 정보 이외의 정보등의 송신 또는 게시<br>
						5. 공사와 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
						6. 공사 및 기타 제3자의 명예를 훼손시키거나 업무를 방해하는 행위<br>
						7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 서비스에 공개 또는 게시하는 행위<br>
						8. 공사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위<br>
						9. 기타 불법적이거나 부당한 행위<br>
						② 이용자는 관계법, 이 약관의 규정, 이용안내 및 서비스와 관련하여 공지한 사항을 준수하여야 하며, 기타 공사의 업무에 방해되는 행위를 하여서는 안 됩니다.
						<br><br>
						제12조 (서비스의 제공)<br>
						① 서비스는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.<br>
						② 공사는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 서비스의 제공을 일시적으로 중단할 수 있습니다. 이 경우 공사는 제9조(이용자에 대한 통지)에 정한 방법으로 이용자에게 통지합니다. 다만, 공사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.<br>
						③ 공사는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 홈페이지 화면에 공지한 바에 따릅니다.
						<br><br>
						제13조(서비스의 변경)<br>
						공사는 서비스의 일부 또는 전부를 공사의 운영상, 기술상의 필요에 따라 수정, 중단, 변경할 수 있으며, 이 경우 공사는 제9조(이용자에 대한 통지)에 정한 방법으로 이용자에게 통지합니다. 다만 공사가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
						<br><br>
						제14조(정보의 제공 및 광고의 게재)<br>
						① 공사는 회원이 서비스 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 회원에게 제공할 수 있습니다. 다만, 회원은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.<br>
						② 공사는 서비스의 운영과 관련하여 서비스 화면, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 회원은 수신거절을 공사에게 할 수 있습니다.
						<br><br>
						제15조(게시물의 저작권 및 관리)<br>
						① 공사는 회원의 게시물을 소중하게 생각하며 변조, 훼손, 삭제되지 않도록 최선을 다하여 보호합니다. 다만, 다음 각 호에 해당하는 게시물이나 자료의 경우 사전통지 없이 삭제하거나 이동 또는 등록 거부를 할 수 있으며, 해당 회원의 자격을 제한, 정지 또는 박탈할 수 있습니다.<br>
						1. 다른 회원 또는 제3자에게 심한 모욕을 주거나 명예를 훼손시키는 경우<br>
						2. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우<br>
						3. 불법복제 또는 해킹을 조장하는 내용인 경우<br>
						4. 영리를 목적으로 하는 광고일 경우<br>
						5. 범죄적 행위에 결부된다고 인정되는 내용인 경우<br>
						6. 공사나 다른 회원의 저작권 혹은 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br>
						7. 공사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우<br>
						8. 스팸성 게시물인 경우<br>
						9. 기타 관계법령에 위배된다고 판단되는 경우<br>
						② 공사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 공사에 귀속됩니다.<br>
						③ 회원이 서비스 화면 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 또한 공사는 게시자의 동의없이 게시물을 상업적으로 이용할 수 없습니다. 다만, 비영리 목적인 경우는 그러하지 아니하며, 또한 이 사이트 내에서의 게재권을 갖습니다.<br>
						④ 회원은 서비스를 이용하여 취득한 정보를 공사의 사전 승낙없이 임의가공, 판매, 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>
						⑤ 공사는 합병, 영업양도, 공사가 운영하는 사이트간의 통합 등의 사유로 원래의 게시물의 내용을 변경하지 않고 게시물의 게시 위치를 변경할 수 있습니다.
						<br><br>
						제16조(권리의 귀속)<br>
						공사는 서비스와 관련하여 회원에게 공사가 정한 이용조건에 따라 계정, 콘텐츠 등을 이용할 수 있는 이용권만을 부여하며, 회원은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
						<br><br>
						제17조(회원탈회 등)<br>
						① 회원은 언제든지 서비스 초기화면의 마이페이지-회원정보 관리 메뉴 등을 통하여 회원 탈회를 신청할 수 있으며, 공사는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.<br>
						② 회원이 탈회를 신청할 경우, 관련법 및 개인정보처리방침에 따라 공사가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 회원의 모든 데이터는 소멸됩니다.<br>
						③ 회원이 탈회를 신청하는 경우, 회원이 작성한 게시물 중 게시판에 본인 계정으로 등록된 게시물은 삭제됩니다만 다른 회원에 의해 스크랩되거나 공용게시판에 등록된 게시물은 삭제되지 않습니다.<br>
						④ 회원이 탈회하는 경우 공사는 코레일멤버십 가입 및 이용에 관한 약관 제6조에서 정한 혜택등을 제공하지 않습니다.
						<br><br>
						제18조(이용제한 등)<br>
						① 공사는 이용자가 본 약관의 의무를 위반하거나 서비스의 정상적인 운영을 방해한 경우 이용자에게 제공하는 서비스를 중지하거나 탈회 조치할 수 있습니다.<br>
						② 제1항에 따라 이용자(또는 제3자)에게 발생한 손해는 공사에서 책임을 부담하지 않습니다.<br>
						③ 공사는 제 1항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 탈회 조치를 할 수 있습니다.<br>
						④ 제1항 제3항에 따른 탈회 조치시 공사는 코레일멤버십 가입 및 이용에 관한 약관 제 6조에서 정한 회원의 이용실적 뿐만아니라 서비스 이용을 통해 획득한 할인쿠폰 등 기타혜택도 모두 소멸되며, 공사는 이에 대해 별도로 보상하지 않습니다.<br>
						⑤ 본 조에 따라 서비스 이용을 제한하거나 탈회 조치하는 경우에는 공사는 제9조(이용자에 대한 통지)에 따라 통지합니다.<br>
						⑥ 회원은 본 조에 따른 이용제한 등에 대해 이의신청을 할 수 있으며, 이 때 이의가 정당하다고 공사가 인정하는 경우 공사는 즉시 서비스의 이용을 재개합니다.
						<br><br>
						제19조(책임제한)<br>
						① 공사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br>
						② 공사는 이용자의 귀책사유로 인한 서비스 이용의 장애에 대하여는 책임을 지지 않습니다.<br>
						③ 공사는 이용자가 서비스와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.<br>
						④ 공사는 이용자 간 또는 이용자와 제3자 상호간에 서비스를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.<br>
						⑤ 공사는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
						<br><br>
						제20조(준거법 및 재판관할)<br>
						① 공사와 이용자간 제기된 소송은 대한민국법을 준거법으로 합니다.<br>
						② 공사와 이용자간 발생한 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 이용자의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.
						<br><br>
						부 칙<br>
						이 약관은 2014.5.27일부터 시행한다
					</div>
					<p><input type="checkbox" name="chk" id="agree1"> <label for="agree1"><b>회원약관</b>에 동의하십니까?</label></p>
				</div>
				<div class="stipulation">
					<img src="${pageContext.request.contextPath}/resources/images/join/bu3.gif"> <b>개인정보 수집 및 이용에 대한 안내</b>
					<div class="textarea">
						○ 개인정보의 수집 및 이용 목적<br>
						▷ 개인정보파일 : 철도회원정보<br>
						- 운영근거 : 전자상거래 등에서의 소비자 보호에 관한 법률<br>
						- <span class="color">처리목적 : 승차권 예약 발매, 부가서비스 제공</span><br>
						☞ 개인정보 수집항목 :(필수) 이름, I-PIN제공정보(CI/DI), 휴대전화번호, 생년월일, 성별, 홈페이지 비밀 번호, 현장발권 비밀번호<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(선택) 전화번호, 이메일, 신용카드번호, 주소, 주이용구간, 사진<br>
						- <span class="color">보유기간 : 회원탈회시 즉시삭제</span><br>
						☞ 개인정보 수집항목 :(필수) 스마트폰 Mac주소 ,<span class="color">주민등록번호(계좌이체)</span><br>
						- <span class="color">보유기간 : 거래일로부터 5년</span>
						<br><br>
						▷ 개인정보파일 : 레일플러스 회원정보<br>
						- 운영근거 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
						- <span class="color">처리목적 : 회원관리</span><br>
						☞ (레일 플러스 회원정보)개인정보 수집항목 :(필수)이름, 생년월일, 아이디, 비밀번호,휴대폰번호, 주소, 이메일<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(선택)일반전화번호<br>
						- <span class="color">보유기간 : 회원탈회시 즉시삭제</span><br>
						☞ (신규 및 할인카드 등록정보 회원)개인정보 수집항목 :(필수)이름, 생년월일, 아이디, 비밀번호, 휴대폰번호, 주소, 이메일, 카드번호<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(선택)일반전화번호, 주민등록번호(소득공제/법정대리인)<br>
						- <span class="color">보유기간 : 거래일로부터 5년</span><br>
						☞ (할인카드 등록정보) 개인정보 수집항목:카드번호, 생년월일, 주소<br>
						- <span class="color">보유기간 : 거래일로부터 5년</span>
						<br><br>
						▷ 개인정보파일 :고객제안<br>
						- 운영근거 : 민원사무처리에 관한 법률<br>
						- <span class="color">처리목적 : 민원접수, 처리</span><br>
						- 개인정보 수집항목 : (필수)아이디, 비밀번호, 이름, 업체코드, 비밀번호, 휴대폰번호, 주소, 이메일<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(선택)일반전화번호<br>
						- <span class="color">보유기간 : 3년</span><br>
						우리 공사는 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.
						<br><br>
						서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
						- IP주소, 쿠키, 서비스 이용기록, 방문기록, 스마트폰 기기정보 등
						<br><br>
						○ 수집 동의 거부 권리 및 불이익<br>
						한국철도공사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 아래와 같은 최소한의 개인정보를 수집하고 있습니다. 개인 정보 수집에 동의하지 않을 권리가 있으나 거부 시 회원가입이 제한됩니다.
						<br><br>
						○ 관련법령에 의한 정보보유 사유<br>
						상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령(제6조)에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.
						<br><br>
						- 계약 또는 청약철회 등에 관한 기록 : 5년<br>
						- 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br>
						- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년
						<br><br>
						○ 개인정보의 제3자 제공<br>
						한국철도공사는 정보주체의 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 『개인정보 보호법』제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.<br>
						☞ 철도회원정보<br>
						- <span class="color">제공받는 자 : 철도특별사법경찰대, 법원, 검찰청, 경찰청<br>
						- 제공목적 : 수사목적에 의한 개인정보 제공</span><br>
						- 제공근거 : 형사소송법 제199조 제2항<br>
						- 제공항목 : 이름, 회원번호, 고객구분, 주소, 생년월일, 성별, 핸드폰, 이메일, 집전화 예약유형, 발권여부, 예약일시, 취소일시, 승차일자, 열차 번호, 승차구간, 출발시간, 도착시간, 좌석정보, 할인정보, 승차권 번호, 발매구분, 발매일시, 반환변경일시, 승차권금액, 결제종류, 카드사, 카드번호, 승인번호, 현금영수증번호, 결제금액<br>
						- <span class="color">제공받는 자의 보유/이용기간 : 목적달성 후 즉시 파기</span><br>
						- 수집 동의 거부 및 불이익 : 개인정보 수집에 동의하지 않을 권리가 있으나 거부 시 회원가입이 제한됩니다.
					</div>
					<p><input type="checkbox" name="chk" id="agree2"> <label for="agree2"><b>개인정보 수집 및 이용에 대한 안내</b>에 동의하십니까?</label></p><br>
					<p><input type="checkbox" name="chk" id="agree3"> <label for="agree3"><b>개인정보의 제3자 제공에 대한 안내</b>에 동의하십니까?</label></p><br>
					<p><input type="checkbox" name="chk" id="b"> <label for="b"><b>선택정보 수집 및 이용에 대한 안내</b>에 동의하십니까?</label></p><br>
					<p>선택정보를 입력하지 않은 경우에도 서비스 이용제한은 없습니다.</p><br>
					<p><input type="checkbox" name="chk" id="a"> <label for="a"><b>마케팅/홍보를 위하여 개인정보를 이용하는데</b> 동의하십니까?</label></p><br>
					<p>동의 거부시 상품 할인 및 이벤트 정보 안내서비스가 제한될 수 있습니다.</p><br>
				</div>
				<div id="all">
					<input type="checkbox" id="allcheck"><b> <label for="allcheck">위 약관에 모두 동의합니다.</label></b>
				</div>
				<button>확인</button>
			</div>
		</div>
	</section>
    
<%@ include file="../include/footer.jsp" %>