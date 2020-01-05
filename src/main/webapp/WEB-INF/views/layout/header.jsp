<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
<!--
#dm:hover {
	font-size: 14px;
	color: #616107;
}
-->
</style>

<body class="bg-light">
	<div class=" fixed-top"
		style="background: linear-gradient(45deg, rebeccapurple, red, lightpink, transparent);">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<!-- logo -->
				<div class="float-left">
					<a href="/"> 
					<img class="rounded-circle w-25" src="/assets/images/logo.png" alt="">
					</a>
				</div>
				<!-- button tìm kiếm -->
				<form class="form-inline my-2 my-lg-0" action="search" method="POST">
					<input type="text" class="form-control mr-sm-2" type="search"
						name="search" placeholder="Nội dung tìm kiếm . . ." required>
					<button class="btn btn-success my-2 my-sm-0" type="submit">
						<i style="font-size: 21px" class="fa fa-search" aria-hidden="true"></i>
					</button>
				</form>
				<!-- đăng nhập đăng ký -->
				<div class="form-inline">
					<div class="btn-group dropleft">
						<a class="dropdown-toggle text-white" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<%
								if (session.getAttribute("user") == null) {
							%>
							<!-- <img width="35"
							style="width: 40px; height: 40px" class="rounded-circle"
							src="/static/images/news/trump.png">
							Đăng nhập -->
							<button type="button" class="btn btn-outline-dark">
								<strong>Đăng nhập</strong>
							</button>
							<%
								}
							%>
							<%
								if (session.getAttribute("user") != null) {
							%>
							<img width="35"
							style="width: 40px; height: 40px" class="rounded-circle"
							src="/static/images/news/${user.images}">
							<%
								}
							%>
						</a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

							<a class="dropdown-item" style="font-weight: bold;"
								href="${link}" data-target="">${user.fullName}</a> <a
								class="dropdown-item " href="#" data-target="" hidden>${user.username}</a>
							
							<%
								if (session.getAttribute("user") == null) {
							%>
							<a class="dropdown-item" href="/login">Đăng nhập</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/signup">Đăng ký</a>
							<%
								}
							%>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal"
								data-target="#myQC">Chính sách quảng cáo</a>
							<!--  -->
							
							<%
								if (session.getAttribute("user") != null) {
							%>
							<div class="dropdown-divider"></div>
							<a href="/logout" class="dropdown-item">Đăng Xuất</a>
							<%
								}
							%>
							
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- MENU -->
		<nav class="navbar navbar-expand-lg navbar-light "
			style="background-color: lavenderblush">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span> DANH MỤC
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div style="font-size: 13px; text-align: center"
					class="navbar-nav font-weight-bold mx-auto">
					<!-- Danh sách danh mục -->
					<c:forEach var="d" items="${listdanhmuc}">
						<a id="dm" class="nav-item nav-link" href="timkiem?id=${d.id}">${d.categoriesName}</a>
					</c:forEach>
				</div>
			</div>
		</nav>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<!-- Nội dung Index -->
	<div class="container">
		<div class="modal fade" id="myQC">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="card" align="center">
						<div class="card-header">
							<strong><h3>Thông Tin Quảng Cáo</h3></strong>
						</div>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<li>Vị trí quảng cáo ở trang chủ với mệnh giá 10.000 vnđ /
							lần xuất hiện</li>
						<li>Vị trí quảng cáo ở trang con với mệnh giá 5.000 vnđ / lần
							xuất hiện</li>
						<div class="" align="center">
							<i class="fa fa-connectdevelop" aria-hidden="true"></i> <i
								class="fa fa-connectdevelop" aria-hidden="true"></i> <i
								class="fa fa-connectdevelop" aria-hidden="true"></i>

							<p>WebTinTuc cung cấp nhiều hình thức cho phép doanh nghiệp
								tiếp cận đến bạn đọc một cách hiệu quả nhất. Để tìm hiểu, vui
								lòng liên hệ theo 1 trong các cách sau</p>

						</div>
						<!---->
						<hr />
						<div class="" align="center">
							<h5>
								Hotline <i class="fa fa-volume-control-phone" aria-hidden="true"></i>
							</h5>
							<kbd> TP.HCM: (+84) 028.3962.3888 (ext. 6416)</kbd>
							<br />
							<kbd> HN: (+84) 024.3212.3232 (ext. 2933)</kbd>
						</div>
						<!---->
						<hr />
						<div class="" align="center">
							<h5>
								Email <i class="fa fa-envelope-o" aria-hidden="true"></i>
							</h5>
							<kbd> 4news@info.com.vn</kbd>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-dark" data-dismiss="modal">
							Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

