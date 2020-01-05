<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						PHÓNG VIÊN <i class="metismenu-state-icon fa fa-caret-down"
						aria-hidden="true"></i>
				</a>
					<ul>
						<li class="mm-active"><a href="#"> <i
								class="metismenu-icon"></i> THÊM BÀI VIẾT MỚI
						</a></li>
						<li><a href="/phongvien/thongtin"> <i class="metismenu-icon"></i>
								QUẢN LÝ BÀI VIẾT
						</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
<div class="app-main__outer">
	<!-- Nội dung thêm mới -->
	<div class="app-main__inner">
		<div class="app-page-title" style="height: 80px;">
			<div class="page-title-wrapper">
				<div class="page-title-heading">
					<h3>THÊM MỚI BÀI VIẾT</h3>
				</div>
			</div>
		</div>
		<div class="col md-12">
			<%-- <h5 class="erros ">${message}</h5> --%>
			<form:form action="/phongvien/createnews" modelAttribute="form"
				enctype="multipart/form-data">
				<div class="form-row">
					<div class="form-group col-md-8">
						<label style="font-weight: bold; font-size: 15px" for="inputState"> Tiêu đề bài viết</label>
						<form:input type="text" class="form-control" id="inputState"
							path="title" placeholder="Tiêu đề bài viết" />
						<span class="erros"><form:errors path="title" /></span>
					</div>
					<div class="form-group col-md-4">
						<label style="font-weight: bold; font-size: 15px" for="inputState"> Danh mục </label>
						<form:select id="inputState" path="categories.id"
							class="form-control">

							<c:forEach var="c" items="${listCat}">
								<form:option value="${c.id}">${c.categoriesName}</form:option>
							</c:forEach>
						</form:select>

					</div>

				</div>
				<div class="form-group">
					<label style="font-weight: bold; font-size: 15px" for="formGroupExampleInput2">Tóm tắt</label>
					<form:input type="text" class="form-control"
						id="formGroupExampleInput2" path="summary" placeholder="Tóm tắt" />
					<span class="erros"><form:errors path="summary" /></span>
				</div>
				<div class="form-group">
						<label style="font-weight: bold; font-size: 15px" for="exampleFormControlFile1">Hình ảnh</label> 
						<input style="margin-bottom: 3px" type="file" name="images" onchange="openFile(this)"
							class="form-control-file">
							<div class="images-anh" id="anh"></div>
					</div>
				<div class="form-group">
					<div id="sample">
						<script type="text/javascript"
							src="http://js.nicedit.com/nicEdit-latest.js"></script>
						<script type="text/javascript">
							bkLib.onDomLoaded(function() {
								nicEditors.allTextAreas()
							});
						</script>
						<label style="font-weight: bold; font-size: 15px" for="formGroupExampleInput2">Nội dung</label>
						<form:textarea path="newsContent" class="w-100 " />
						<span class="erros"><form:errors path="newsContent" /></span>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-success">Thêm mới bài viết</button>
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