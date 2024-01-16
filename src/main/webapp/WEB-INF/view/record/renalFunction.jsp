<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 腎臟功能 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./RenalFunction"
			novalidate>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿素氮</label>
				<input type="number" class="form-control" id="BUN" name="BUN"
					placeholder="mg/dL" min="0" max="100" step="0.1" required>
				<div class="invalid-feedback">請輸入正確尿素氮</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">肌酸酐</label>
				<input type="number" class="form-control" id="Cr" name="Cr"
					placeholder="mg/dL" min="0" max="10000" step="0.01" required>
				<div class="invalid-feedback">請輸入正確肌酸酐</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿酸</label>
				<input type="number" class="form-control" id="UA" name="UA"
					placeholder="mg/dL" min="0" max="250" step="0.1" required>
				<div class="invalid-feedback">請輸入正確尿酸</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">微量白蛋白</label>
				<input type="number" class="form-control" id="mAlb" name="mAlb"
					placeholder="mg/L" min="0" max="250" step="0.01" required>
				<div class="invalid-feedback">請輸入正確微量白蛋白</div>
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
