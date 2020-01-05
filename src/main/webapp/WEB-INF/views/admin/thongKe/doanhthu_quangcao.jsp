<%@page import="java.text.DecimalFormat"%>
<%@ page pageEncoding="UTF-8"%>
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
								<li ><a style="font-size: 12px" href="tkphongvien"> <i
										class="metismenu-icon"></i> PHÓNG VIÊN
								</a></li>
								<li class="mm-active"><a style="font-size: 12px" href="tkquangcao"> <i
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
					<h3>THỐNG KÊ DOANH THU THEO NHÀ QUẢNG CÁO</h3>
				</div>
			</div>
		</div>
		<div class="tab-content">
			<div class="tab-pane tabs-animation fade show active"
				 role="tabpanel">
				<div class="row">
					<div class="col-sm-12">
						<div class="main-card mb-3 card">
							<div class="card-body">
								<p>
									<button class="btn btn-secondary btn-lg" type="button"
										data-toggle="collapse" data-target="#collapseExample"
										aria-expanded="false" aria-controls="collapseExample">Xem
										bằng bảng</button>
								</p>
								<div class="collapse" id="collapseExample">
									<table class="table table-dark hover">
										<thead>
											<tr style="color: coral">
												<th>Nhà quảng cáo</th>
												<th>Số lần đặt quảng cáo</th>
												<th>Tổng số tiền</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="array2" items="${price}">
												<tr>
													<td>${array2[0]}</td>
													<td>${array2[1]} lần</td>
													<td>
         											 <fmt:formatNumber type="number" value="${array2[2]}" /> vnđ
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="piecharts" style="width: 100%; height: 400px"></div>
								<script type="text/javascript"
									src="https://www.gstatic.com/charts/loader.js"></script>
					<script type="text/javascript">
    					var my = [ [ 'Nhà quảng cáo', 'Tổng số tiền' ],
							<c:forEach var="array2" items="${price}"> 
							[ "${array2[0]}", ${array2[2]} ],
							</c:forEach>		 
						 ]
						 google.charts.load("current", {packages:["corechart"]});
						 google.charts.setOnLoadCallback(drawChart);
						 function drawChart() {
						 var data2 = google.visualization.arrayToDataTable(my);
						
						 var view2 = new google.visualization.DataView(data2);
						      
						 var options2 = {
							title : 'Biểu đồ'
						 };
						 var chart = new google.visualization.PieChart(document.getElementById('piecharts'));
						 chart.draw(view2, options2);
  									}
						 </script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>