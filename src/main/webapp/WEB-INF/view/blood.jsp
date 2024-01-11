<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 血液(全血) -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./Blood"
			novalidate>
			<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">白血球</label>
				<input type="number" class="form-control" id="WBC" name="WBC"
					placeholder="uL" min="0" max="100000000" step="1" required>
				<div class="invalid-feedback">請輸入正確白血球</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">紅血球</label>
				<input type="number" class="form-control" id="RBC"
					name="RBC" placeholder="X10^6/uL" min="0" max="10" step="0.1" required>
				<div class="invalid-feedback">請輸入正確紅血球</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">血色素</label>
				<input type="number" class="form-control" id="Hgb"
					name="Hgb" placeholder="g/dL" min="0" max="60" step="0.1" required>
				<div class="invalid-feedback">請輸入正確血色素</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">血球容積比</label>
				<input type="number" class="form-control" id="Hct"
					name="Hct" placeholder="%" min="0" max="80" step="0.1" required>
				<div class="invalid-feedback">請輸入正確血球容積比</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">平均紅血球容積</label>
				<input type="number" class="form-control" id="MCV"
					name="MCV" placeholder="FL" min="0" max="600" step="1" required>
				<div class="invalid-feedback">請輸入正確平均紅血球容積</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">平均紅血球血紅素量</label>
				<input type="number" class="form-control" id="MCH"
					name="MCH" placeholder="pg" min="0" max="600" step="1" required>
				<div class="invalid-feedback">請輸入正確平均紅血球血紅素量</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">平均紅血球血紅素濃度</label>
				<input type="number" class="form-control" id="MCHC"
					name="MCHC" placeholder="g/dL" min="0" max="350" step="1" required>
				<div class="invalid-feedback">請輸入正確平均紅血球血紅素量濃度</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">血小板</label>
				<input type="number" class="form-control" id="PLT"
					name="PLT" placeholder="X10^3/uL" min="0" max="1000" step="1" required>
				<div class="invalid-feedback">請輸入正確血小板</div>
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
	/*(function() {
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