<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container-fluid">
	<form class="row m-0 needs-validation" method="post" action="./BP"
			novalidate>
			<div class="col-10 mx-auto px-0 m-2">
			<label for="exampleFormControlInput1" class="form-label">收縮壓</label>
				<input type="number" class="form-control" id="SBP" name="SBP"
					placeholder="mmHg" min="0" max="300" step="1" required>
				<div class="invalid-feedback">請輸入正確收縮壓</div>
			</div>
			<div class="col-10 mx-auto px-0 m-2">
				<label for="exampleFormControlInput1" class="form-label">舒張壓</label>
				<input type="number" class="form-control" id="DBP"
					name="DBP" placeholder="mmHg" min="0" max="300" step="1" required>
				<div class="invalid-feedback">請輸入正確舒張壓</div>
			</div>
			<div class="col-10 mx-auto px-0 my-2">
				<button class="col-12 btn btn-secondary" id="login" name="login"
					type="submit">送出</button>
			</div>
		</form>
</div>