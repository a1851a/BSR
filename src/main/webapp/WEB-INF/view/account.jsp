<%@page import="com.example.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.ParseException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	// 自訂方法, 將日期格式設定成 yyyy-MM-dd HH:mm:ss E
	private String getDateFormatString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
%>
<%
    User user = (User) request.getAttribute("user");
%>

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
			<% if (request.getAttribute("errorMessage") != null) { %>
    		<div class="error text-center text-danger">
        		<%= request.getAttribute("errorMessage") %>
    		</div>
		<% } %>
		
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">使用者名稱</label>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">🧑🏼‍💻</span>
					<input type="text" class="form-control bg-light" id="name"
						name="name" required
						value="<%if(user != null && user.getName()!=null){out.print(user.getName());}%>" >
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">使用者性別</label>
				<% if (user != null && user.getBirth()!= null) {out.print(": "+user.getGender()); }%>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">⚧️</span> 
					<select class="form-control bg-light" id="gender" name="gender" required>
      					<option value="請選擇" selected disabled>請選擇</option>
					    <option value="男">男</option>
					    <option value="女">女</option>
					    <option value="雙性別">雙性別</option>
					    <option value="不提供">不提供</option> 
    				</select>
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="validationServerUsername" class="form-label">出生日期</label>
				<% if (user != null && user.getBirth()!= null) {out.print(": "+user.getBirth()); }%>
				<div class="input-group">
					<span class="input-group-text" id="inputGroupPrepend3">🗓️</span> <input
						type="date" class="form-control bg-light" id="birthday"
						name="birthday" required
						value="">
					<div class="invalid-feedback">不可為空值</div>
				</div>
			</div>

			<div class="col-10 mx-auto px-0 my-2">
				<button class="update col-12 btn btn-secondary" type="submit"
					id="update" name="update">修改資料</button>
			</div>
		
			<div class="col-10 mx-auto px-0 my-2">
				<button class="delete col-12 btn btn-primary" type="submit"
				id="loginout" name="loginout">登出帳戶</button>
				</div>
		
		<div class="col-10 mx-auto px-0 my-2">
			<button class="delete col-12 btn btn-danger" type="button"
				id="deleteAccount" name="deleteAccount"  data-bs-toggle="modal" data-bs-target="#staticBackdrop">刪除帳戶</button>
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
		      	刪除後無法復原
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" id="sureDelete">我知道了</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">關閉</button>
		      </div>
		    </div>
		  </div>
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
		window.location.href = "./Index";
	}

	function deleteAccount() {
		window.location.href = "./Login";
	}
	
	document.getElementById('birthday').setAttribute('max', new Date().toISOString().split('T')[0]);
	
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
	import { initializeApp } from "https://www.gstatic.com/firebasejs/10.7.1/firebase-app.js";
	import { getAuth, onAuthStateChanged,
				signOut,sendSignInLinkToEmail,deleteUser} from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

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

	let user;
	
	onAuthStateChanged(auth, (user) => {
		if(user) {
    		const uid = user.uid;
        	var displayName = user.displayName;
        	var email = user.email;
			//console.log(user);
			//console.log(user.displayName);
			//不是每一個使用者都會提供信箱(看設定)
			if (user.providerData && user.providerData.length > 0) {
                const userEmail = user.providerData[0].email;    
				//console.log(userEmail);
            }
  		}
	});

	//登出
	document.getElementById('loginout').addEventListener('click',(e)=>{
		signOut(auth).then(() => {
			window.location.href="./RemoveSession";
		}).catch((error) => {
			alert(error);
		});
	});

	//刪除帳號(考量到使用者不一定提供帳號，故不做認證)
	document.getElementById('sureDelete').addEventListener('click', (e) => {    	
		deleteUser(auth.currentUser).then(() => {
			window.location.href="./RemoveSession";
       		// 帳號被刪除
    	}).catch(function(error) {
        	// 有錯誤
       	 	alert(error.message);
    	});
	});
</script>