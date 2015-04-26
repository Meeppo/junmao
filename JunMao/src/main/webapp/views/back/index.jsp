<%@include file="../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>骏茂钣金后台管理系统</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="../../resources/back/lib/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../../resources/back/stylesheets/theme.css">
<link rel="stylesheet" href="../../resources/back/lib/font-awesome/css/font-awesome.css">
<script src="../../resources/js/jquery.min.js" type="text/javascript"></script>
<script src="../../resources/back/lib/bootstrap/js/bootstrap.js"></script>
<!-- Demo page code -->

<style type="text/css">


.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
.dropdown-menu a:hover{
	background-color: #eee !important;
}
</style>

<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<link rel="shortcut icon" href="../assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<script>
	function nav(url){
		$('#content_frame').attr('src',url);
	}

	$(document).ready(function(){

		//自适应高度
		function resizeFrame(){
			$("#content_frame").attr("height", $("#content_frame").get(0).contentWindow.document.body.scrollHeight);
		};
		window.setInterval(resizeFrame, 200);  
		
		$("#dashboard-menu li.center-frame a").click(function(e){

			e.preventDefault();
			nav($(this).attr("href"));
			
			
		});
			
		
	});
</script>
<body class="">
	<!--<![endif]-->

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

				<li id="fat-menu" class="dropdown">
					<a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> 
						<i class="icon-user"></i> ${admin.name } <i class="icon-caret-down"></i>
					</a>

					<ul class="dropdown-menu">
						<li class="divider"></li>
						<li><a tabindex="-1"  href="javascript:nav('${root }/admin/back/update/${admin.id}')">账户设置</a></li>
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1" href="${root }/sign/back/out">注销</a></li>
					</ul>
				</li>

			</ul>
			<a class="brand" href="${root }/nav/back/index"><span class="first">骏茂</span>
				<span class="second">钣金</span></a>
		</div>
	</div>


	<div class="sidebar-nav" role="navigation">
		<a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i
			class="icon-dashboard"></i>Dashboard</a>
		<ul id="dashboard-menu" class="nav nav-list collapse in">
			<li><a href="${root }/nav/index">首页</a></li>
			<%-- <li class="center-frame"><a href="${root }/concat/back/list">客户邮件</a></li>
			<li class="center-frame"><a href="${root }/admin/back/list">用户管理</a></li>
			<li class="center-frame"><a href="${root }/product/back/list">产品管理</a></li>
			<li class="center-frame"><a href="${root }/yun/toyun">资源管理</a></li> --%>
		</ul>

	</div>
			
	<!-- center content -->
	<div class="content">
	   <div class="header">
	       <h1 class="page-title">产品编辑</h1>
	   </div>
	   
	   <ul class="breadcrumb">
	       <li><a href="${root }/nav/index">首页</a><span class="divider">/</span></li>
	       <li><a href="" class="crumb-list"></a><span class="divider">/</span></li>
	       <li class="active crumb-self"></li>
	   </ul>
	   <!-- content frame -->
	  
		<iframe  id="content_frame" width="100%"  scrolling="no" frameborder="0" src="${back_content }"
		onload="this.height=this.contentWindow.document.body.scrollHeight"></iframe>
		
		<footer>
			<p class="pull-right">
				Collect from <a href="http://www.cssmoban.com/" title="网页模板"
					target="_blank">网页模板</a>
			</p>

			<p>
				&copy; 2012 <a href="#" target="_blank">Portnine</a>
			</p>
		</footer>
	</div>
	
<script>
<%-- <li class="center-frame"><a href="${root }/concat/back/list">客户邮件</a></li>
<li class="center-frame"><a href="${root }/admin/back/list">用户管理</a></li>
<li class="center-frame"><a href="${root }/product/back/list">产品管理</a></li>
<li class="center-frame"><a href="${root }/yun/toyun">资源管理</a></li> --%>
	var menu = [
		{
			url:"${root }/concat/back/list",
			title:"客户邮件",
			listUrl:"${root }/concat/back/list",
			listTitle:"客户邮件"
		},
		{
			url:"${root }/admin/back/list",
			title:"用户管理",
			listUrl:"${root }/admin/back/list",
			listTitle:"用户管理"
		},
		{
			url:"${root }/product/back/list",
			title:"产品管理",
			listUrl:"${root }/product/back/list",
			listTitle:"产品管理"
		},
		{
			url:"${root }/yun/toyun",
			title:"资源管理"
		},{
			url:"${root }/sysinfo/back/edit",
			title:"系统信息"
		}
	];
	$.each(menu,function(index,element){
		var li = $('<li class="center-frame"><a>'+ element.title +'</a></li>');
		li.click(function(){
			$(".content .page-title").text(element.title);
			if(element.listTitle == undefined){
				$(".content .crumb-list").parent().css("display","none");	
			}else{
				$(".content .crumb-list").parent().css("display","inline-block");	
				$(".content .crumb-list").text(element.listTitle).attr("href",element.listUrl);
			}
			
			$(".content .crumb-self").text(element.title);
			$("#content_frame").attr("src",element.url);
		});
		$("#dashboard-menu").append(li);
	})
	$("#dashboard-menu li:eq(1)").click();
</script>
</body>
</html>


