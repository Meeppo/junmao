<%@include file="../../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>product edit</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.min.css">
    <script src="${root }/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="${root }/resources/js/bootstrap.min.js"></script>
    <!-- Demo page code -->

    <style type="text/css">
    
	   body{
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
		  
		  
		  
		  <sf:form method="post" modelAttribute="product" cssClass="form-horizontal">
		  	<div class="form-group">
		  		<label class="col-md-2 control-label" for="productName">产品名</label>
				<div class="col-md-6">
					<sf:input path="productName" cssClass="form-control"/>
				</div>
				<div class="col-md-4">
					<sf:errors path="productName" cssClass="help-block error"/>
				</div>
		  	</div>
		  	<div class="form-group">
		  		<label class="col-md-2 control-label" for="photo">图片路径</label>
				<div class="col-md-5">
					<sf:input path="photo" cssClass="form-control "/>
				</div>
				<div class="col-md-1">
					<a class="btn btn-warning " href="/JunMao/yun/toyun" target="_blank">打开资源库</a>
				</div>	
				<div class="col-md-4">
					
					<sf:errors path="photo" cssClass="help-block error"/>
				</div>
		  	</div>
			 <div class="form-group">
			  		<label class="col-md-2 control-label" for="summary">摘要</label>
					<div class="col-md-6">
						<sf:textarea path="summary" cssClass="form-control"/>
					</div>
					<div class="col-md-4">
						<sf:errors path="summary" cssClass="help-block error"/>
					</div>
			 </div>
			  <div class="form-group">
			  		<label class="col-md-2 control-label" for="isTop">首页显示</label>
					<div class="col-md-6">
						<div class="radio-inline">
							<sf:radiobutton path="isTop" value="0" label="是"/>				
						 </div>
						 <div class="radio-inline">
						 	<sf:radiobutton path="isTop" value="1" label="否"/>
						 </div>
					</div>
					<div class="col-md-4">
						
					</div>
			 </div>
		
			 <div class="form-group">
			 		<div class="col-md-offset-2 col-md-6">
			 			<input type="submit" class="btn btn-primary" value="提交"/>
			 		</div>
			 </div>
		  </sf:form>

		   
		</div>
   
  	</div>

</div>

        
               

 
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
    </script>
   
    
  </body>
</html>


