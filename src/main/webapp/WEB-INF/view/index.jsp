<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./include/header.jsp"%>

<div class="theme_first container-fluid">
	<div class="d-flex flex-wrap align-items-center aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center">紀錄</span>
		<hr class="gradient mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>
</div>

<recode class="row col-3 mx-0 vw-100">
	<!-- 左邊record_menu -->
	<record_menu class="col-1 m-0 p-0 bg-dark text-light d-flex flex-wrap">
		<ul>
			<a href="./BMI" class="active">質量指數</a>
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
		<hr class="gradient mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>
</div>

<history class="row col-3 mx-0 vw-100">
	<!-- 左邊menu -->
	<history_menu class="col-1 m-0 p-0 bg-dark text-light d-flex flex-wrap">
		<ul>
			<a href="./" class="active">質量指數</a>
		</ul>
		<ul>
			<a href="javascript:;">血壓</a>
		</ul>
		<ul>
			<a href="javascript:;">血糖</a>
		</ul>
		<ul>
			<a href="javascript:;">血脂肪</a>
		</ul>
		<ul>
			<a href="javascript:;">腎臟功能</a>
		</ul>
		<ul>
			<a href="javascript:;">肝臟功能</a>
		</ul>
		<ul>
			<a href="javascript:;">電解質</a>
		</ul>
		<ul>
			<a href="javascript:;">血液</a>
		</ul>
		<ul>
			<a href="javascript:;">尿液</a>
		</ul>
		<ul>
			<a href="javascript:;">尿液沉渣</a>
		</ul>
	</history_menu>

	<span class="d-flex justify-content-start col-2 col-md-10 p-0">
		<arrow class="p-0 d-flex align-items-center col-1"> 
			<a class="history_rightArrow bg-dark text-light text-center w-auto" href="#">></a>
			<a class="history_leftArrow bg-dark text-light text-center w-auto" href="#"><</a>
		</arrow>
		<history_context class="d-flex align-items-center"></history_context>
	</span>
</history>
	
<div class="theme_final container-fluid">
	<div class="d-flex flex-wrap align-items-start aos-init"
		data-aos="fade-down">
		<span class="title vw-100 text-center">檢康資訊</span>
		<hr class="gradient mx-0 my-2 p-0 aos-init vw-100"
			data-aos="fade-down">
	</div>
</div>

<span class="d-flex justify-content-start col-2 col-md-10 p-0">
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.		
</span>

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

history {
	min-width: 280px;
	overflow-x: hidden;
}

history_menu {
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

history_menu ul {
	padding: calc(8px * 1080/ 1920) 0 calc(8px * 1080/ 1920) 0;
	margin: 0;
	width: 100%;
}

history_menu ul a {
	display:flex;
	padding: 0;
	margin: 0;
	width:100%;
	text-decoration: none;
	color: white;
	padding-left: calc(8px * 1080/ 1920);
}

history_menu ul a:hover,a.active {
	background-color:white;
	color: black;
}

history_context {
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

.history_rightArrow {
	position: absolute;
	left: 0;
	display: block;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.history_leftArrow {
	position: absolute;
	display: none;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.theme_final {
	padding-bottom: calc(80px * 1080/ 1920);
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
	$('record_context').load('./BMI');

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
	//收合側邊欄位history_menu
	$(document).ready(function() {
		$(".history_leftArrow").click(function() {

			$("history_menu").animate({
				left : "-100%"
			}, 500);

			$(".history_leftArrow").hide();

			setTimeout(function() {
				$(".history_rightArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//展開側邊欄位record_menu
	$(document).ready(function() {
		$(".history_rightArrow").click(function(event) {

			$("history_menu").animate({
				left : "0"
			}, 500);

			$(".history_rightArrow").hide();

			setTimeout(function() {
				$(".history_leftArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//預設為基本資訊頁面
	$('history_context').load('./BMI');

	//點擊側邊收合選單切換頁面
	$('history_menu ul a').on('click', function (e) {
		//避免直接跳轉頁面
	    e.preventDefault();
	    $('history_menu ul a').removeClass('active');
	    $(this).addClass('active');
	  	
	    //收合側邊欄位menu(未用function:leftarray未於一開始設置，故須點擊兩次)
		$("history_menu").animate({
			left : "-100%"
		}, 500);
		$(".history_leftArrow").hide();
		setTimeout(function() {
			$(".history_rightArrow").show();
		}, 550);
	    
	    let page = $(this).attr('href');
	    $('history_context').load('./' + page);
	});
	
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