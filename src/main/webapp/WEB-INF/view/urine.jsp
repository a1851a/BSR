<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 尿液 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./Urine"
			novalidate>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">外觀</label>
				<select class="form-select" id="appearance" name="appearance" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">深黃色</option>
			      <option value="2">無色</option>
			      <option value="3">紅色</option>
			      <option value="4">綠色</option>
			  	</select>
			  	<div class="invalid-feedback">請選擇外觀</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">酸鹼反應</label>
				<input type="number" class="form-control" id="PH"
					name="PH" min="0" max="14" step="0.1" required>
				<div class="invalid-feedback">請輸入正確酸鹼反應</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿白血球</label>
				<select class="form-select" id="leukocytes" name="leukocytes" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇尿血白球</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿糖</label>
				<select class="form-select" id="glucose " name="glucose" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇尿糖</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿蛋白</label>
				<select class="form-select" id="protein" name="protein" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇尿蛋白</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿膽紅素</label>
				<select class="form-select" id="bilirubin" name="bilirubin" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇尿膽紅素</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿膽素元</label>
				<div class="row col-12 m-0" required>
					<div class="form-check flex-fill col-6">
				        <input class="form-check-input" type="radio" value="1" id="urobilirubin" name="urobilirubin" >
				        <label class="form-check-label" for="bilirubin_normal">正常(normal)</label>
				    </div>
				    <div class="form-check flex-fill col-6">
				        <input class="form-check-input" type="radio" value="2" id="urobilirubin" name="urobilirubin">
				        <label class="form-check-label" for="bilirubin_abnormal">異常(abnormal)</label>
				    </div>
				</div>
				<div class="invalid-feedback">請輸入選擇尿膽素元</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">尿丙酮體</label>
				<select class="form-select" id="ketones" name="ketones" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇尿丙酮體</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">潛血反應</label>
				<select class="form-select" id="occult_blood" name="occult_blood" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇潛血反應</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">比重</label>
				<input type="number" class="form-control" id="spccific_gravity"
					name="spccific_gravity" min="0" max="2" step="0.1" required>
				<div class="invalid-feedback">請輸入正確比重</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">亞硝酸鹽</label>
				<select class="form-select" id="nitrite" name="nitrite" required>
			      <option value="" disabled selected>請選擇檢驗結果</option>
			      <option value="1">-</option>
			      <option value="2">+</option>
			      <option value="3">++</option>
			      <option value="4">+++</option>
			      <option value="5">++++</option>
			  	</select>
				<div class="invalid-feedback">請輸入選擇亞硝酸鹽</div>
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