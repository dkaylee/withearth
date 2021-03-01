<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 멤버</title>
</head>
<body>
    <h3>[ 로그인한 멤버 리스트 출력]</h3>
    
<%
    Object lobj_getdata = session.getAttribute("loginInfo");
    String ls_getdata = (String)lobj_getdata;
   
    out.println("설정된 세션값 [1] → " + ls_getdata );
%>

</body>
</html>
