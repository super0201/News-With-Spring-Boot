<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div class="app-sidebar sidebar-shadow bg-asteroid sidebar-text-light">
	<div class="app-header__logo">
		<div class="logo-src"></div>
		<div class="header__pane ml-auto">
			<div>
				<button type="button"
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__menu">
		<span>
			<button type="button"
				class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
				<span class="btn-icon-wrapper"> <i
					class="fa fa-ellipsis-v fa-w-6"></i>
				</span>
			</button>
		</span>
	</div>
	<div class="scrollbar-sidebar ">
		<div class="app-sidebar__inner ">
			<ul class="vertical-nav-menu">
				<!-- logo -->
				<li style="font-size: 20px" class="app-sidebar__heading">QUẢN
					LÝ WEBSITE</li>
				<li><a href="#"> <i
						class="metismenu-icon fa fa-address-card-o"></i> TIN TỨC <i
						class="metismenu-state-icon fa fa-caret-down" aria-hidden="true"></i>
				</a>
					<ul>
						<li><a href="/admin/index"> <i class="metismenu-icon"></i>
								QUẢN LÝ BÀI VIẾT
						</a></li>
						<li><a href="/admin/danhmuc"> <i class="metismenu-icon">
							</i>QUẢN LÝ DANH MỤC
						</a></li>
						<li><a href="/admin/quangcao"><i class="metismenu-icon">
							</i>QUẢN LÝ QUẢNG CÁO </a></li>
					</ul></li>
				<!-- thống kê -->
				<li><a href="#"> <i class="metismenu-icon fa fa-pie-chart"></i>
						THỐNG KÊ <i class="metismenu-state-icon fa fa-caret-down"
						aria-hidden="true"></i>
				</a>
					<ul>
						<li><a href="#"> <i class="metismenu-icon pe-7s-diamond"></i>
								DOANH THU <i class="metismenu-state-icon fa fa-caret-down"
								aria-hidden="true"></i>
						</a>
							<ul>
								<li><a style="font-size: 12px" href="/admin/tkphongvien">
										<i class="metismenu-icon"></i> PHÓNG VIÊN
								</a></li>
								<li><a style="font-size: 12px" href="/admin/tkquangcao">
										<i class="metismenu-icon"> </i>QUẢNG CÁO
								</a></li>
							</ul></li>
						<li><a href="/admin/tkluotxem"> <i class="metismenu-icon"></i>LƯỢT
								XEM
						</a></li>
						<li><a href="/admin/tkbaiviet"><i class="metismenu-icon">
							</i>BÀI VIẾT </a></li></li>
			</ul>

			<!-- quản lý người dùng -->
			<li><a href="#"> <i class="metismenu-icon fa fa-user"></i>
					NGƯỜI DÙNG <i class="metismenu-state-icon fa fa-caret-down"
					aria-hidden="true"></i>
			</a>
				<ul>
					<li><a href="/admin/nguoidung"> <i class="metismenu-icon"></i>
							QUẢN LÝ NGƯỜI DÙNG
					</a></li>
					<li class="mm-active"><a href="/admin/phongvien"> <i
							class="metismenu-icon"></i> QUẢN LÝ PHÓNG VIÊN
					</a></li>
					<li><a href="/admin/nhaquangcao"> <i
							class="metismenu-icon"></i> QUẢN LÝ NHÀ QUẢNG CÁO
					</a></li>
				</ul></li>
			</ul>
		</div>
	</div>
</div>
<div class="app-main__outer">
	<div class="app-main__inner">
		<!-- tiêu đề nội dung admin -->
		<div class="app-page-title" style="height: 80px;">
			<div class="page-title-wrapper">
				<div class="page-title-heading">
					<h3>THÊM MỚI PHÓNG VIÊN</h3>
				</div>
			</div>
		</div>
		<div style="color: darkgreen; font-weight: bold; font-size: 20px;">
			${messageDKPV}
		</div>
		<!-- Nội dung -->
		<div>
			<form:form enctype="multipart/form-data" action="/register_phongvien"
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
									<form:input path="password" type="password"
										class="form-control" placeholder="Mật khẩu" />
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
							<div class="col-sm-6">
								<!-- số điện thoại -->
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" style="width: 50px"><i
											class="fa fa-phone-square" aria-hidden="true"></i></span>
									</div>
									<form:input path="phoneNumber" type="number"
										class="form-control" placeholder="Số điện thoại" />
								</div>
								<form:errors path="phoneNumber" />
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group" style="float: left;">
									<label for="exampleInputEmail1">Hình đại điện</label> <br>
									<input type="file" name="up_images" onchange="openFile(this)"
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
						<button class="btn btn-primary">Thêm mới phóng viên</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
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