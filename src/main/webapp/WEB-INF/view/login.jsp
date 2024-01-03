<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@include file="./include/header.jsp"%>
    
    <main class="container-fluid vw-100">
    
    	<div class="d-flex flex-wrap align-items-center">
			<span class="title vw-100 text-center">
				登入BSR				
			</span>
			<hr class="gradient mx-0 my-2 p-0 aos-init vw-100" data-aos="fade-down">
	    </div>
	    
    	<div class="container-fluid px-0">
    		<form class="row m-0 needs-validation" action="" novalidate>
			  <div class="col-10 mx-auto px-0 m-2">
			    <input type="email" class="form-control" id="user_email" name="user_email" placeholder="✉️電子信箱:example@gmail.com" required>
			    <div class="invalid-feedback">
			      請輸入帳號
			    </div>
			  </div>
			  <div class="col-10 mx-auto px-0 m-2">
			    <input type="password" class="form-control" id="user_password" name="user_password" placeholder="🗝️密碼" required>
			    <div class="invalid-feedback">
			      請輸入密碼
			    </div>
			  </div>
			  <div class="col-10 mx-auto px-0 my-2">
			    <button class="login col-12 btn btn-primary" type="submit">登入</button>
			  </div>
			</form>
			
 			<div class="d-flex flex-wrap justify-content-center my-2">
			    <a class="forgetPassword text-center" href="">忘記密碼</a>
			</div>
			
			<div class="d-flex flex-wrap justify-content-center my-2">
			    <a class="goRegister text-center" href="">註冊</a>
			</div>
			
			<div class="row col-12 d-flex flex-wrap justify-content-center mx-0 my-2">
				<hr class="col-4 p-0 my-2">
				<span class="col-2 p-0 text-center">OR</span>
				<hr class="col-4 p-0 my-2">
			</div>
			
			
			<!-- 快速登入 -->
			
			<div class="col-10 mx-auto px-0 my-3">
				<button type="button" class="googleLogin col-12 btn btn-light">
					<i class="bi bi-google flex-wrap p-0 m-0 align-top"></i>
					<span>用Google帳號登入</span>
				</button>
			</div>
			
			<div class="col-10 mx-auto px-0 my-3">
				<button type="button" class="appleLogin col-12 btn btn-dark">
					<i class="bi bi-apple flex-wrap p-0 m-0 align-top"></i>
					<span>用Apple帳號登入</span>
				</button>
			</div>
			
			<div class="col-10 mx-auto px-0 my-3">
				<button type="button" class="lineLogin col-12 btn btn-success">
					<i class="bi bi-line flex-wrap p-0 m-0 align-top"></i>
					<span>用Line帳號登入</span>
				</button>
			</div>
			<!-- https://www.youtube.com/watch?v=IudOiOwppFA -->
		</div>
    </main>
    
    <%@include file="./include/footer.jsp"%>
    
    <style>
    
    	.title{
    		padding:calc(20px * 1080 / 1920) 0 calc(5px * 1080 / 1920) 0;
    		font-size: calc(4rem * 1080 / 1920);
    	}
    	
	    .account{
			display: none;
		}
		
		.forgetPassword{
    		color: black;
    		text-decoration:none;
    	}
    	
    	.forgetPassword:hover{
    		color: red;
    		text-decoration:underline;
    	}
    	
		.goRegister{
    		color: black;
    		text-decoration:none;
    	}
    	
    	.goRegister:hover{
    		color: blue;
    		text-decoration:underline;
    	}
    	
    	div{
    		min-width: 200px;
    	}
    	
    	button {
			padding: 12px ;
		}
    </style>
    	
    <script>
    
   	//前端驗證表單
   	//Example starter JavaScript for disabling form submissions if there are invalid fields
    (function () {
      // Fetch all the forms we want to apply custom Bootstrap validation styles to
      var forms = document.querySelectorAll('.needs-validation')
      // Loop over them and prevent submission
      Array.prototype.slice.call(forms)
        .forEach(function (form) {
          form.addEventListener('submit', function (event) {
            if (!form.checkValidity()) {
              event.preventDefault()
              event.stopPropagation()
            }
            form.classList.add('was-validated')
          }, false)
        })
    })()
    
    </script>