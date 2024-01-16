<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 尿液沉渣 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post"
		action="./Sediment" novalidate>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">尿紅血球</label>
			<input type="range" class="col-12" id="RBC" name="RBC"
				 min="0" max="5" step="1" value="0" required>
			<div>尿紅血球:<span class="RBC_value">0</span>HPF</div>
		</div>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">尿白血球</label>
			<input type="range" class="col-12" id="WBC"
				name="WBC" min="0" max="5" step="1" value="0" required>
			<div>尿白血球<span class="WBC_value">0</span>HPF</div>
		</div>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">上皮細胞</label>
			<input type="range" class="col-12" id="epithelium"
				name="Epithelium" min="0" max="5" step="1" value="0" required>
			<div>上皮細胞<span class="Epithelium_value">0</span>HPF</div>
		</div>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">結晶體</label>
			<div class="row col-12 m-0" required>
				<div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="1" id="crystal" name="crystal" >
			        <label class="form-check-label" for="bilirubin_normal">有</label>
			    </div>
			    <div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="2" id="crystal" name="crystal">
			        <label class="form-check-label" for="bilirubin_abnormal">無</label>
			    </div>
			</div>
			<div class="invalid-feedback">請選擇結晶體</div>
		</div>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">尿圓柱體</label>
			<div class="row col-12 m-0" required>
				<div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="1" id="cast" name="cast" >
			        <label class="form-check-label" for="bilirubin_normal">有</label>
			    </div>
			    <div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="2" id="cast" name="cast">
			        <label class="form-check-label" for="bilirubin_abnormal">無</label>
			    </div>
			</div>
			<div class="invalid-feedback">請選擇尿圓柱體</div>
		</div>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">細菌</label>
			<div class="row col-12 m-0" required>
				<div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="1" id="bacteria" name="bacteria" >
			        <label class="form-check-label" for="bilirubin_normal">有</label>
			    </div>
			    <div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="2" id="bacteria" name="bacteria">
			        <label class="form-check-label" for="bilirubin_abnormal">無</label>
			    </div>
			</div>
			<div class="invalid-feedback">請選擇細菌</div>
		</div>
		
		<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">其他</label>
			<div class="row col-12 m-0" required>
				<div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="1" id="other" name="other" >
			        <label class="form-check-label" for="bilirubin_normal">有</label>
			    </div>
			    <div class="form-check flex-fill col-6">
			        <input class="form-check-input" type="radio" value="2" id="other" name="other">
			        <label class="form-check-label" for="bilirubin_abnormal">無</label>
			    </div>
			</div>
			<div class="invalid-feedback">請選擇其他</div>
		</div>
		
		<div class="col-10 mx-auto px-0 my-2">
			<button class="col-12 btn btn-secondary" id="submit" name="submit"
				type="submit">送出</button>
		</div>
		
	</form>
</div>
<script type="text/javascript">
	$('#RBC').on('input', function() {
	    $('.RBC_value').text($(this).val());
	});
	$('#WBC').on('input', function() {
	    $('.WBC_value').text($(this).val());
	});
	$('#Epithelium').on('input', function() {
	    $('.Epithelium_value').text($(this).val());
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