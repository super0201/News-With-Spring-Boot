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
<div class="mt-3">
	<div class="alert alert-dismissible fade show" style="padding: 0px; margin-right: 30px;">
		<button style="padding: 2px;" type="button" class="close" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true"><i style="color: black;"
				class="fa fa-times-circle" aria-hidden="true"></i></span>
		</button>
		<img style="width: 1080px; height: 275px; border: 1px solid;"
			src="/static/images/news/${trangchu_detail.images}" alt="">
	</div>
</div>
<!-- Nôi dung tin -->
<div class="row">
	<div class="col-sm-8">
		<div style="background-color: white !important; margin-top: 5px">
			<div class="container" style="margin-top: 10px; border: 1px solid;">
				<h5>Danh mục - ${tinchitiet.categories.categoriesName}</h5>
				<h1 class="the-article-title">${tinchitiet.title}</h1>
				<p style="font-size: 14px; font-family: sans-serif;">
					<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
					${tinchitiet.member.fullName} - <span><i
						class="fa fa-clock-o" aria-hidden="true"></i></span> ${tinchitiet.date}
				</p>
				<!-- Nội dung bản tin -->
				<div class="main">${tinchitiet.newsContent}</div>
			</div>
		</div>
	</div>
	<!-- Tin liên quan -->
	<div class="col-sm-4" style="margin-left: -5px;">
		<div class="row" style="margin-left: 0px !important;">
			<c:forEach var="t" items="${tinmoi}">
				<div class="col-md-12 mt-2">
					<div class="card" style="width: 93%; height: 415px; border: 1px solid;">
						<a href="chitiet?id=${t.id}"><img
							style="width: 309px; height: 210px"
							src="/static/images/news/${t.imagestitle}" class="card-img-top"
							alt="..."> </a>
						<div class="card-body">
							<a class="link-a" style="text-decoration: none"
								href="chitiet?id=${t.id}"><h5 class="card-title">${t.title}</h5></a>
							<p style="font-size: 13px; font-family: sans-serif;"">
								<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
								${t.member.fullName} - <span><i class="fa fa-clock-o"
									aria-hidden="true"></i></span> ${t.date}
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row">
			<div class="col-md-12 mt-2">
				<div class="alert alert-dismissible fade show" style="padding: 0px">
					<button style="right: 7px; top: -11px;" type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i style="color: black;"
							class="fa fa-times-circle" aria-hidden="true"></i></span>
					</button>
					<img style="width: 309px; height: 500px;  border: 1px solid; margin-left: 16px;"
						src="/static/images/news/${trangcon_detail.images}" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- form comment -->
