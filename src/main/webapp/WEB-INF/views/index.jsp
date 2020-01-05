<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="/assets/bootstrap/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="https://kit.fontawesome.com/d27d115e0f.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/fonts/css/font-awesome.min.css">
<link rel="stylesheet" href="/assets/fonts/css/font-awesome.min.css">
<link rel="shortcut icon" type="image/png"
	href="/assets/images/favicon.ico" />
<title>Trang chủ</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
</head>
<body class="bg-light">
	<div>
		<jsp:include page="layout/header.jsp" />
	</div>
	<div class="container">
		<tiles:insertAttribute name="body" />
	</div>
	<nav class=" bg-dark">
		<jsp:include page="layout/footer.jsp" />
	</nav>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script src="/assets/bootstrap/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/assets/bootstrap/dist/js/myjs.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.2.2/firebase.js"></script>
	<script>
		var firebaseConfig = {
			apiKey : "AIzaSyCemi6L5Y5F5-dP6C7AFmHXCpLNzfw8_TY",
			authDomain : "webtintuc-cf5b1.firebaseapp.com",
			databaseURL : "https://webtintuc-cf5b1.firebaseio.com",
			projectId : "webtintuc-cf5b1",
			storageBucket : "webtintuc-cf5b1.appspot.com",
			messagingSenderId : "555827114285",
			appId : "1:555827114285:web:5d8c40bc8673cf689663a4",
			measurementId : "G-1S1JYZWH85"
		};
		firebase.initializeApp(firebaseConfig);
	</script>
</body>

</html>