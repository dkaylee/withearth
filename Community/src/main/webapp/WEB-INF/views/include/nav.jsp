<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="#page-top">
			WithEarth</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="/about"/>">About</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="#"/>">Tumbler</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="#"/>">Walking</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="#"/>">Point</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<c:url value="#"/>">Donation</a></li>
				<li class="nav-item">
				<a class="nav-link" href="<c:url value="/comm/matlist"/>">Community</a>
				</li>
			</ul>
		</div>
	</div>
</nav>
