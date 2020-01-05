<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>
.link-a:hover {
	color: #6610f2;
}

.link-a {
	color: black;
}
</style>

<!--Quảng cáo-->

<div class="container mt-3">
	<div class="alert alert-dismissible fade show" style="padding: 0px">
		<button style="padding: 2px;" type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i style="color: black;"
				class="fa fa-times-circle" aria-hidden="true"></i></span>
		</button>
		<img style="width: 1078px; height: 275px; border: 1px solid;"
			src="/static/images/news/${trangchu_search.images}" alt="">
	</div>
</div>
<!-- Nội dung Index -->
<div class="container">
	<div class="alert alert-secondary" role="alert">
	 	<strong>Nội dung tìm kiếm</strong>
	</div>
	<div class="row">
		<c:forEach var="t" items="${listsearch}">
			<div class="col-md-3 mt-2">
				<div class="card" style="width: 100%; height: 350px; border: 1px solid;">
					<a href="chitiet?id=${t.id}"><img style="width: 245px; height: 170px; padding: 1px;" src="/static/images/news/${t.imagestitle}"
						class="card-img-top" alt="..."></a>
					<div class="card-body">
						<a class="link-a" style="text-decoration: none" href="chitiet?id=${t.id}">
							<h6 class="card-title">${t.title}</h6>
						</a>
						<!-- ghi chú tin tức -->
						<p style="font-size: 13px;" class="font-weight-light">
							<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
							${t.member.fullName} - <span><i class="fa fa-clock-o"
								aria-hidden="true"></i></span> ${t.date}
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
		<div class="alert alert-secondary mt-4" role="alert">
		 	<strong>Tin tức</strong>
		</div>
	<div class="row">
		<div class="col-md-9">
			<div class="list-unstyled">
				<c:forEach var="t" items="${tinthuong}">
					<div class="media mt-2 border p-1" style="margin-bottom: 1px;"><a href="chitiet?id=${t.id}"><img
							style="width: 155px; height: 100px" src="/static/images/news/${t.imagestitle}" class="mr-3 rounded" alt="...">
					</a>
						<div class="media-body">
						<a class="link-a" style="text-decoration: none" href="chitiet?id=${t.id}"><h5 class="mt-0 mb-1">${t.title}</h5></a>
							<!-- ghi chú tin tức -->
							<p style="font-size: 13px;" class="font-weight-light">
								<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
								${t.member.fullName} - <span><i class="fa fa-clock-o"
									aria-hidden="true"></i></span> ${t.date}
							</p>
						</div>
						</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-3 mt-2">
			<div class="alert alert-dismissible fade show" style="padding: 0px">
				<button style="padding: 2px;" type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true"><i style="color: black;"
						class="fa fa-times-circle" aria-hidden="true"></i></span>
				</button>
				<img style="width: 250px; height: 450px; border: 1px solid;"
					src="/static/images/news/${trangcon_search.images}" alt="">
			</div>
		</div>
	</div>
</div>
</div>