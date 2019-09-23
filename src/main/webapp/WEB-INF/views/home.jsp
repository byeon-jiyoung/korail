<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
 --%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <%@page import="org.w3c.dom.*"%>
<%@page import="javax.xml.parsers.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//XML 데이터를 호출할 URL 
	String url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=Zkg3ucRY45HWgJgabOI30xPS2e2ndsLP2FJoETX3S2Qu2ChXnnbiWVhNLYJZv4DfFwqX0ceS7v%2FK5e081nAUNg%3D%3D&cityCode=11";

	//서버에서 리턴 될 XML데이터의 엘리먼트 이름 배열
	String[] fieldNames = { "nodeid", "nodename" };

	//각 게시물하나에 해당하는 XML 노드를 담을 리스트
	ArrayList<Map> pubList = new ArrayList<Map>();

	try {
		//XML파싱 준비
		DocumentBuilderFactory f = DocumentBuilderFactory.newInstance();
		DocumentBuilder b = f.newDocumentBuilder();

		//위에서 구성한 URL을 통해 XMl 파싱 시작
		Document doc = b.parse(url);
		doc.getDocumentElement().normalize();
		NodeList items = doc.getElementsByTagName("item");

		//for 루프시작
		for (int i = 0; i < items.getLength(); i++) {
			//i번째 publication 태그를 가져와서
			Node n = items.item(i);
			
			//노드타입을 체크함, 노드 타입이 엘리먼트가 아닐경우에만 수행
			if (n.getNodeType() != Node.ELEMENT_NODE)
				continue;

			HashMap pub = new HashMap();

			Element e = (Element) n;
			
			//노드인경우
			for (String name : fieldNames) {
				NodeList titleList = e.getElementsByTagName(name);
				Element titleElem = (Element) titleList.item(0);
				Node titleNode = titleElem.getChildNodes().item(0);
					
				// 가져온 XML 값을 맵에 엘리먼트 이름 - 값 쌍으로 넣음
				
				pub.put(name, titleNode.getNodeValue());
			}
			/* out.println(pub); */
			
			/* 
			//노드안에 값을 가져올경우
			String nodeid = e.getAttribute("nodeid");
			String nodename = e.getAttribute("nodename");

			pub.put("nodeid", nodeid);
			pub.put("nodename", nodename);
			*/

			//데이터가 전부 들어간 맵을 리스트에 넣고 화면에 뿌릴 준비.
			pubList.add(pub);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<h3> xml 호출 주소 : <%=url%></h3>
	</div>
	<div>
		<table class="main-table">
			<tr>
				<td>종류</td>
			</tr>
			<%
				//XML의 모든 노드가 맵으로 변환되어 pubList에 들어가고,for 루프를 돌면서 pubList의 값을 뿌려줌.
				for (Map pub : pubList) {
			%>
			<tr>
				<td><%=pub.get("nodeid")%></td>
				<td><%=pub.get("nodename")%></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>