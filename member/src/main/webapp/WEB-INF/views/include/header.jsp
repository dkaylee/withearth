<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>
  <!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="<c:url value="/"/>" class="logo">WithEarth</a>
					<nav id="nav">
						<a href="<c:url value="/"/>">Home</a>
						<c:if test="${loginInfo eq null}">
          				<a class="nav-link" href="<c:url value="/member/login"/>">LOGIN</a></c:if>
        				<c:if test="${loginInfo ne null}">          
          				<a class="nav-link" href="<c:url value="/member/logout"/>">LOGOUT</a></c:if>


						<a href="<c:url value="/tumbler/tumlist1"/>">텀블러사용 인증</a>

						<a href="<c:url value="/member/loc/walkingservice"/>">도보 인증 서비스</a>       			
						<a href="<c:url value="/member/dona/main?idx=${loginInfo.idx}"/>">나눔장터</a>


						<a href="<c:url value="/user/mypage/view"/>">마이페이지</a>
						<a href="<c:url value="/comm/matlist"/>">커뮤니티</a>						
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>