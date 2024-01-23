<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="module" src="FirebaseConfig.js"></script>
<%@include file="./include/header.jsp"%>

<div class="theme_first container-fluid">
	<div class="d-flex flex-wrap align-items-center aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center">紀錄</span>
		<hr class="gradient_line mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>
</div>

<recode class="row col-3 mx-0 vw-100">
	<!-- 左邊record_menu -->
	<record_menu class="col-1 m-0 p-0 bg-dark text-light d-flex flex-wrap">
		<ul>
			<a href="./BasicInformation" class="active">基本資訊</a>
		</ul>
		<ul>
			<a href="./BP">血壓</a>
		</ul>
		<ul>
			<a href="./BG">血糖</a>
		</ul>
		<ul>
			<a href="./Hyperlipidemia">血脂肪</a>
		</ul>
		<ul>
			<a href="./RenalFunction">腎臟功能</a>
		</ul>
		<ul>
			<a href="./LiverFunction">肝臟功能</a>
		</ul>
		<ul>
			<a href="./Electrolyte">電解質</a>
		</ul>
		<ul>
			<a href="./Blood">血液</a>
		</ul>
		<ul>
			<a href="./Urine">尿液</a>
		</ul>
		<ul>
			<a href="./Sediment">尿液沉渣</a>
		</ul>
	</record_menu>

	<span class="d-flex justify-content-start col-2 col-md-10 p-0">
		<arrow class="p-0 d-flex align-items-center col-1"> 
			<a class="record_rightArrow bg-dark text-light text-center w-auto" href="#">></a>
			<a class="record_leftArrow bg-dark text-light text-center w-auto" href="#"><</a>
		</arrow>
		<record_context class="d-flex align-items-center"></record_context>
	</span>
</recode>

<!-- 紀錄資料 -->
<div class="container-fluid">
	<div class="d-flex flex-wrap align-items-start aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center">紀錄資料</span>
		<hr class="gradient_line mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>
</div>

<data class="row col-3 mx-0 vw-100">
	<!-- 左邊menu -->
	<data_menu class="col-1 m-0 p-0 bg-dark text-light d-flex flex-wrap">
		<ul>
			<a href="./BasicInformationData" class="active">基本資訊</a>
		</ul>
		<ul>
			<a href="./BPData">血壓</a>
		</ul>
		<ul>
			<a href="./BGData">血糖</a>
		</ul>
		<ul>
			<a href="./HyperlipidemiaData">血脂肪</a>
		</ul>
		<ul>
			<a href="./RenalFunctionData">腎臟功能</a>
		</ul>
		<ul>
			<a href="./LiverFunctionData">肝臟功能</a>
		</ul>
		<ul>
			<a href="./ElectrolyteData">電解質</a>
		</ul>
		<ul>
			<a href="./BloodData">血液</a>
		</ul>
		<ul>
			<a href="./UrineData">尿液</a>
		</ul>
		<ul>
			<a href="./SedimentData">尿液沉渣</a>
		</ul>
	</data_menu>

	<span class="d-flex justify-content-start col-2 col-md-10 p-0">
		<arrow class="p-0 d-flex align-items-center col-1"> 
			<a class="data_rightArrow bg-dark text-light text-center w-auto" href="#">></a>
			<a class="data_leftArrow bg-dark text-light text-center w-auto" href="#"><</a>
		</arrow>
		<data_context class="d-flex align-items-center"></data_context>
	</span>
</data>

<!-- 健康資訊 -->	
<div class="theme_final container-fluid">
	<div class="d-flex flex-wrap align-items-start aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center">健康資訊</span>
		<hr class="gradient_line mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>
</div>

<div class="information container-fluid d-flex  flex-wrap">

	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </v>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
	
	<div class="card" >
	  <img src="..." class="card-img-top" alt="無法顯示">
	  <card class="card-body">
	    <h5 class="card-title">Card title</h5>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </card>
	</div>
</div>
<%@include file="./include/footer.jsp"%>

<style>
div {
	min-width: 200px;
}

button {
	padding: 12px;
}

recode {
	min-width: 280px;
	overflow-x: hidden;
	padding-bottom: calc(30px * 1080/ 1920);
}

record_menu {
	padding: 0;
	left: -100%;
	position: relative;
	z-index: 9;
	width: auto;
	white-space: nowrap;
	padding: calc(8px * 1080/ 1920) calc(12px * 1080/ 1920)
		calc(8px * 1080/ 1920) calc(12px * 1080/ 1920);
	min-width: 100px;
}

record_menu ul {
	padding: calc(8px * 1080/ 1920) 0 calc(8px * 1080/ 1920) 0;
	margin: 0;
	width: 100%;
}

record_menu ul a {
	display:flex;
	padding: 0;
	margin: 0;
	width:100%;
	text-decoration: none;
	color: white;
	padding-left: calc(8px * 1080/ 1920);
}

record_menu ul a:hover,a.active {
	background-color:white;
	color: black;
}

record_context {
	position: relative;
	left: calc(-150px * 1080/ 1920);
	top: 0;
	z-index: 8;
	min-width: 100vw;
	padding-right: calc(80px * 1080/ 1920);
}

data {
	min-width: 280px;
	overflow-x: hidden;
	padding-bottom: calc(30px * 1080/ 1920);
}

