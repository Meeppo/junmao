<%@include file="../../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>sysinfo edit</title>
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
		  
		  
		  
		  <sf:form method="post" modelAttribute="sysinfo" cssClass="form-horizontal">
		  	<div class="form-group">
		  		<sf:hidden path="id"/>
		  		<label class="col-md-2 control-label" for="email">邮箱</label>
				<div class="col-md-6">
					<sf:input path="email" cssClass="form-control"/>
				</div>
				<div class="col-md-4">
					<sf:errors path="email" cssClass="help-block error"/>
				</div>
		  	</div>
		  	<div class="form-group">
		  		<label class="col-md-2 control-label" for="phone">电话</label>
				<div class="col-md-6">
					<sf:input path="phone" cssClass="form-control "/>
				</div>
				<div class="col-md-4">
					
					<sf:errors path="phone" cssClass="help-block error"/>
				</div>
		  	</div>
			 <div class="form-group">
			  		<label class="col-md-2 control-label" for="fax">传真</label>
					<div class="col-md-6">
						<sf:input path="fax" cssClass="form-control"/>
					</div>
					<div class="col-md-4">
						<sf:errors path="fax" cssClass="help-block error"/>
					</div>
			 </div>
			  <div class="form-group">
			  		<label class="col-md-2 control-label" for="address">地址</label>
					<div class="col-md-6">
						<sf:input path="address" cssClass="form-control "/>
					</div>
					<div class="col-md-4">
						<sf:errors path="address" cssClass="help-block error"/>
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


