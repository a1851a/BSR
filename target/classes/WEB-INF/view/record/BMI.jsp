<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 質量指數 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./BMI"
			novalidate>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">身高</label>
				<input type="number" class="form-control" id="height" name="height"
					placeholder="公分(cm)" min="0" max="300" step="1" required>
				<div class="invalid-feedback">請輸入正確身高</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">體重</label>
				<input type="number" class="form-control" id="weight"
					name="weight" placeholder="公斤(kg)" min="0" max="700" step="1" required>
				<div class="invalid-feedback">請輸入正確體重</div>
			</div>
			
			<div class="col-10 mx-auto px-0 my-2">
				<button class="col-12 btn btn-secondary" id="submit" name="submit"
					type="submit">送出</button>
			</div>
			
		</form>
</div>

<script type="text/javascript">
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