<!-- Comment -->
<div class="row">
	<div class="col-md-8">
		<div ng-app="app" ng-controller="ctrl">
			<div class="user-comment mt-3 mb-3" style="border: 1px solid olivedrab; padding: 10px;">
			<p style="font-weight: bold;">Bình luận</p>
				<div class="comments-section">
					<div class="comment-add">
						<div class="field-comment">
							<textarea ng-model="message.text" style="width: 100%;"
								placeholder="Nhập nội dung bình luận . . ." class="form-control"
								id="exampleFormControlTextarea1" rows="3">
							</textarea>
							<button class="btn btn-primary float-right mt-3"
								ng-click="send()" href="#">Bình luận</button>
						</div>
						<br> <br>
					</div>
					<div style="margin-top: 40px; background-color: white !important" >
						<ul>
							<li ng-repeat="(key,value) in message">
								<div class="comment-post">
									<div class="comment-img">
										<img style="width: 30px; height: 30px; margin-top: 4px"
											src="/static/images/news/{{value.images}}" /> <span
											style="font-weight: bold;" class="comment-author">{{value.fullname}}</span>
										<span>-</span> <span>{{value.date|date:"HH:mm
											MM-dd-yyyy"}}</span><br>
										<div style="margin-left: 45px">
											<span class="">{{value.text}}</span> <br> <span><i
												class="fa fa-thumbs-up" aria-hidden="true"></i></span> <span><i
												style="margin-left: 15px; margin-right: 15px"
												class="fa fa-thumbs-down" aria-hidden="true"></i></span> <span><a
												data-toggle="collapse" href="#collapseExample{{key}}"
												role="button" aria-expanded="false"
												aria-controls="collapseExample{{key}}"> Trả lời </a></span>
											<div class="collapse" id="collapseExample{{key}}">
											<textarea rows="2" cols="60" placeholder="Nhập nội dung bình luận . . ." ng-model="reply.text"></textarea>
											<a style="margin-top: 5px; margin-right: 38px;"
													class="btn btn-info pull-right" ng-click="reply(key)"
													href="">Trả lời bình luận</a>
											</div>
										</div>
									</div>
								</div>
								<div style="margin-top: 10px">
									<ul>
										<li ng-repeat="(key,value) in value.replies">
											<div class="comment-post-reply">
												<div class="comment-img">
													<img style="width: 25px; height: 25px;"
														src="/static/images/news/{{value.images}}" /> <span
														style="font-weight: bold;" class="comment-author">{{value.fullname}}</span>
													<span>-</span> <span class="comment-time">{{value.reply|date:"HH:mm
														MM-dd-yyyy"}}</span>
												</div>
												<div class="comment-details">
													<p class="comment-content">{{value.text}}</p>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</li>
						</ul>
					</div>
					<div id="comment_form_wrapper" class="col-md-12"
						style="display: none;">
						<div class="comment-add ">
							<div class="field-comment">
								<textarea rows="4" cols="50"></textarea>
								<a class="btn btn--blue btn--medium pull-right" href="#">Post
									Your Reply</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>
<div class="alert alert-secondary" role="alert">
 <strong>Tin tức</strong>
</div>
<!-- Tin bình thường -->
<div class="row mt-3">
	<div class="col-md-12">
		<div class="list-unstyled">
			<c:forEach var="t" items="${tinthuong}">
				<div class="media border mt-1" margin-bottom: 1px"><a href="chitiet?id=${t.id}"><img
						style="width: 155px; height: 100px"
						src="/static/images/news/${t.imagestitle}" class="mr-3 rounded"
						alt="..."></a>
					<div class="media-body">
						<a class="link-a" style="text-decoration: none"
							href="chitiet?id=${t.id}"><h5 class="mt-0 mb-1">${t.title}</h5></a>
						<!-- ghi chú tin tức -->
						<p style="font-size: 13px; font-family: sans-serif;"">
							<span><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
							${t.member.fullName} - <span><i class="fa fa-clock-o"
								aria-hidden="true"></i></span>${t.date}
						</p>
					</div></div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	app = angular.module("app", []);
	app.controller("ctrl", function($scope) {
		var path = "comments/${id}/" + Date.now();
		var name = "${Username}";
		var fullname = "${fullname}";
		var image = "${img}";
		$db = firebase.database();
		$db = firebase.database();	
		// Phần reply
		$scope.reply = function(key) {
			if (name === "") {
				alert('Đăng nhập để được trả lời bình luận !');
			} else {
				// text = prompt('Nhập câu trả lời');
				var path = 'comments/${id}/' + key + '/replies/' + Date.now();
				$db.ref(path).update({
					text : $scope.reply.text,
					reply : Date.now(),
					athour : name,
					fullname : fullname,
					images : image

				});
				$scope.reply.text = "";
			}
		}
		$scope.send = function() {
			var path = "comments/${id}/" + Date.now();

			if (name === "") {
				alert('Đăng nhập để được bình luận !');

			} else {
				$db.ref(path).update({
					text : $scope.message.text,
					author : name,
					date : Date.now(),
					fullname : fullname,
					images : image
				}, function(error) {
					if (error) {
						alert('lỗi');
					}
				})
			}
		}
		var path2 = 'comments/${id}';
		$db.ref(path2).on('value', function(response) {
			$scope.message = response.val();
			$scope.$digest();
		})

	})
</script>