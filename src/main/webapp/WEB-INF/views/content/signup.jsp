<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
[id$=errors] {
	color: red;
	font: italic;
}

.aaaaa {
	color: red;
	font: bold
}

.images-anh img {
	width: 120px;
	height: 120px;
}
</style>
<div class="mt-3" style="text-align: center">
	<h2>Đăng ký thành viên</h2>
	<p style="color: red;">${messageDK}</p>
</div>
<!-- Modal body -->

<form:form enctype="multipart/form-data" action="/signup"
	modelAttribute="form">
	<div class="modal-body">
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6">
					<!-- tài khoản -->
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-user-circle" aria-hidden="true"></i></span>
						</div>
						<form:input path="username" class="form-control"
							placeholder="Tài khoản" />
					</div>
					<form:errors path="username" />
				</div>
				<!-- mật khẩu -->
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-key" aria-hidden="true"></i></span>
						</div>
						<form:input path="password" type="password" class="form-control"
							placeholder="Mật khẩu" />
					</div>
					<form:errors path="password" />
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-id-card" aria-hidden="true"></i></span>
						</div>
						<form:input path="fullName" class="form-control"
							placeholder="Họ và tên" />
					</div>
					<form:errors path="fullName" />
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-id-card" aria-hidden="true"></i></span>
						</div>
						<form:input path="dateOfBirth" type="date" class="form-control"
							placeholder="Ngày sinh" />
					</div>
					<form:errors path="dateOfBirth" />
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6">
					<!-- Giới tính -->
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-female" aria-hidden="true"></i><i
								class="fa fa-male" aria-hidden="true"></i></span>
						</div>
						<form:select path="gender" class="form-control">
							<form:option value="1">Nam</form:option>
							<form:option value="0">Nữ</form:option>
						</form:select>

					</div>
				</div>
				<!-- Vai trò -->
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-child"
								aria-hidden="true"></i></span>
						</div>
						<form:select class="form-control" path="role.id">
							<form:option value="3">Nhà quảng cáo</form:option>
							<form:option value="4">Đọc giả</form:option>
						</form:select>
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-12">
					<!-- số điện thoại -->
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-phone-square" aria-hidden="true"></i></span>
						</div>
						<form:input path="phoneNumber" type="number" class="form-control"
							placeholder="Số điện thoại" />
					</div>
					<form:errors path="phoneNumber" />
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-12">
					<div class="form-group" style="float: left;">
						<label for="exampleInputEmail1">Hình đại điện</label> <br> <input
							type="file" name="up_images" onchange="openFile(this)"
							placeholder="Chọn hình ảnh" />
						<form:hidden path="images" />
					</div>
					<div class="images-anh" id="anh"></div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-envelope" aria-hidden="true"></i></span>
						</div>
						<form:input path="email" type="email" class="form-control"
							placeholder="Email" />
						<form:errors path="email" />
					</div>
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" style="width: 50px"><i
								class="fa fa-map-marker" aria-hidden="true"></i></span>
						</div>
						<form:input path="address" class="form-control"
							placeholder="Địa chỉ" />
						<form:errors path="address" />
					</div>
				</div>
			</div>
		</div>
		<div>
			<!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Quên mật khẩu <i class="fa fa-key" aria-hidden="true"></i></button> -->
			<button class="btn btn-success">Đăng ký</button>
		</div>
	</div>
</form:form>
<script>
	var openFile = function(field) {
		var reader = new FileReader();
		reader.onload = function() {
			console.log(reader.result);
			var img = new Image();
			img.onload = function() {
				document.getElementById("anh").appendChild(img);
			}
			img.src = reader.result;
		};
		reader.readAsDataURL(field.files[0]);
	};
</script>