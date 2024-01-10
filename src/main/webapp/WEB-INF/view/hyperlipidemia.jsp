<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 血脂肪 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./Hyperlipidemia"
			novalidate>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">三酸甘油脂</label>
				<input type="number" class="form-control" id="TG" name="TG"
					placeholder="mg/dL" min="0" max="1000" step="1" required>
				<div class="invalid-feedback">請輸入正確三酸甘油脂</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">膽固醇</label>
				<input type="number" class="form-control" id="TC" name="TC"
					placeholder="mg/dL" min="0" max="800" step="1" required>
				<div class="invalid-feedback">請輸入正確膽固醇</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">高密度膽固醇</label>
				<input type="number" class="form-control" id="HDL" name="HDL"
					placeholder="mg/dL" min="0" max="1000" step="1" required>
				<div class="invalid-feedback">請輸入正確高密度膽固醇</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">低密度膽固醇</label>
				<input type="number" class="form-control" id="LDL" name="LDL"
					placeholder="mg/dL" min="0" max="1000" step="1" required>
				<div class="invalid-feedback">請輸入正確低密度膽固醇</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">極低密度膽固醇</label>
				<input type="text" class="form-control" id="vldl"
					name="vldl" placeholder="mg/dL" pattern="[0,1000]*" step="1">
				<div class="invalid-feedback">請輸入正確極低密度膽固醇</div>
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
