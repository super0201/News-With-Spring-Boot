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
				class="hamburger hamburger--elastic mobile-toggle-nav"> <span
				class="hamburger-box"> <span class="hamburger-inner"></span>
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
				<li><a href="#"> <i class="metismenu-icon fa fa-user"></i>
						PHÓNG VIÊN <i class="metismenu-state-icon fa fa-caret-down"
						aria-hidden="true"></i>
				</a>
					<ul>
						<li><a href="/phongvien/createnews"> <i class="metismenu-icon"></i>
								THÊM BÀI VIẾT MỚI
						</a></li>
						<li class="mm-active"><a href="/phongvien/thongtin"> <i
								class="metismenu-icon"></i> QUẢN LÝ BÀI VIẾT
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
					<h3>DANH SÁCH BÀI VIẾT</h3>
				</div>
			</div>
		</div>
				<div style="color: darkgreen; font-weight: bold; font-size: 20px;">
							${messageBV1}
						</div>
		<ul
			class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
			<li class="nav-item"><a role="tab" class="nav-link active"
				id="tab-0" data-toggle="tab" href="#tab-content-0"> <span>
						CHƯA DUYỆT</span>
			</a></li>
			<li class="nav-item"><a role="tab" class="nav-link" id="tab-1"
				data-toggle="tab" href="#tab-content-1"> <span> ĐÃ DUYỆT</span>
			</a></li>
		</ul>
		<!-- Nội dung admin -->
		<div>
			<form>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label style="font-weight: bold; font-size: 15px" for="inputEmail4">Tìm kiếm</label> <input type="text"
							class="form-control" id="myInput" placeholder="Nhập nội dung tìm kiếm . . .">
					</div>
				</div>
				<button type="submit" class="btn btn-primary">Tìm kiếm</button>
			</form>
		</div>
		<div class="tab-content">
			<div class="tab-pane tabs-animation fade show active"
				id="tab-content-0" role="tabpanel">

				<!-- table -->
				<div class="mt-2">
					<table class="table table-striped table-dark table-hover">
						<thead>
							<tr style="color: coral">
								<th scope="col">#</th>
								<th scope="col">Tiêu đề</th>
								<th scope="col">Hình ảnh</th>
								<th scope="col">Ngày đăng</th>
								<th scope="col">Thể loại</th>
								<th scope="col">Trạng thái</th>
								<th scope="col">Hành động</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach var="c" items="${list}">
								<tr>
									<th scope="row">${c.id}</th>
									<td style="width: 35%">${c.title}</td>
									<td><img style="width: 120px;"
										src="/static/images/news/${c.imagestitle}" alt=""></td>
									<td>${c.date}</td>
									<td>${c.categories.categoriesName}</td>
									<td>CHƯA DUYỆT</td>
									<td>
										<!-- xem --> <a class="btn btn-outline-primary"
										href="/phongvien/update/${c.id}"><i class="fa fa-wrench"
											aria-hidden="true"></i></a> 
											<!-- xóa -->
										<a class="btn btn-outline-danger" data-toggle="collapse" href="#collapseExample${c.id}x" role="button" aria-expanded="false" aria-controls="collapseExample">
													   <i class="fa fa-trash-o"
														aria-hidden="true"></i>
										</a>
									<div class="collapse" id="collapseExample${c.id}x">
									<div class="card card-body">
										<p style="color: black;">Bạn có chắc chắn muốn xóa bài viết ?</p> 
											<a class="btn btn-outline-danger"
														href="/phongvien/delete/${c.id}" class="fa fa-trash-o"
														aria-hidden="true"> Xóa
											</a>
									</div>
								</div>
										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane tabs-animation fade" id="tab-content-1"
				role="tabpanel">
				<div class="mt-2">
					<table class="table table-striped table-dark table-hover">
						<thead>
							<tr style="color: coral">
								<th scope="col">#</th>
								<th scope="col">Tiêu đề</th>
								<th scope="col">Hình ảnh</th>
								<th scope="col">Ngày đăng</th>
								<th scope="col">Thể loại</th>
								<th scope="col">Trạng thái</th>

							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach var="c" items="${list2}">
								<tr>
									<th scope="row">${c.id}</th>
									<td style="width: 35%">${c.title}</td>
									<td><img style="width: 120px;"
										src="/static/images/news/${c.imagestitle}" alt=""></td>
									<td>${c.date}</td>
									<td>${c.categories.categoriesName}</td>
									<td>ĐÃ DUYỆT</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
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