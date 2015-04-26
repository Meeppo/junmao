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
<script type="text/javascript" src="../resources/js/jquery.pagination.js"></script>
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
					<a rel="group" title="${var.productName }"<%--  href="${root }/product/introduction/${var.id}" --%>><img src="${var.photo }" alt=""class="img-responsive"/></a>
				</div>
				<p class="para">${var.summary }</p>
				<%-- <a href="${root }/product/introduction/${var.id}">查看详情</a> --%>
			</div>
			</c:forEach>
		</div>
	
        <ul class="pagination" id="pageNav">
        </ul>
	</div><!-- end feature -->
    
</div>
</div>
<%@include file="comm/foot.jsp" %>
<script>
	$(".breadcrumb li:eq(1)").text("产品列表");
	var offset = ${productPage.offset};
	var total = ${productPage.total};

	$("#pageNav").pagination({
		url:"${root}/product/pager",
		offset:offset,
		total:total,
		pageSize:12
	});
</script>
</body>
</html>