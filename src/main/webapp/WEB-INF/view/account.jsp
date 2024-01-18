<%@page import="com.example.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp"%>

<main class="container-fluid">

	<div class="d-flex flex-wrap align-items-center aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center"> 帳號管理 </span>
		<hr class="gradient_line mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>

	<div class="container-fluid">
		<form class="row m-0 needs-validation" method="post"
			action="./Account" novalidate>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">帳號</label>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">✉️</span> <input
						type="text" class="form-control bg-light" id="account"
						name="account" disabled>
				</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">密碼</label>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">‍🗝️</span>
					<input type="password" class="form-control bg-light" id="key"
						name="key" value="<%out.print(request.getAttribute("key"));%>"
						required>
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">使用者名稱</label>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">🧑🏼‍💻</span>
					<input type="text" class="form-control bg-light" id="user_name"
						name="user_name"
						value="<%out.print(request.getAttribute("user_name"));%>" required>
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">使用者性別</label>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">⚧️</span> <input
						type="text" class="form-control bg-light" id="gender"
						name="gender"
						value="<%out.print(request.getAttribute("gender"));%>" required>
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">出生日期</label>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">🗓️</span> <input
						type="date" class="form-control bg-light" id="birthday"
						name="birthday"
						value="<%out.print(request.getAttribute("birthday"));%>">
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>

			<div class="col-10 mx-auto px-0 my-2">
				<button class="update col-12 btn btn-secondary" type="submit"
					id="update" name="update">修改資料</button>
			</div>
		</form>
		
		<div class="col-10 mx-auto px-0 my-2">
			<button class="delete col-12 btn btn-primary" type="submit"
				id="loginout" name="loginout">登出帳戶</button>
		</div>
		
		<div class="col-10 mx-auto px-0 my-2">
			<button class="delete col-12 btn btn-danger" type="submit"
				id="delete" name="delete" onclick="deleteAccount()">刪除帳戶</button>
		</div>

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
		window.location.href = "./Index";
	}

	function deleteAccount() {
		window.location.href = "./Login";
	}

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
	import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
	import { getAuth, onAuthStateChanged,signOut} from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

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

	const email=document.getElementById("account");
	let user;

	onAuthStateChanged(auth, (user) => {
		if(user) {
    		const uid = user.uid;
        var displayName = user.displayName;
        var email = user.email;
			console.log(user);

			var xhr = new XMLHttpRequest();
        	xhr.open('POST', './Account', true);
        	xhr.setRequestHeader('Content-Type', 'application/json');

        	// 傳送資訊
        	var data = {
            	uid: uid,
            	displayName: displayName,
            	email: email
        	};
        	xhr.send(JSON.stringify(data));
		} else {
  		}
	});

	loginout.addEventListener('click',(e)=>{
		signOut(auth).then(() => {
			window.location.href="./Login";
		}).catch((error) => {
			alert(error);
		});
	});
</script>