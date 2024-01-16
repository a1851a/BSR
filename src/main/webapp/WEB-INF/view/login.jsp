<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String loginError=(String)request.getAttribute("loginError");
%>

<%@include file="./include/header.jsp"%>

<main class="container-fluid">

	<div class="d-flex flex-wrap align-items-center aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center"> 登入BSR </span>
		<hr class="gradient_line mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>

	<div class="container-fluid">
		<form class="row m-0 needs-validation" method="post" action="./Login"
			novalidate>
			<%
	    	  	if(loginError != null) {
	    	  		out.print("<p class='text-center text-danger fw-bold'>"+loginError+"</p>");
	    	  	}
	    	 %>
	    	 
			<div class="col-10 mx-auto px-0 m-2">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="✉️電子信箱:example@gmail.com" required>
				<div class="invalid-feedback">請輸入正確帳號</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="🗝️密碼" required>
				<div class="invalid-feedback">請輸入密碼</div>
			</div>
			
			<div class="col-10 mx-auto px-0 my-2">
				<button class="col-12 btn btn-secondary" id="login" name="login"
					type="submit">登入</button>
			</div>
			
			<div class="d-flex flex-wrap justify-content-center my-2">
			<a class="forgetPassword text-center" href="#">忘記密碼</a>
		</div>

			<div class="d-flex flex-wrap justify-content-center my-2">
				<a class="goRegister text-center" href="./Register">註冊</a>
			</div>
	
			<div
				class="row col-12 d-flex flex-wrap justify-content-center align-items-center mx-0 my-2">
				<hr class="separation_line_left col-4 p-0 my-2">
				<span class="col-2 p-0 text-center">OR</span>
				<hr class="separation_line_right col-4 p-0 my-2">
			</div>
	
			<!-- 快速登入 -->
	
			<div class="col-10 mx-auto px-0 my-2">
				<button type="button" class="googleLogin col-12 btn btn-light"
					id="googleLogin" name="googleLogin">
					<i class="bi bi-google flex-wrap p-0 m-0 align-top"></i> <span>用Google帳號登入</span>
				</button>
			</div>
	
			<div class="col-10 mx-auto px-0 my-2">
				<button type="button" class="facebookLogin col-12 btn btn-primary"
					id="facebookLogin" name="facebookLogin">
					<i class="bi bi-facebook flex-wrap p-0 m-0 align-top"></i> <span>用Facebook帳號登入</span>
				</button>
			</div>
				
			<div class="col-10 mx-auto px-0 my-2">
				<button type="button" class="lineLogin col-12 btn btn-success"
					id="lineLogin" name="lineLogin">
					<i class="bi bi-line flex-wrap p-0 m-0 align-top"></i> <span>用Line帳號登入</span>
				</button>
			</div>
			
		</form>

		

		<!-- line login 
				Channel Id:
				Channel secret:
				https://castion2293.medium.com/line-login-%E4%BD%BF%E7%94%A8php%E5%AF%A6%E4%BD%9C-32d539e6ecc6
				https://github.com/line/line-api-use-case-line-login/blob/main/docs/en/liff-channel-create.md
		-->
		
		
		<!-- https://www.youtube.com/watch?v=IudOiOwppFA -->
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

hr:not([size]) {
	height: 1px;
}

.title {
	padding: calc(20px * 1080/ 1920) 0 calc(5px * 1080/ 1920) 0;
	font-size: calc(4rem * 1080/ 1920);
}

.account {
	display: none;
}

.forgetPassword {
	color: black;
	text-decoration: none;
}

.forgetPassword:hover {
	color: red;
	text-decoration: underline;
}

.goRegister {
	color: black;
	text-decoration: none;
}

.goRegister:hover {
	color: blue;
	text-decoration: underline;
}

.separation_line_left {
	border: 0;
	background: linear-gradient(to right, #9D9D9D, #8E8E8E, #000000);
}

.separation_line_right {
	border: 0;
	background: linear-gradient(to right, #000000, #8E8E8E, #9D9D9D);
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
	//串接Firebase
	//新增Firebase身分驗證JS SDK並初始化Firebase身份驗證	
	import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
	//建立 Google、Facebook 提供者物件的實例
	import { getAuth,signInWithPopup,
				GoogleAuthProvider,FacebookAuthProvider,
				setPersistence,browserSessionPersistence,
				inMemoryPersistence} from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

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
	const auth = getAuth(app);
	auth.languageCode = 'en';
	
	//建立 Google 提供者物件的實例
	const google_provider = new GoogleAuthProvider(app);
	//建立 Facebook 提供者物件的實例	
	const facebook_provider = new FacebookAuthProvider();
	
	//當google登入按鈕被點擊時
	googleLogin.addEventListener('click',(e)=>{
		signInWithPopup(auth, google_provider)
  			.then((result) => {
    		const credential = GoogleAuthProvider.credentialFromResult(result);
    		const token = credential.accessToken;
    		const user = result.user;
			//alert(user.displayName);
			//alert(user.email);
			console.log(user);
			//window.location.href="./Account";
  		}).catch((error) => {
    		const errorCode = error.code;
    		const errorMessage = error.message;
    		const email = error.customData.email;
    		const credential = GoogleAuthProvider.credentialFromError(error);
			//alert(errorMessage);
  		});
	});

setPersistence(auth, inMemoryPersistence)
  .then(() => {
    const provider = new GoogleAuthProvider();
   return signInWithRedirect(auth, provider);
  })
  .catch((error) => {
    const errorCode = error.code;
    const errorMessage = error.message;
  });


	//當facebook登入按鈕被點擊時
	facebookLogin.addEventListener('click',(e)=>{
		signInWithPopup(auth, facebook_provider)
  			.then((result) => {
    		const credential = FacebookAuthProvider.credentialFromResult(result);
    		const token = credential.accessToken;
    		const user = result.user;
			//alert(user.displayName);
			//alert(user.email);
			console.log(user);
			//window.location.href="./Account";
  		}).catch((error) => {
    		const errorCode = error.code;
    		const errorMessage = error.message;
    		const email = error.customData.email;
    		const credential = FacebookAuthProvider.credentialFromError(error);
			//alert(errorMessage); 
  		});
	});

	
</script>