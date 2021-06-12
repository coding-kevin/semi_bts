<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.Date" %>
<!-- page 지시자(디렉티브) - 페이지에 대한 정보 설정-->

<%
   //스크립트릿 - jsp 코드를 넣는 곳
   Date d = new Date();
   String today = d.toLocaleString();
   out.print(today); //out - jsp 내장 객체
   //out.print() => 웹 브라우저에 출력하라는 것

   /*
      자바의 여러 줄 주석      
   */

   //자바의 한줄 주석
%>
<!DOCTYPE HTML>
<HTML>
 <HEAD>
  <TITLE> now1.jsp </TITLE>  
 </HEAD>
 <BODY>
  <h1>jsp 연습</h1>
  <p>현재 날짜는 <%=d%> 입니다</p>
  <!-- 표현식 => out.print(d) 와 동일-->

  <!-- html 주석 -->
  <%-- jsp 주석 --%>
 </BODY>
</HTML>
<!-- http://localhost:9090/testsite/now1.jsp
	 http://192.168.11.24:9090/testsite/now1.jsp

-->