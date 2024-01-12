<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 肝臟功能 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./LiverFunction"
			novalidate>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">總膽紅素</label>
				<input type="text" class="form-control" id="d-bit"
					name="d-bit" placeholder="mg/dL" pattern="[0,50]*" step="0.1">
				<div class="invalid-feedback">請輸入正確總膽紅素</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">直接膽紅素</label>
				<input type="text" class="form-control" id="d-bil"
					name="d-bil" placeholder="mg/dL" pattern="[0,10]*" step="0.1">
				<div class="invalid-feedback">請輸入正確直接膽紅素</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">總蛋白</label>
				<input type="number" class="form-control" id="TP" name="TP"
					placeholder="g/dL" min="0" max="80" step="0.1" required>
				<div class="invalid-feedback">請輸入正確總蛋白</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">白蛋白</label>
				<input type="number" class="form-control" id="Alb" name="Alb"
					placeholder="g/dL" min="0" max="70" step="0.1" required>
				<div class="invalid-feedback">請輸入正確白蛋白</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">球蛋白</label>
				<input type="number" class="form-control" id="Glo" name="Glo"
					placeholder="g/dL" min="0" max="50" step="0.1" required>
				<div class="invalid-feedback">請輸入正確球蛋白</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">麩胺酸苯醋酸轉氨基酶</label>
				<input type="number" class="form-control" id="sGOT" name="sGOT"
					placeholder="U/L" min="0" max="700" step="1" required>
				<div class="invalid-feedback">請輸入正確麩胺酸苯醋酸轉氨基酶</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">麩胺酸丙酮酸轉氨酶</label>
				<input type="number" class="form-control" id="sGPT" name="sGPT"
					placeholder="U/L" min="0" max="1000" step="1" required>
				<div class="invalid-feedback">請輸入正確麩胺酸丙酮酸轉氨酶</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">鹼性磷酸酶</label>
				<input type="text" class="form-control" id="alkp"
					name="alkp" placeholder="U/L" pattern="[0,1000000]*" step="1">
				<div class="invalid-feedback">請輸入正確鹼性磷酸酶</div>
			</div>
			
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">酒精性肝炎(脂肪肝)</label>
				<input type="text" class="form-control" id="ald"
					name="ald" placeholder="U/L" pattern="[0,1000000]*" step="1">
				<div class="invalid-feedback">請輸入正確酒精性肝炎</div>
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
