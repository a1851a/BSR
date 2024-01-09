<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 血糖 -->
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./BP"
			novalidate>
			<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">白血球</label>
				<input type="number" class="form-control" id="WBC" name="WBC"
					placeholder="mmHg" min="0" max="300" step="1" required>
				<div class="invalid-feedback">請輸入正確空腹血糖</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">紅血球</label>
				<input type="number" class="form-control" id="RBC"
					name="RBC" placeholder="mmHg" min="0" max="300" step="1" required>
				<div class="invalid-feedback">請輸入正確糖化血色素</div>
			</div>
			<div class="col-10 mx-auto px-0 my-2">
				<button class="col-12 btn btn-secondary" id="login" name="login"
					type="submit">送出</button>
			</div>
		</form>
</div>

<script type="text/javascript">
	
</script>
