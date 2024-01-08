<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<!-- jQuery -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<!-- Bootstrap css、js、icon-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<!-- Google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Caveat&family=Noto+Serif+TC&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&family=Playfair+Display&display=swap"
	rel="stylesheet">
<!-- Firebase auth -->
<script src="https://www.gstatic.com/firebasejs/8.0.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.0.1/firebase-auth.js"></script>
<!-- AOS -->
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<!-- 自訂css -->
<link rel="stylesheet" href="./css/index.css">
<!-- 自訂Javascript -->
<script type="text/javascript" src="./js/index.js"></script>
<!-- 禁止快取網頁 -->
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>BSR</title>
</head>
<body>
	<!-- Logo -->
	<header
		class="container-fluid vw-100 fixed-top d-flex flex-nowrap align-items-center bg-dark m-0">
		<span class="vw-100 text-center text-light"> BSR </span> 
		<span
			class="text-end"> <a class="account bi bi-person-circle me-3"
			href="./Account"></a>
		</span> 
		<span class="text-end"> <a
			class="back bi bi-arrow-left-circle me-3" href="#" onclick="goBack()"></a>
		</span>
	</header>