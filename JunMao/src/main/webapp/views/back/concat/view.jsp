<%@include file="../../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>concat email view</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${root }/resources/back/stylesheets/style.css">
    <link rel="stylesheet" type="text/css" href="${root }/resources/back/stylesheets/theme.css">
    <link rel="stylesheet" href="${root }/resources/back/lib/font-awesome/css/font-awesome.css">
	
    <script src="${root }/resources/js/jquery.min.js" type="text/javascript"></script>
	   <script src="${root }/resources/js/bootstrap.min.js"></script>
    <!-- Demo page code -->

    <style type="text/css">
	    body{
			  min-height: 800px;
			  background: #fff;
		
		  }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->

   <div class="container-fluid">
       <div class="row-fluid">
               

		<div class="well">
		  
		  
			 <table class="table ">
			 	<tr>
			 		<th class="col-md-2">姓名</th>
			 		<td>${email.username }</td>
			 	</tr>
			 	<tr>
			 		<th class="col-md-2">电话</th>
			 		<td>${email.phone }</td>
			 	</tr>
			 	<tr>
			 		<th class="col-md-2">邮箱</th>
			 		<td>${email.email }</td>
			 	</tr>
			 	<tr>
			 		<th class="col-md-2">备注</th>
			 		<td>${email.remark }</td>
			 	</tr>
			 	<tr>
			 		<th class="col-md-2">日期</th>
			 		<td>${email.createddate }</td>
			 	</tr>
			 </table>
		
		   
		</div>
   
  	</div>

</div>

    
  </body>
</html>


