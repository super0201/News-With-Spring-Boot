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
						<li class="mm-active"><a href="index"> <i
								class="metismenu-icon"></i> QUẢN LÝ BÀI VIẾT
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
					<li><a href="phongvien"> <i class="metismenu-icon"></i>
							QUẢN LÝ PHÓNG VIÊN
					</a></li>
					<li><a href="nhaquangcao"> <i class="metismenu-icon"></i>
							QUẢN LÝ NHÀ QUẢNG CÁO
						</a>
					</li>
				</ul>
			</li>
		</div>
	</div>
</div>
<div class="app-main__outer">
	<!-- Nội dung -->
	<div class="app-main__inner">
	
		<!-- tiêu đề nội dung admin -->
		<div class="app-page-title" style="height: 80px;">
			<div class="page-title-wrapper">
				<div class="page-title-heading">
					<h3>QUẢN LÝ BÀI VIẾT</h3>
					
				</div>
			</div>
		</div>
		<div style="color: darkgreen; font-weight: bold; font-size: 20px;">
							${messageBV2}
						</div>
						<div style="color: darkgreen; font-weight: bold; font-size: 20px;">
							${messageBV1}
						</div>
		<!-- Nội dung admin -->
		<ul
			class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
			<li class="nav-item"><a role="tab" class="nav-link active"
				id="tab-0" data-toggle="tab" href="#tab-content-0"> <span>BÀI
						VIẾT CHƯA PHÊ DUYỆT</span>
			</a></li>
			<li class="nav-item"><a role="tab" class="nav-link" id="tab-1"
				data-toggle="tab" href="#tab-content-1"> <span>BÀI VIẾT
						ĐÃ ĐƯỢC PHÊ DUYỆT</span>
			</a></li>
		</ul>

		<div class="row">
			<div class="app-main__inner">
				<div class="mt-2">
					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label style="font-weight: bold; font-size: 15px" for="inputEmail4">Tìm kiếm</label> <input id="myInput"
									type="text" class="form-control"
									placeholder="Nhập nội dung tìm kiếm . . .">
							</div>
						</div>
						<button type="submit" class="btn btn-primary">Tìm kiếm</button>
					</form>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<!-- BÀI VIẾT CHƯA ĐƯỢC PHÊ DUYỆT -->
			<div class="tab-pane tabs-animation fade show active"
				id="tab-content-0" role="tabpanel">
				<div class="row">
					<div class="app-main__inner">
						<!-- Nội dung admin -->
						
						<!-- table -->
						<div class="mt-2">
							<table class="table table-striped table-dark table-hover">
								<thead>
									<tr style="color: coral">
										<th scope="col">#</th>
										<th scope="col">Tiêu đề</th>
										<th scope="col">Hình ảnh</th>
										<th scope="col">Tên tác giả</th>
										<th scope="col">Ngày đăng</th>
										<th scope="col">Danh mục</th>
										<th scope="col">Hành động</th>
									</tr>
								</thead>
								<c:forEach var="c" items="${listNECD}">
									<tbody id="myTable">
										<tr>
											<th scope="row">${c.id}</th>
											<td style="width: 30%">${c.title}</td>
											<td><img style="width: 80px; height: 80px;"
												src="/static/images/news/${c.imagestitle}" alt=""></td>
											<td>${c.member.fullName}</td>
											<td style="width: 11%">${c.date}</td>
											<td>${c.categories.categoriesName}</td>
											<td>
												<!-- xem --> 
												<a class="btn btn-outline-success"
												aria-hidden="true" href="/admin/newsEdit/${c.id}"> <i
													class="fa fa-eye" aria-hidden="true"></i>
												</a> 
												<!-- xóa --> 
												<a class="btn btn-outline-danger" data-toggle="collapse" href="#collapseExample${c.id}" role="button" aria-expanded="false" aria-controls="collapseExample">
													   <i class="fa fa-trash-o"
														aria-hidden="true"></i>
												</a>
												<div class="collapse" id="collapseExample${c.id}">
												  <div class="card card-body">
												   <p style="color: black;">Bạn có chắc chắn muốn xóa bài viết ?</p> 
												   <a class="btn btn-outline-danger"
														href="/admin/newsDelete/${c.id}" class="fa fa-trash-o"
														aria-hidden="true"> Xóa
													</a>
												  </div>
												</div>
											</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- BÀI VIẾT ĐÃ ĐƯỢC PHÊ DUYỆT -->
			<div class="tab-pane tabs-animation fade" id="tab-content-1"
				role="tabpanel">
				<div class="row">
					<div class="app-main__inner">
						<!-- Nội dung admin -->
						
						<!-- table -->
						<div class="mt-2">
							<table class="table table-striped table-dark table-hover">
								<thead>
									<tr style="color: coral">
										<th scope="col">#</th>
										<th scope="col">Tiêu đề</th>
										<th scope="col">Hình ảnh</th>
										<th scope="col">Tên tác giả</th>
										<th scope="col">Ngày đăng</th>
										<th scope="col">Danh mục</th>
										<th scope="col">Loại tin</th>
										<th scope="col-2">Hành động</th>
									</tr>
								</thead>
									<tbody id="myTable">
										<c:forEach var="c" items="${listNED}">
										<tr>
											<th scope="row">${c.id}</th>
											<td style="width: 30%">${c.title}</td>
											<td><img style="width: 80px; height: 80px;"
												src="/static/images/news/${c.imagestitle}" alt=""></td>
											<td>${c.member.fullName}</td>
											<td style="width: 11%">${c.date}</td>
											<td>${c.categories.categoriesName}</td>
											<td>${c.type.name}</td>
											<td>
												<p>
													<a style="font-size: 8px" class="btn btn-outline-success"
														data-toggle="collapse" href="#collapseExample${c.id}"
														role="button" aria-expanded="false"
														aria-controls="collapseExample"> <i
														class="fa fa-pencil-square" aria-hidden="true"></i>
													</a>
												</p>
												<div class="collapse" id="collapseExample${c.id}">
													<div class="card card-body">
														<form method="post" enctype="multipart/form-data"
															action="/update">
															<input name="id" type="text" value="${c.id}" hidden>
															<input name="fullname" type="text" value="${c.member.fullName}" hidden>
															<select name="type.id" class="form-control">
																<c:forEach var="o" items="${listType}">
																	<option value="${o.id}">${o.name}</option>
																</c:forEach>
															</select>
															<hr>
															<div>
																<button type="submit" class="btn btn-outline-info">Cập
																	nhật</button>
															</div>
														</form>
													</div>
												</div> 
												<!-- xóa --> 
												<a style="font-size: 8px" class="btn btn-outline-danger" data-toggle="collapse" href="#collapseExample${c.id}x" role="button" aria-expanded="false" aria-controls="collapseExample">
													   <i class="fa fa-trash-o"
														aria-hidden="true"></i>
												</a>
												<div class="collapse" id="collapseExample${c.id}x">
												  <div class="card card-body">
												   <p style="color: black;">Bạn có chắc chắn muốn xóa bài viết ?</p> 
												   <a class="btn btn-outline-danger"
														href="/admin/newsDelete/${c.id}" class="fa fa-trash-o"
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