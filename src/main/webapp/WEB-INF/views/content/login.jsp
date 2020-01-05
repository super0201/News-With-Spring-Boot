<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<br>

<br>
<div class="mt-3" style="text-align: center">
	<h1>ĐĂNG NHẬP</h1>
	<a style="color: red;">${message}</a>
</div>

<br>
<!-- Modal body -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<form:form action="/login" modelAttribute="form" method="post">
	<div class="modal-body">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<!-- tài khoản -->
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-user-circle" aria-hidden="true"></i></span>
						</div>
						<input type="text" class="form-control" name="id"
							placeholder="Tài khoản" required="required">

					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
		<!--  -->
		<div class="form-group">
			<div class="row">
				<!-- mật khẩu -->
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-key" aria-hidden="true"></i></span>
						</div>
						<input type="password" name="password" class="form-control"
							placeholder="Mật khẩu" required="required">
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
		<!--  -->
		
		<!--  -->
		<div class="form-group">
			<div class="row">
			<div class="col-sm-3"></div>
				<div class="modal-footer col-sm-6">
					<!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Quên mật khẩu <i class="fa fa-key" aria-hidden="true"></i></button> -->
					<button class="btn btn-success">Đăng nhập</button>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
</form:form>
<br>
<br>