data_menu {
	padding: 0;
	left: -100%;
	position: relative;
	z-index: 9;
	width: auto;
	white-space: nowrap;
	padding: calc(8px * 1080/ 1920) calc(12px * 1080/ 1920)
		calc(8px * 1080/ 1920) calc(12px * 1080/ 1920);
	min-width: 100px;
}

data_menu ul {
	padding: calc(8px * 1080/ 1920) 0 calc(8px * 1080/ 1920) 0;
	margin: 0;
	width: 100%;
}

data_menu ul a {
	display:flex;
	padding: 0;
	margin: 0;
	width:100%;
	text-decoration: none;
	color: white;
	padding-left: calc(8px * 1080/ 1920);
}

data_menu ul a:hover,a.active {
	background-color:white;
	color: black;
}

data_context {
	position: relative;
	left: calc(-150px * 1080/ 1920);
	top: 0;
	z-index: 8;
	min-width: 100vw;
	padding-right: calc(80px * 1080/ 1920);
}

arrow {
	max-width: 21px;
}

.theme_first {
	padding-top: calc(90px * 1080/ 1920);
	font-size: calc(2rem * 1080/ 1920);
}

.title {
	padding: calc(20px * 1080/ 1920) 0 0 0;
	font-size: calc(4rem * 1080/ 1920);
}

.record_rightArrow {
	position: absolute;
	left: 0;
	display: block;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.record_leftArrow {
	position: absolute;
	display: none;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.data_rightArrow {
	position: absolute;
	left: 0;
	display: block;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.data_leftArrow {
	position: absolute;
	display: none;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.theme_final {
	padding-bottom: calc(30px * 1080/ 1920);
}

.information{
	padding-bottom: calc(120px * 1080/ 1920);
	font-size: calc(2rem * 1080/ 1920);
}

.card{
	display:flex;
	width:96%;
	margin: 2%;
}

@media(min-width:650px){
	.card{
		display:flex;
		width:23%;
		margin: 1%; 
	}
	
}

.micrify{
    transform: scale(0.9);
    opacity: 0.2;
    animation-duration: 2s;
}

.enlarge {
    transform: scale(1.1);
    box-shadow: 0 0 5px 1.5px yellow;
    animation-duration: 2s;
}
</style>

<script type="text/javascript">
	//標題特效
	AOS.init();

	//紀錄部分
	//收合側邊欄位record_menu
	$(document).ready(function() {
		$(".record_leftArrow").click(function() {

			$("record_menu").animate({
				left : "-100%"
			}, 500);

			$(".record_leftArrow").hide();

			setTimeout(function() {
				$(".record_rightArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//展開側邊欄位record_menu
	$(document).ready(function() {
		$(".record_rightArrow").click(function(event) {

			$("record_menu").animate({
				left : "0"
			}, 500);

			$(".record_rightArrow").hide();

			setTimeout(function() {
				$(".record_leftArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//預設為基本資訊頁面
	$('record_context').load('./BasicInformation');

	//點擊側邊收合選單切換頁面
	$('record_menu ul a').on('click', function (e) {
		//避免直接跳轉頁面
	    e.preventDefault();
	    $('record_menu ul a').removeClass('active');
	    $(this).addClass('active');
	  	
	    //收合側邊欄位menu(未用function:leftarray未於一開始設置，故須點擊兩次)
		$("record_menu").animate({
			left : "-100%"
		}, 500);
		$(".record_leftArrow").hide();
		setTimeout(function() {
			$(".record_rightArrow").show();
		}, 550);
	    
	    let page = $(this).attr('href');
	    $('record_context').load('./' + page);
	});

	//紀錄資料部分
	//收合側邊欄位data_menu
	$(document).ready(function() {
		$(".data_leftArrow").click(function() {

			$("data_menu").animate({
				left : "-100%"
			}, 500);

			$(".data_leftArrow").hide();

			setTimeout(function() {
				$(".data_rightArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//展開側邊欄位record_menu
	$(document).ready(function() {
		$(".data_rightArrow").click(function(event) {

			$("data_menu").animate({
				left : "0"
			}, 500);

			$(".data_rightArrow").hide();

			setTimeout(function() {
				$(".data_leftArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//預設為基本資訊頁面
	$('data_context').load('./BasicInformationData');

	//點擊側邊收合選單切換頁面
	$('data_menu ul a').on('click', function (e) {
		//避免直接跳轉頁面
	    e.preventDefault();
	    $('data_menu ul a').removeClass('active');
	    $(this).addClass('active');
	  	
	    //收合側邊欄位menu(未用function:leftarray未於一開始設置，故須點擊兩次)
		$("data_menu").animate({
			left : "-100%"
		}, 500);
		$(".data_leftArrow").hide();
		setTimeout(function() {
			$(".data_rightArrow").show();
		}, 550);
	    
	    let page = $(this).attr('href');
	    $('data_context').load('./' + page);
	});
	
	 //健康資訊
    $('.card').hover(
        function () {
            $('.card').not(this).addClass('micrify');
            $(this).addClass('enlarge');
        },
        function () {
            $('.card').removeClass('micrify').removeClass('enlarge');
        }
    );
	 
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
	import { getAuth, onAuthStateChanged} from "https://www.gstatic.com/firebasejs/10.7.1/firebase-auth.js";

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
    		const userId = user.uid;
        	var displayName = user.displayName;
			console.log(user);
		}
	});

</script>