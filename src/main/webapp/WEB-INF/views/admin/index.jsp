<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Trang chủ Admin</title>
    <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
    <meta name="description" content="This is an example dashboard created using build-in elements and components.">
    <meta name="msapplication-tap-highlight" content="no">
    <link href="/assets/style/main.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/fonts/css/font-awesome.min.css">
    
    <style type="text/css">
    	.erros{
    	color:red;}
    </style>
</head>

<body>
    <div class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
        <header>
                <jsp:include page="layout/header.jsp"/>
        </header>
        <div class="app-main">
             <tiles:insertAttribute name="bodyad"/>
        </div>
        <footer>
        	<jsp:include page="layout/footer.jsp"></jsp:include>
        </footer>
    </div>
    <script type="text/javascript" src="/assets/scripts/main.js"></script>
</body>

</html>

