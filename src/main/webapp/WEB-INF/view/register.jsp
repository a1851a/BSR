<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp"%>

<main class="container-fluid">

	<div class="d-flex flex-wrap align-items-center aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center"> 註冊BSR </span>
		<hr class="gradient mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>

	<div class="container-fluid px-0">
		<form class="row m-0 needs-validation" method="post"
			action="./Register" novalidate>
			<div class="col-10 mx-auto px-0 m-2">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="✉️電子信箱:example@gmail.com" required>
				<div class="invalid-feedback">請輸入帳號</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="🗝️密碼" required>
				<div class="invalid-feedback">請輸入密碼</div>
			</div>
			<div class="col-10 mx-auto px-0 my-2">
				<button class="col-12 btn btn-secondary" type="submit">註冊</button>
			</div>
		</form>
	</div>
</main>

<%@include file="./include/footer.jsp"%>

<style>
.title {
	padding: calc(20px * 1080/ 1920) 0 calc(5px * 1080/ 1920) 0;
	font-size: calc(4rem * 1080/ 1920);
}

.account {
	display: none;
}

.back {
	display: block;
}

div {
	min-width: 200px;
}

button {
	padding: 12px;
}
</style>

<script type="text/javascript">
	//標題特效
	AOS.init();

	//前端驗證表單
	//Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.querySelectorAll('.needs-validation')
		// Loop over them and prevent submission
		Array.prototype.slice.call(forms).forEach(function(form) {
			form.addEventListener('submit', function(event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}
				form.classList.add('was-validated')
			}, false)
		})
	})()
</script>

<script type="module">

		//Firebase串接
  		// Import the functions you need from the SDKs you need
  		import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
  		// TODO: Add SDKs for Firebase products that you want to use
  		// https://firebase.google.com/docs/web/setup#available-libraries

  		// Your web app's Firebase configuration
  		const firebaseConfig = {
    		apiKey: "AIzaSyA35Qv67zOYy9ipnMIkbfrgg5dJZ1V9z8Q",
    		authDomain: "javaweb-bsr.firebaseapp.com",
    		projectId: "javaweb-bsr",
    		storageBucket: "javaweb-bsr.appspot.com",
    		messagingSenderId: "389626994937",
    		appId: "1:389626994937:web:e6bdac358c76b749c14228"
  		};

  		// Initialize Firebase
  		const app = initializeApp(firebaseConfig);

	</script>