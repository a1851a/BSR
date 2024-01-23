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
		<form class="row m-0 needs-validation" id="loginForm" method="post" action="./Login" novalidate>
			
			<div class="error text-center text-danger"></div>
			<!-- 錯誤訊息 -->
			<!--  <div class="error text-center text-danger"> </div> -->
			<% if (request.getAttribute("errorMessage") != null) { %>
    			<div class="error text-center text-danger">
        			<%= request.getAttribute("errorMessage") %>
    			</div>
			<% } %>	

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
				<button type="button" class="loginButton col-12 btn btn-secondary" id="login" name="login">登入</button>
			</div>

			<div class="d-flex flex-wrap justify-content-center my-2">
				<a class="forgetPassword text-center" id="forgetPassword" data-bs-toggle="modal" data-bs-target="#staticBackdrop" href="#">忘記密碼</a>
			</div>

			<!-- 提示 -->
			<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">提示框</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	此處只適合自行註冊者
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-primary" onclick="window.location.href='./ForgetPassword'">我知道了</button>
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
			      </div>
			    </div>
			  </div>
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
				<button type="button" class="loginButton googleLogin col-12 btn btn-light"
					id="googleLogin" name="googleLogin">
					<i class="bi bi-google flex-wrap p-0 m-0 align-top"></i> <span>用Google帳號登入</span>
				</button>
			</div>
	
			<div class="col-10 mx-auto px-0 my-2">
				<button type="button" class="loginButton facebookLogin col-12 btn btn-primary"
					id="facebookLogin" name="facebookLogin">
					<i class="bi bi-facebook flex-wrap p-0 m-0 align-top"></i> <span>用Facebook帳號登入</span>
				</button>
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
	//無法顯示信箱

	//串接Firebase
	//新增Firebase身分驗證JS SDK並初始化Firebase身份驗證	
	import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
	//建立 帳號和密碼、Google、Facebook 提供者物件的實例
	import { getAuth,signInWithPopup,sendPasswordResetEmail,
				signInWithEmailAndPassword,
				GoogleAuthProvider,FacebookAuthProvider} from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

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
	
	//建立 Google 提供者物件的實例
	const google_provider = new GoogleAuthProvider();
	//建立 Facebook 提供者物件的實例	
	const facebook_provider = new FacebookAuthProvider();
	
	//避免使用預設帳號
	google_provider.setCustomParameters({
		prompt: "select_account"
	})

	facebook_provider.setCustomParameters({
		prompt: "select_account"
	})

	//使用信箱和密碼登入
	document.getElementById('login').addEventListener('click',(e)=>{
		let email=$('#email').val();
		let password=$('#password').val();

		signInWithEmailAndPassword(auth, email, password)
  			.then((userCredential) => {
    		const user = userCredential.user;
			const userId = user.uid;
    		//console.log(user); 
			sendUserIdToServlet(userId);   	
			//登入後導至帳號管理頁面
			window.location.href="./Index";
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
			}else if(error.code === 'auth/invalid-credential'){
				$(document).ready(function () {
               		$('.error').text('無此帳號或帳密錯誤');
           		});
			}
  		});
	});

	//當google登入按鈕被點擊時
	document.getElementById('googleLogin').addEventListener('click',(e)=>{
		signInWithPopup(auth, google_provider)
  			.then((result) => {
    		const credential = GoogleAuthProvider.credentialFromResult(result);
    		const token = credential.accessToken;
    		const user = result.user;
			const userId = user.uid;
			//console.log(user);
			sendUserIdToServlet(userId);   	
			//登入後導至帳號管理頁面
			window.location.href="./Index";
  		}).catch((error) => {
    		const errorCode = error.code;
    		const errorMessage = error.message;
    		const email = error.email;
    		const credential = GoogleAuthProvider.credentialFromError(error);
  		});
	});

	//當facebook登入按鈕被點擊時
	document.getElementById('facebookLogin').addEventListener('click',(e)=>{
		signInWithPopup(auth, facebook_provider)
  			.then((result) => {
    		const credential = FacebookAuthProvider.credentialFromResult(result);
    		const token = credential.accessToken;
    		const user = result.user;
			const userId = user.uid;
			sendUserIdToServlet(userId);   	
			//console.log(user);
			//登入後導至帳號管理頁面			
			window.location.href="./Index";
  		}).catch((error) => {
    		const errorCode = error.code;
    		const errorMessage = error.message;
    		const email = error.email;
    		const credential = FacebookAuthProvider.credentialFromError(error);
  		});
	});

	function sendUserIdToServlet(userId,email) {
        //使用AJAX傳送UserId至Servlet
        $.ajax({
            type: "POST",
            url: "./Login", 
            data: { userId: userId},
            success: function(response) {
                console.log("UID sent to servlet successfully");
            },
            error: function(error) {
                console.error("Error sending UID to servlet", error);
            }
        });
    }
</script>