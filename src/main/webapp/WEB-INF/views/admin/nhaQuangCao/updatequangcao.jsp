<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
<!--
	.images-anh img {
		width: 50%;
	}
-->
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
				<li><a href="#"> <i class="metismenu-icon fa fa-user"></i>
						NHÀ QUẢNG CÁO <i class="metismenu-state-icon fa fa-caret-down"
						aria-hidden="true"></i>
				</a>
					<ul>
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
					<h3>CẬP NHẬT QUẢNG CÁO</h3>
				</div>
			</div>
		</div>
		<!-- Nội dung admin -->
		<div>
			<form action="/updates" method="post" enctype="multipart/form-data">
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="inputEmail4">Tiêu đề quảng cáo</label> <input
							type="text" name="title" class="form-control" value="${advertisement.title}" id="inputEmail4"
							placeholder="Tiêu đề quảng cáo" required="required">
					</div>
					<div class="form-group col-md-6">
						<label for="inputState">Vị trí</label> 
						<select id="inputState" name="position.id" class="form-control">
							<option value="${advertisement.position.id }">Chọn vị trí</option>
							<c:forEach var="p" items="${listposition}">
								<option value="${p.id}">${p.positionName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="exampleFormControlFile1">Hình ảnh</label> 
						<br>
						<img style="width: 50%; margin-bottom: 3px" src="/static/images/news/${advertisement.images}">
						<input value="${advertisement.images}"
							type="file" name="imagess" onchange="openFile(this)"
							class="form-control-file">
							<div class="mt-2"></div>
					</div>
					<div class="form-group col-md-6">
						<label for="inputPassword4">Số tiền</label> <input value="${ad}" type="number"
							name="money" class="form-control" placeholder="VNĐ"
							required="required">
					</div>
					<div class="images-anh" id="anh">
					<li>Vị trí <span style="color: blue">trang chủ</span>  phù hợp với kích thước ảnh là 1080 x 275 pixel</li>
					<li>Vị trí <span style="color: blue">trang con</span> phù hợp với kích thước ảnh là 250 x 450 pixel</li>
					</div>
				</div>
				<div class="form-group mt-5">
					<button type="button" class="btn btn-primary">Quay lại</button>
					<button type="submit" class="btn btn-primary">Thêm mới</button>
				</div>
			</form>
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