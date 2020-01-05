<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
						<li ><a href="index"> <i
								class="metismenu-icon"></i> QUẢN LÝ BÀI VIẾT
						</a></li>
						<li><a href="danhmuc"> <i class="metismenu-icon"> </i>QUẢN
								LÝ DANH MỤC
						</a></li>
						<li class="mm-active"><a href="quangcao"><i class="metismenu-icon"> </i>QUẢN
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
					</a></li>
				</ul></li>
		</div>
	</div>
</div>
<div class="app-main__outer">
	<div class="app-main__inner">
		<!-- tiêu đề nội dung admin -->
		<div class="app-page-title" style="height: 80px;">
			<div class="page-title-wrapper">
				<div class="page-title-heading">
					<h3>THÊM MỚI VỊ TRÍ</h3>
				</div>
			</div>
		</div>
		<div style="color: darkgreen; font-weight: bold; font-size: 20px;">
			${messageVT}
		</div>
		<!-- Nội dung -->
		<div class="mb-3">
			<form class="form-inline" method="post">
				<div class="form-group">
					<label style="font-weight: bold; font-size: 15px" for="inputPassword6">Tên vị trí</label> <input type="text"
						class="form-control mx-sm-3" id = "positionName" value="${position.positionName}" name="positionName" aria-describedby="passwordHelpInline"
						placeholder="Tên vị trí" required="required" />
				</div>
				<div class="form-group">
					<label style="font-weight: bold; font-size: 15px" for="inputPassword6">Đơn giá</label> <input type="number"
						class="form-control mx-sm-3" name="price" min = "0" step = 1""  id="price" value="${position.price}"  aria-describedby="passwordHelpInline"
						placeholder="Đơn giá" required="required">
				</div>
				<button formaction="/admin/createPosition" type="submit" class="btn btn-outline-primary">THÊM</button>
			</form>
		</div>
		<div>
			<table class="table table-striped table-dark table-hover">
				<thead>
					<tr style="color: coral">
						<th>#</th>
						<th>Tên vị trí</th>
						<th>Đơn giá</th>
						<th>Hành động</th>
					</tr>
				</thead>
				<c:forEach var="c" items="${listVT}">
				<tbody>
					<tr>	
						<th scope="">${c.id}</th>
						<td>${c.positionName}</td>
						<%-- <td>${c.price} VNĐ</td> --%>
						<td><fmt:formatNumber type="number" value="${c.price}" /> vnđ</td>
						<td>
								<a class="btn btn-outline-primary" href="/admin/positionEdit/${c.id}"><i class="fa fa-pencil-square-o"
									aria-hidden="true"></i></a>
								<a class="btn btn-outline-danger" data-toggle="collapse" href="#collapseExample${c.id}x" role="button" aria-expanded="false" aria-controls="collapseExample">
													   <i class="fa fa-trash-o"
														aria-hidden="true"></i>
								</a>
								<div class="collapse" id="collapseExample${c.id}x">
									<div class="card card-body">
										<p style="color: black;">Bạn có chắc chắn muốn xóa vị trí ?</p> 
											<a class="btn btn-outline-danger"
														href="/admin/positionDelete/${c.id}" class="fa fa-trash-o"
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