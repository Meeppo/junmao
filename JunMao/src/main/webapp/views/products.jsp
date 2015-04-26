<%@include file="comm/comm.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>products</title>
<!-- Bootstrap -->
<link href="../resources/css/bootstrap.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<link href="../resources/css/style.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
body,td,th {
	font-family: "Open Sans", sans-serif;
}
</style>
<!-- start plugins -->
<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>

<meta charset="utf-8">
</head>
<body>

<%@include file="comm/head.jsp" %>

<div class="main"><!-- start main -->
<div class="container">
	<div class="features"><!-- start feature -->
		<div class="row features_list">
			<c:forEach items="${productPage.datas }" var="var">
			<div class="col-md-3 feature">
				<div class="fancyDemo">
					<a rel="group" title="${var.productName }"> <!-- href="../resources/source/images/ser_pic1.jpg" --> <img src="${var.photo }" alt=""class="img-responsive"/></a>
				</div>
				<p class="para">${var.summary }</p>
				<!-- <a href="single-page.html"> consectetur lipsum</a> -->
			</div>
			</c:forEach>
		</div>
	
        <div class="read_more pull-right">
				<a href="${root }/product/pager"><button class="btn_style">更多》</button></a>
		</div>
	</div><!-- end feature -->
    
</div>
</div>
<%@include file="comm/foot.jsp" %>

</body>
</html>