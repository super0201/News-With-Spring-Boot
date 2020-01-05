<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						<li class="mm-active"><a href="/admin/index"> <i
								class="metismenu-icon"></i> QUẢN LÝ BÀI VIẾT
						</a></li>
						<li><a href="/admin/danhmuc"> <i class="metismenu-icon"> </i>QUẢN
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
					<h3>CHI TIẾT BÀI VIẾT</h3>
				</div>
			</div>
		</div>
		<form method="post">
			<!-- loại tin -->
			<div class="form-group">
				<label for="exampleFormControlSelect1">Chọn loại tin</label> <select
					name="type.id" class="form-control">
					<c:forEach var="c" items="${listType}">
						<option value="${c.id}">${c.name}</option>
					</c:forEach>
				</select>
			</div>
			<!-- button -->
			<div class="mb-2">
				 <button style="color: white;" formaction="/admin/updateNews" type="submit"
					class="btn btn-primary btn-lg">
					<i class="fa fa-check-circle-o" aria-hidden="true"></i> PHÊ DUYỆT
				</button>
				<a class="btn btn-secondary btn-lg"  href="/admin/index" style="color: white;" aria-hidden="true">QUAY
						LẠI</a>
			</div>
			<div>
				<input class="form-control" type="hidden"
					value="${news.categories.id}" name="categories.id" /> <input
					class="form-control" type="hidden" value="${news.id}" name="id"
					readonly="readonly" /> <input class="form-control" type="hidden"
					value="${news.title}" name="title" /> <input class="form-control"
					type="hidden" value="${news.summary}" name="summary" /> <input
					class="form-control" type="hidden" value="${news.imagestitle}"
					name="imagestitle" /> <input class="form-control" type="hidden"
					value="${news.video}" name="video" readonly="readonly" /> <input
					class="form-control" type="hidden" value="${news.views}"
					name="views" /> <input class="form-control" type="hidden"
					value="${news.member.username}" name="member.username" />
					<input name="fullnames" type="hidden" value="${news.member.fullName}">
				<input class="form-control" type="hidden" value="${news.date}" name="date" />  
				<input class="form-control" type="hidden" value="${news.createdAt}" name="createdAt" />
			</div>
			
			<!-- Tiêu đề -->
			<h2>${news.title}</h2>
			<!-- tóm tắt -->
			<div>
				<h5>${news.summary}</h5>
			</div>
			<div>
				<h7>${news.newsContent}</h7>
			</div>
			<!-- Nội dung admin -->
			<div hidden>
				<div id="sample">
					<script type="text/javascript"
						src="http://js.nicedit.com/nicEdit-latest.js"></script>
					<script type="text/javascript">
						bkLib.onDomLoaded(function() {
							nicEditors.allTextAreas()
						});
					</script>
					<label for="formGroupExampleInput2">Nội dung:</label>
					<textarea name="newsContent" class="w-100" readonly="readonly">  ${news.newsContent}</textarea>
				</div>
			</div>
		</form>
	</div>
</div>