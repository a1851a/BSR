<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp"%>

<main class="container-fluid">

	<div class="d-flex flex-wrap align-items-center aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center"> 註冊BSR </span>
		<hr class="gradient_line mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>

	<div class="container-fluid px-0">
		
		<!-- 錯誤訊息 -->
		<div class="error text-center text-danger"></div>
		
		<form class="row m-0 needs-validation" method="post" action="./Register" novalidate>
			
			<div class="col-10 mx-auto px-0 m-2">
				<input type="email" class="form-control" id="email" name="email" type="email"
					placeholder="✉️電子信箱:example@gmail.com" required>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<input type="password" class="form-control" id="password" type="password"
					name="password" placeholder="🗝️密碼" required>
			</div>
			
			<div class="col-10 mx-auto px-0 my-2">
				<button type="button" class="col-12 btn btn-secondary" id="register" name="register" >註冊</button>
			</div>
			
		</form>
	</div>
</main>

<%@include file="./include/footer.jsp"%>

<style>
div {
	min-width: 200px;
}

button {
	padding: 12px;
}

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
</style>

<script type="text/javascript">
	//標題特效
	AOS.init();

	function goBack() {
		window.location.href = "./Login";
	}

	/*
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
	})()*/
</script>

<script type="module">
	//串接Firebase
	//新增Firebase身分驗證JS SDK並初始化Firebase身份驗證	
	import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
	//建立 Google、Facebook 提供者物件的實例
	import { getAuth,createUserWithEmailAndPassword} from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

	//Firebase配置
	const firebaseConfig = {
		apiKey: "AIzaSyDuXzJ7xLZc1PYj4s7ecE44o3exuH3VHnI",
		authDomain: "javaweb-bsr-4aa8c.firebaseapp.com",
		projectId: "javaweb-bsr-4aa8c",
		storageBucket: "javaweb-bsr-4aa8c.appspot.com",
		messagingSenderId: "34778549875",
		appId: "1:34778549875:web:e472a2f38e8cf1ec656406"
	};

	//初始化Firebase
	const app = initializeApp(firebaseConfig);
	const auth = getAuth();
	auth.languageCode = 'en';

	register.addEventListener('click',(e)=>{
	
		let email = document.getElementById('email').value;
    	let password = document.getElementById('password').value;
	
		createUserWithEmailAndPassword(auth, email, password)
				.then((userCredential) => {
    			const user = userCredential.user;
				window.location.href="./Account";
  			})
  			.catch((error) => {
    			const errorCode = error.code;
    			const errorMessage = error.message;
				if(error.code === 'auth/missing-email'){
					$(document).ready(function () {
                		$('.error').text('請輸入信箱');
            		});
				}else if (error.code === 'auth/invalid-email'){
					$(document).ready(function () {
                		$('.error').text('請輸入正確信箱格式');
            		});           			
        		} else if(error.code === 'auth/email-already-in-use'){
					$(document).ready(function () {
                		$('.error').text('此信箱已註冊過');
            		});
				} else if (error.code === 'auth/user-disabled') {
					$(document).ready(function () {
                		$('.error').text('使用者不能啟使用');
            		});
        		} else if(error.code === 'auth/weak-password'){
					$(document).ready(function () {
                		$('.error').text('密碼至少需要6位數');
            		});			
				}else if(error.code==='auth/missing-password'){
					$(document).ready(function () {
                		$('.error').text('請輸入密碼(大於6位數)');
            		});				
				}
  			});
		});
</script>