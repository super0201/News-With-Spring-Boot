<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
				<li><a href="#"> <i class="metismenu-icon fa fa-user"></i>
						NHÀ QUẢNG CÁO <i class="metismenu-state-icon fa fa-caret-down"
						aria-hidden="true"></i>
				</a>
					<ul>
						<li>
						<li class="mm-active"><a href="danhsachquangcao"> <i
								class="metismenu-icon"></i> DANH SÁCH QUẢNG CÁO
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
					<h3>QUẢN LÝ QUẢNG CÁO</h3>
				</div>
			</div>
		</div>
		<div style="color: darkgreen; font-weight: bold; font-size: 20px;">
					${messageDBV}
				</div>
		<ul
			class="body-tabs body-tabs-layout tabs-animated body-tabs-animated nav">
			<li class="nav-item"><a role="tab" class="nav-link active"
				id="tab-0" data-toggle="tab" href="#tab-content-0"> <span>
						ĐÃ DUYỆT</span>
			</a></li>
			<li class="nav-item"><a role="tab" class="nav-link" id="tab-1"
				data-toggle="tab" href="#tab-content-1"> <span> CHƯA
						DUYỆT</span>
			</a></li>
		</ul>
		<div>
			<form>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label style="font-weight: bold; font-size: 15px" for="inputEmail4">Tìm kiếm</label> <input
							id="myInput" type="text" class="form-control"
							placeholder="Nhập nội dung tìm kiếm . . .">
					</div>
				</div>
				<button type="submit" id="myInput" class="btn btn-primary">Tìm
					kiếm</button>
				<a type="submit" class="btn btn-warning float-right"
					href="/nhaquangcao/themquangcao">Thêm mới quảng cáo</a>
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
								<th scope="col">Hình ảnh</th>
								<th scope="col">Tiêu đề quảng cáo</th>
								<th scope="col">Tổng số hiển thị</th>
								<th scope="col">Còn lại</th>
								<th scope="col">Vị trí quảng cáo</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach var="p" items="${list_AdvertisementTrue}">
								<tr>
									<th scope="row">${p.id}</th>
									<td><img style="width: 120px;"
										src="/static/images/news/${p.images}" alt=""></td>
									<td style="width: 30%">${p.title}</td>
									<td>${p.amount} Lần</td>
									<td>${p.display} Lần</td>
									<td>${p.position.positionName}</td>
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
								<th scope="col">Hình ảnh</th>
								<th scope="col">Tiêu đề quảng cáo</th>
								<th scope="col">Tổng số hiển thị</th>
								<th scope="col">Còn lại</th>
								<th scope="col">Vị trí quảng cáo</th>
								<th scope="col">Hành động</th>
							</tr>
						</thead>
						<tbody id="myTable">
							<c:forEach var="p" items="${list_AdvertisementFalse}">
								<tr>
									<th scope="row">${p.id}</th>
									<td><img style="width: 120px;"
										src="/static/images/news/${p.images}" alt=""></td>
									<td style="width: 30%">${p.title}</td>
									<td>${p.amount} Lần</td>
									<td>${p.display} Lần</td>
									<td>${p.position.positionName}</td>
									<td>
									<a class="btn btn-outline-danger" data-toggle="collapse" href="#collapseExample${p.id}x" role="button" aria-expanded="false" aria-controls="collapseExample">
													   <i class="fa fa-trash-o"
														aria-hidden="true"></i>
									</a>
									<div class="collapse" id="collapseExample${p.id}x">
									<div class="card card-body">
										<p style="color: black;">Bạn có chắc chắn muốn xóa quảng cáo ?</p> 
											<a class="btn btn-outline-danger"
														href="/delete/${p.id}" class="fa fa-trash-o"
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