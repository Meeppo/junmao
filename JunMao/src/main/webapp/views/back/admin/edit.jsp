<%@include file="../../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>admin edit</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${root }/resources/back/stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="${root }/resources/back/stylesheets/style.css">
    <link rel="stylesheet" href="${root }/resources/back/lib/font-awesome/css/font-awesome.css">

    <script src="${root }/resources/js/jquery.min.js" type="text/javascript"></script>
	<script src="${root }/resources/js/bootstrap.min.js"></script>
    <!-- Demo page code -->

    <style type="text/css">
    
	   body{
		  min-height: 800px;
		  background: #fff;
	
	  }
	  form{
	  	padding-top:50px;
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
		  
		  <ul class="nav nav-tabs">
		  	<li class="active"><a href="#info-edit" data-toggle="tab">信息编辑</a></li>
		  	<li><a href="#pw-edit" data-toggle="tab">修改密码</a></li>
		  </ul>
		  <div class="tab-content">
		  	<div class="tab-pane fade active in " id="info-edit">
		  		 <sf:form method="post" modelAttribute="admin" cssClass="form-horizontal">
				  	<div class="form-group">
				  		<label class="col-md-1 control-label" for="name">用户名</label>
						<div class="col-md-6">
							<sf:input path="name" cssClass="form-control"/>
						</div>
						<div class="col-md-4">
							<sf:errors path="name" cssClass="help-block error"/>
						</div>
				  	</div>
				  	<div class="form-group">
				  		<label class="col-md-1 control-label" for="email">邮箱</label>
						<div class="col-md-6">
							<sf:input path="email" cssClass="form-control"/>
						</div>
						<div class="col-md-4">
							<sf:errors path="email" cssClass="help-block error"/>
						</div>
				  	</div>
					 <div class="form-group">
					  		<label class="col-md-1 control-label" for="phone">电话</label>
							<div class="col-md-6">
								<sf:input path="phone" cssClass="form-control"/>
							</div>
							<div class="col-md-4">
								<sf:errors path="phone" cssClass="help-block error"/>
							</div>
					 </div>
			
					 <div class="form-group">
					 		<div class="col-md-offset-1 col-md-6">
					 			<input type="submit" class="btn btn-primary" value="提交"/>
					 		</div>
					 </div>
				  </sf:form>
		  		
		  	</div>
		  	<div class="tab-pane fade" id="pw-edit">
		  		<form method="post" action="${root }/admin/back/pwEdit/${admin.id}" class="form-horizontal">
		  			<div class="form-group">
		  				<div class="infos col-md-offset-1 col-md-6"></div>
		  			 </div>
		  			 <div class="form-group">
					  		<label class="col-md-1 control-label" for="password">密码</label>
							<div class="col-md-6">
								<input type="password" name="password" class="form-control"/>
							</div>
							<div class="col-md-4">
								
							</div>
					 </div>
					<div class="form-group">
					  		<label class="col-md-1 control-label" for="passwordConf">确认密码</label>
							<div class="col-md-6">
								<input type="password" name="passwordConf" class="form-control"/>
							</div>
							<div class="col-md-4">
								
							</div>
					 </div> 
					 <div class="form-group">
					 		<div class="col-md-offset-1 col-md-6">
					 			<span ID="pw-submit" class="btn btn-primary">提交</span>
					 		</div>
					 </div>
		  		</form>
		  	</div>
		  </div>
		  
		 
		   
		</div>
   
  	</div>

</div>


    <script type="text/javascript">

	function bootstrapAlert(com){

		var alert = $("<div class='alert fade in' role='alert'></div>");
		
		var alert_header = $("<h4></h4>");
		alert.append(alert_header);
		var closeBtn = $('<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button>');	
		alert.append(closeBtn);
		var alert_content = $('<p class="alert-content"></p>');
		alert.append(alert_content);
		
		com.append(alert);
		return {
			header : alert_header,
			content : alert_content,
			close : closeBtn
		};
	}
	
	$("#pw-submit").click(function(){
		
		var form = $("#pw-edit form");
		
		 $.post(form.attr("action"),form.serialize(),function(data){
			
			var alert = bootstrapAlert($("#pw-edit .infos"));
			alert.content.text(data);
		}); 
		
	});
    </script>
   
    
  </body>
</html>


