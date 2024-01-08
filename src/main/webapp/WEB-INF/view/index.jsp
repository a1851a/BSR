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

<div class="row recode col-12 mx-0 mt-3 vw-100">
	<!-- 左邊menu -->
	<menu class="col-1 m-0 p-0 bg-dark text-light d-flex flex-wrap">
		<ul>
			<a>基本資訊</a>
		</ul>
		<ul>
			<a>血糖</a>
		</ul>
		<ul>
			<a>血脂肪</a>
		</ul>
		<ul>
			<a>腎臟功能</a>
		</ul>
		<ul>
			<a>肝臟功能</a>
		</ul>
		<ul>
			<a>電解質</a>
		</ul>
		<ul>
			<a>血液</a>
		</ul>
		<ul>
			<a>尿液</a>
		</ul>
		<ul>
			<a>尿液沉渣</a>
		</ul>
	</menu>

	<div class="d-flex justify-content-start col-2 col-md-10 p-0">
		<arrow class="p-0 d-flex align-items-center col-1"> <a
			class="rightArrow bg-dark text-light text-center w-auto" href="#">></a>
		<a class="leftArrow bg-dark text-light text-center w-auto" href="#"><</a>
		</arrow>
		<context> Lorem ipsum dolor sit amet,
		consectetur adipiscing elit. Sed ac tortor nec odio tristique euismod.
		Ut in elit vel mauris ultrices ultricies. Vivamus eu ultrices lacus.
		Nunc sagittis consectetur justo vel eleifend. Maecenas volutpat dolor
		at ultricies tristique. Curabitur auctor odio vel sapien pulvinar, ut
		dapibus quam euismod. Nullam euismod lectus vel metus volutpat, vel
		consectetur mauris venenatis. Quisque non augue eu nisl feugiat
		dictum. Integer ac imperdiet odio, eu semper dui. In hac habitasse
		platea dictumst. Maecenas fermentum vel augue eget viverra. Etiam vel
		metus non enim aliquet efficitur. Curabitur et purus a purus finibus
		commodo. Nullam volutpat elit eu felis cursus vestibulum. Sed ac
		tellus ac velit cursus elementum. Fusce bibendum bibendum ligula,
		vitae ultricies nulla interdum ut. Pellentesque habitant morbi
		tristique senectus et netus et malesuada fames ac turpis egestas.
		Proin bibendum felis vel risus malesuada varius. Suspendisse potenti.
		Aliquam erat volutpat. Nam aliquet imperdiet feugiat. Integer id
		tortor nec purus sagittis eleifend. Quisque sed nulla vitae lectus
		feugiat fermentum. Aenean sit amet cursus justo. Duis et rhoncus est,
		vel bibendum elit. Nulla facilisi. Sed euismod sagittis dui, vel
		cursus tellus varius ac. Etiam nec libero sit amet odio accumsan
		gravida vel a odio. Nunc et ipsum nisl. Ut at risus vel purus
		consectetur pharetra non at massa. Vivamus euismod cursus feugiat. Ut
		euismod diam sit amet quam elementum, sit amet euismod elit cursus.
		Curabitur blandit fringilla neque vel aliquet. Nam vel nulla id nunc
		convallis facilisis. Sed suscipit, velit vel ultricies semper, lacus
		ex facilisis arcu, in tristique eros mauris vitae ligula. 
		</context>
	</div>
</div>

<div class="theme_final">abbbb</div>

<%@include file="./include/footer.jsp"%>

<style>
div {
	min-width: 200px;
}

button {
	padding: 12px;
}

menu {
	padding: 0;
	left: -100%;
	position: relative;
	z-index: 9;
	width: auto;
	white-space: nowrap;
	padding: calc(8px * 1080/ 1920) calc(12px * 1080/ 1920)
		calc(8px * 1080/ 1920) calc(12px * 1080/ 1920);
	min-width: 80px;
}

menu ul {
	padding: calc(8px * 1080/ 1920) 0 calc(8px * 1080/ 1920)
		calc(8px * 1080/ 1920);
	margin: 0;
	width: 100%;
}

menu ul a {
	padding: 0;
	margin: 0;
}

context {
	position: relative;
	left: calc(-125px * 1080/ 1920);
	top: 0;
	z-index: 8;
	min-width: 100vw;
	padding-right: calc(100px * 1080/ 1920);
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

.recode {
	min-width: 280px;
	overflow-x: hidden;
}

.rightArrow {
	position: absolute;
	left: 0;
	display: block;
	font-size: calc(4rem * 1080/ 1920);
	border-radius: 0 10px 10px 0;
	text-decoration: none;
	z-index: 99;
}

.leftArrow {
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

	//收合側邊欄位menu
	$(document).ready(function() {
		$(".leftArrow").click(function() {

			$("menu").animate({
				left : "-100%"
			}, 550);

			$(".leftArrow").hide();

			setTimeout(function() {
				$(".rightArrow").show();
			}, 550);
			event.preventDefault();
		});
	});

	//展開側邊欄位menu
	$(document).ready(function() {
		$(".rightArrow").click(function(event) {

			$("menu").animate({
				left : "0"
			}, 500);

			$(".rightArrow").hide();

			setTimeout(function() {
				$(".leftArrow").show();
			}, 550);
			event.preventDefault();
		});
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