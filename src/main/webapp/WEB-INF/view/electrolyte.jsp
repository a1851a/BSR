<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 電解質 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./Electrolyte"
			novalidate>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">鈉離子</label>
				<input type="text" class="form-control" id="na" name="na"
					placeholder="meq/L"  pattern="[0,160]*" step="1">
				<div class="invalid-feedback">請輸入正確鈉離子</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">鉀離子</label>
				<input type="text" class="form-control" id="k" name="k"
					placeholder="meq/L"  pattern="[0,150]*" step="1">
				<div class="invalid-feedback">請輸入正確鉀離子</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">氯離子</label>
				<input type="text" class="form-control" id="cl" name="cl"
					placeholder="meq/L"  pattern="[0,150]*" step="1">
				<div class="invalid-feedback">請輸入正確氯離子</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">血中鈣</label>
				<input type="number" class="form-control" id="Ca" name="Ca"
					placeholder="mg/dL" min="0" max="50" step="0.1" required>
				<div class="invalid-feedback">請輸入正確血中鈣</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">血中磷</label>
				<input type="number" class="form-control" id="P" name="P"
					placeholder="mg/dL" min="0" max="46300" step="0.1" required>
				<div class="invalid-feedback">請輸入正確血中磷</div>
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
