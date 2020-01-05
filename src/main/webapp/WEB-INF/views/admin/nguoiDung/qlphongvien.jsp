<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
						<li><a href="index"> <i class="metismenu-icon"></i> QUẢN
								LÝ BÀI VIẾT
						</a></li>
						<li><a href="danhmuc"> <i class="metismenu-icon"> </i>QUẢN
								LÝ DANH MỤC
						</a></li>
						<li><a href="quangcao"><i class="metismenu-icon"> </i>QUẢN
								LÝ QUẢNG CÁO </a></li>
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
								<li><a style="font-size: 12px" href="tkphongvien"> <i
										class="metismenu-icon"></i> PHÓNG VIÊN
								</a></li>
								<li><a style="font-size: 12px" href="tkquangcao"> <i
										class="metismenu-icon"> </i>QUẢNG CÁO
								</a></li>
							</ul></li>
						<li><a href="tkluotxem"> <i class="metismenu-icon"></i>LƯỢT
								XEM
						</a></li>
						<li><a href="tkbaiviet"><i class="metismenu-icon"> </i>BÀI
								VIẾT </a></li></li>
			</ul>

			<!-- quản lý người dùng -->
			<li><a href="#"> <i class="metismenu-icon fa fa-user"></i>
					NGƯỜI DÙNG <i class="metismenu-state-icon fa fa-caret-down"
					aria-hidden="true"></i>
			</a>
				<ul>
					<li><a href="nguoidung"> <i class="metismenu-icon"></i>
							QUẢN LÝ NGƯỜI DÙNG
					</a></li>
					<li class="mm-active"><a href="phongvien"> <i
							class="metismenu-icon"></i> QUẢN LÝ PHÓNG VIÊN
					</a></li>
					<li><a href="nhaquangcao"> <i class="metismenu-icon"></i>
							QUẢN LÝ NHÀ QUẢNG CÁO
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
					<h3>DANH SÁCH THÔNG TIN PHÓNG VIÊN</h3>
				</div>
			</div>
		</div>
		<!-- Nội dung admin -->
		<div>
			<form>
				<div class="form-row">

					<div class="form-group col-md-6">
						<label style="font-weight: bold; font-size: 15px"
							for="inputEmail4">Tìm kiếm</label> <input class="form-control"
							id="myInput" type="text"
							placeholder="Nhập nội dung tìm kiếm . . .">
					</div>
				</div>
				<div style="float: left; margin-bottom: 3px">
					<button type="submit" class="btn btn-primary">Tìm kiếm</button>
				</div>
				<div style="float: right; margin-bottom: 3px">
					<a href="/admin/registerpv" class="btn btn-success">Thêm mới
						phóng viên</a>
				</div>
			</form>

		</div>
		<!-- table -->
		<div class="mt-2">
			<table class="table table-striped table-dark table-hover">
				<thead>
					<tr style="color: coral">
						<th scope="col">Tên phóng viên</th>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Ngày sinh</th>
						<th scope="col">Giới tính</th>
						<th scope="col">Email</th>
						<th scope="col">Số điện thoại</th>
						<th scope="col">Địa chỉ</th>
					</tr>
				</thead>
				<c:forEach var="c" items="${listPV}">
					<tbody id="myTable">
						<tr>
							<td>${c.fullName}</td>
							<td><img width="40" height="40" class=""
								src="/static/images/news/${c.images}" alt=""></td>
							<td>${c.dateOfBirth}</td>
							<td>${c.gender == true ? 'Nam' : 'Nữ'}</td>
							<td>${c.email}</td>
							<td>0${c.phoneNumber}</td>
							<td>${c.address}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
<!-- Tìm kiếm -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>