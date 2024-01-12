<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 血糖 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./BG"
			novalidate>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">空腹血糖</label>
				<input type="number" class="form-control" id="AC" name="AC"
					placeholder="mg/dL" min="0" max="200" step="1" required>
				<div class="invalid-feedback">請輸入正確空腹血糖</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">飯後血糖(2hr)</label>
				<input type="text" class="form-control" id="PC" name="PC"
					placeholder="mg/dL"  pattern="[0,200]*" step="1">
				<div class="invalid-feedback">請輸入正確飯後血糖</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">糖化血色素</label>
				<input type="text" class="form-control" id="HbA1c"
					name="HbA1c" placeholder="%"  pattern="[0,20]*" step="1">
				<div class="invalid-feedback">請輸入正確糖化血色素</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">胰澱粉酶</label>
				<input type="text" class="form-control" id="Amylase"
					name="Amylase" placeholder="U/L" pattern="[0,2000]*" step="1">
				<div class="invalid-feedback">請輸入正確胰澱粉酶</div>
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
