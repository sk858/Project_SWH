<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	request.setCharacterEncoding("UTF-8");
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); 
	String roadAddrPart2 = request.getParameter("roadAddrPart2"); 
	String engAddr = request.getParameter("engAddr"); 
	String jibunAddr = request.getParameter("jibunAddr"); 
	String zipNo = request.getParameter("zipNo"); 
	String addrDetail = request.getParameter("addrDetail"); 
	String admCd    = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdMgtSn  = request.getParameter("bdMgtSn");
	/** API 서비스 제공항목 확대 (2017.02) **/
	String detBdNmList  = request.getParameter("detBdNmList");
	String bdNm  = request.getParameter("bdNm");
	String bdKdcd  = request.getParameter("bdKdcd");
	String siNm  = request.getParameter("siNm");
	String sggNm  = request.getParameter("sggNm");
	String emdNm  = request.getParameter("emdNm");
	String liNm  = request.getParameter("liNm");
	String rn  = request.getParameter("rn");
	String udrtYn  = request.getParameter("udrtYn");
	String buldMnnm  = request.getParameter("buldMnnm");
	String buldSlno  = request.getParameter("buldSlno");
	String mtYn  = request.getParameter("mtYn");
	String lnbrMnnm  = request.getParameter("lnbrMnnm");
	String lnbrSlno  = request.getParameter("lnbrSlno");
	String emdNo  = request.getParameter("emdNo");
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function init(){
	var url = location.href;
	var confmKey = "devU01TX0FVVEgyMDIwMDEwOTE1MjExNTEwOTM3Nzk="
	var resultType = "4";
	
	var inputYn= "<%=inputYn%>";
	
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		document.form.action= "http://www.juso.go.kr/addrlink/addrLinkUrl.do";
		
		document.form.submit();
	}else{
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>", "<%=roadAddrPart2%>","<%=engAddr%>"
				, "<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>", "<%=detBdNmList%>"
				, "<%=bdNm%>", "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>"
				, "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=emdNo%>");
		window.close();
	}
}
</script>
</head>
<body onload="init();"> 
	<form id="form" name="form" method="post">
		<input type="hidden" id= "confmKey" name= "confmKey" value=""/>
		<input type="hidden" id="returnUrl" name= "returnUrl" value=""/>
		<input type="hidden" id= "resultType" name=	"resultType" value=""/> 
	</form>
</body>
</html>