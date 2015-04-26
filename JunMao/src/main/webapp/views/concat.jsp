<%@include file="comm/comm.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Contact</title>
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
 html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
 #verifyCode_img{
 	cursor: pointer;
 }
</style>
<!-- start plugins -->
<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#verifyCode_img").click(function(){
			$(this).attr("src", "${root }/verify/code/get");
		});
	});
</script>
<meta charset="utf-8">
</head>
<body>
<%@include file="comm/head.jsp" %>

<div class="main"><!-- start main -->
<div class="container">
			<div class="row contact"><!-- start contact -->				
				<div class="col-md-4">
					<div class="contact_info">
			    	 	<h2>我们在这里</h2>
			    	 		<div style="width:345px;height:175px;border:#ccc solid 1px;" id="dituContent"></div>
      				</div>
      				<div class="company_ad">
				     	<h2>地址 :</h2>
      				<address>
						 <p>${sysinfo.address }</p>
						 <p>中国</p>
				   		<p>电话:${sysinfo.phone }</p>
				   		<p>传真: ${sysinfo.fax }</p>
				 	 	<p>邮箱: <a href="mailto:${sysinfo.email }">${sysinfo.email }</a></p>
				   	</address>
				   </div>
				</div>				
				<div class="col-md-8">
				  <div class="contact-form">
				  	<h2>联系我们</h2>
					    <sf:form method="post" action="${root }/concat/mail" modelAttribute="email" cssClass="form-horizontal">
					    	<div class="form-group">
						    	<label for="username" class="col-md-2 control-label">姓名</label>
                               
                                <div class="col-md-8">
                                    <sf:input path="username" cssClass="form-control" />
                                </div>
                                <div class="col-md-2">
									<sf:errors path="username" cssClass="help-block error"></sf:errors>
                                </div>
                        
						    </div>
						    <div class="form-group">
						    	<label for="email" class="col-md-2 control-label">邮箱</label>
						    	
                                <div class="col-md-8">
                                    <sf:input path="email" cssClass="form-control"/>
                                </div>
                                <div class="col-md-2">
                                    <sf:errors path="email" cssClass="help-block error" ></sf:errors>
                                </div>
                                
						    </div>
						    <div class="form-group">
						     	<label for="phone" class="col-md-2 control-label">电话</label>
						    	
                                	<div class="col-md-8">
                                    <sf:input path="phone" cssClass="form-control"/>
                                	</div>
                                    <div class="col-md-2">
                                    	<sf:errors path="phone" cssClass="help-block error"></sf:errors>
                                    </div>
                                
						    </div>
						    <div class="form-group">
						    	<label for="remark" class="col-md-2 control-label">备注</label>
                                
                                	<div class="col-md-8">
                                    	<sf:textarea path="remark" cssClass="form-control" placeholder="不超过144个字符"/>
                                	</div>
                                    <div class="col-md-2">
                                    	<sf:errors path="remark" cssClass="help-block error"></sf:errors>
                                    </div>
                                
						    </div>
						    <c:if test="${multipart_post }">
						    <div class="form-group">
						    	<label for="verifyCode" class="col-md-2 control-label">校验码</label>
                                
                                	<div class="col-md-8">
                                    	<div class="input-group">
                                            <sf:input path="verifyCode" cssClass="form-control"/>
                                            <span class="input-group-addon"><img src="${root }/verify/code/get" id="verifyCode_img"/></span>
                                        </div>
                                	</div>
                                    <div class="col-md-2">
                                    	<sf:errors path="verifyCode" cssClass="help-block error"></sf:errors>
                                    </div>
                                
						    	
						    </div>
						    </c:if>
						   <div class="form-group">
						   		<div class="col-md-offset-2 col-md-8">
                                	<input type="submit" value="提交">
                                </div>
						  </div>
					    </sf:form>
				    </div>
  				</div>		
  				<div class="clearfix"></div>		
		  </div> <!-- end contact -->
</div>
</div>
<%@include file="comm/foot.jsp" %>

</body>
<script src="../resources/js/map.js"></script>
</html>