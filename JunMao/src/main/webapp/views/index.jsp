<%@include file="comm/comm.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
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
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<meta charset="utf-8">
</head>
<style>
.slider{
	margin:0;
}
.offers-head{
	text-align: center;
	padding: 0 0 3em 0;
}
.offers-head h3{
	color: #2C3E50;
	text-transform: uppercase;
	font-size: 1.5em;
	font-weight: 600;
}
.offers-head p{
	color: #626262;
	font-size: 0.9em;
	margin-top: 0.4em;
}
.offers{
	padding:0em 0 3em 0;
}
.flexslider .slides img{
	max-height:240px;
}
.caption-info-head{
	padding:0.5em;
}
.carousel li:hover .caption-info-head{
	background:#2C3E50;
}
.carousel li:hover .caption-info-head-right span{
	background:url(../images/arrows.png) no-repeat 0px -26px;
}
.caption-info-head-left{
	float:left;
	width:90%;
}
.caption-info-head-left h4 a{
	color: #747474;
	font-size: 0.95em;
	font-weight: 400;
}
.caption-info-head-left span{
	color:#747474;
	font-size:0.875em;
	display:inline-block;
	height:15px;
	line-height:15px;
	overflow: hidden;
}
.carousel li:hover {
	box-shadow: 0 0 0px 2px #fff;
	-webkit-transform: scale(1.04) translateY(-5px);
	z-index: 1;
	border-bottom: 0 none;
}
.carousel li:hover .caption-info-head-left h4 a{
	color:#FFF;
	font-size:1em;
}
.carousel li:hover .caption-info-head-left span{
	color:#8899A8;
	font-size:0.875em;
}
.caption-info-head-right{
	float:right;
	width:10%;
	margin-top: 1em;
}
.caption-info-head-right span{
	width:20px;
	height:16px;
	background:url(../images/arrows.png) no-repeat 0px 0px;
	display:inline-block;
	}
</style>
<body>

<%@include file="comm/head.jsp" %>

<div class="main"><!-- start main -->
<div class="container main">
	<div class="row grids_of_3">
				<div class="col-md-4 grid1_of_3">
					  <h2>送货上门</h2>
					  <img src="../resources/source/images/icon1.png" class="img-responsive"/>
					 
				    				
				</div>
				<div class="col-md-4 grid1_of_3">
					<h2>咨询服务</h2>
					  <img src="../resources/source/images/icon2.png" class="img-responsive"/>
					 
				    				
				</div>
				<div class="col-md-4 grid1_of_3">
					<h2>电话订购</h2>
					  <img src="../resources/source/images/icon3.png" class="img-responsive"/>
					
				  			
				</div>
			    <div class="clearfix"></div>
	</div>


			<div class="offers-head">
				<h3>产品回廊</h3>
				<p>用我们的双手改变世界！</p>
			</div>
	<!-- start content_slider -->
			<!-- FlexSlider -->
			 <!-- jQuery -->
			  <link rel="stylesheet" href="../resources/flexslider/flexslider.css" type="text/css" media="screen" />
			  <!-- FlexSlider -->
			  <script defer src="../resources/flexslider/jquery.flexslider.js"></script>
			  <script type="text/javascript">
			    $(function(){
			      SyntaxHighlighter.all();
			    });
			    $(window).load(function(){
			      $('.flexslider').flexslider({
			        animation: "slide",
			        animationLoop: true,
			        itemWidth:250,
			        itemMargin: 5
			      });
			    });
			  </script>
			<!-- Place somewhere in the <body> of your page -->
				 <section class="slider">
		        <div class="flexslider carousel">
		          <ul class="slides">
		          <c:forEach items="${productPage.datas }" var="var">
		            <li onclick="location.href='#';">
		  	    	    <img src="${var.photo }" />
		  	    	    <!----place-caption-info---->
		  	    	    <div class="caption-info">
		  	    	    	 <div class="caption-info-head">
		  	    	    	 	<div class="caption-info-head-left">
			  	    	    	 	<h4><a href="#">${var.productName }</a></h4>
			  	    	    	 	<span>${var.summary }</span>
		  	    	    	 	</div>
		  	    	    	 	<div class="caption-info-head-right">
		  	    	    	 		<span> </span>
		  	    	    	 	</div>
		  	    	    	 	<div class="clear"> </div>
		  	    	    	 </div>
		  	    	    </div>
		  	    	     <!----//place-caption-info---->
		  	    	</li>
		  	    	</c:forEach>	
		          </ul>
		        </div>
		      </section>
              <!-- //End content_slider -->





</div>
</div>
<%@include file="comm/foot.jsp" %>


</body>
</html>