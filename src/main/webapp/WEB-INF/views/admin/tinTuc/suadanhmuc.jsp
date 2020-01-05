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
						<li ><a href="/admin/index"> <i
								class="metismenu-icon"></i> QUẢN LÝ BÀI VIẾT
						</a></li>
						<li class="mm-active"><a href="/admin/danhmuc"> <i class="metismenu-icon"> </i>QUẢN
								LÝ DANH MỤC
						</a></li>
						<li><a href="/admin/quangcao"><i class="metismenu-icon"> </i>QUẢN
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
								<li><a style="font-size: 12px" href="/admin/tkphongvien"> <i
										class="metismenu-icon"></i> PHÓNG VIÊN
								</a></li>
								<li><a style="font-size: 12px" href="/admin/tkquangcao"> <i
										class="metismenu-icon"> </i>QUẢNG CÁO
								</a></li>
							</ul></li>
						<li><a href="/admin/tkluotxem"> <i class="metismenu-icon"></i>LƯỢT
								XEM
						</a></li>
						<li><a href="/admin/tkbaiviet"><i class="metismenu-icon"> </i>BÀI
								VIẾT </a></li></li>
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
					<li><a href="/admin/phongvien"> <i class="metismenu-icon"></i>
							QUẢN LÝ PHÓNG VIÊN
					</a></li>
					<li><a href="/admin/nhaquangcao"> <i class="metismenu-icon"></i>
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
					<h3>CẬP NHẬT DANH MỤC</h3>
				</div>
			</div>
		</div>
		<!-- Nội dung -->
		<form method="post">
			<div class="form-group row">
				<label style="font-weight: bold; font-size: 15px" for="inputEmail3" class="col-sm-2 col-form-label">Mã danh mục </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						placeholder="ID" value="${categoriesList.id}" name="id" readonly="readonly">
				</div>
			</div>	
			
			
			<div class="form-group row">
				<label style="font-weight: bold; font-size: 15px" for="inputEmail3" class="col-sm-2 col-form-label">Tên danh mục </label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						placeholder="Name" value="${categoriesList.categoriesName}" name="categoriesName" >
				</div>
			</div>	
			
			<button formaction="/admin/updateCategories" type="submit"
				class="btn btn-outline-primary">CẬP NHẬT</button>
		</form>
		</div>
	</div>
  <!-- Tìm kiếm -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
			<script>
					$(document).ready(function(){
					  $("#myInput").on("keyup", function() {
					    var value = $(this).val().toLowerCase();
					    $("#myTable tr").filter(function() {
					      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
					    });
					  });
					  
					});

					
			</script>