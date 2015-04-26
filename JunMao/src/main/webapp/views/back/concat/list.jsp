<%@include file="../../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>无标题文档</title>
  <link rel="stylesheet" type="text/css" href="${root }/resources/back/lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="${root }/resources/back/stylesheets/theme.css">
    <link rel="stylesheet" href="${root }/resources/back/lib/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="${root }/resources/back/stylesheets/jquery.dataTables.css"> 
    <script src="${root }/resources/back/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="${root }/resources/back/lib/bootstrap/js/bootstrap.js"></script>
    <script src="${root }/resources/back/lib/jquery.dataTables.min.js"></script>
    <script src="${root }/resources/back/lib/jquery.dataTable.default.js"></script>
   
</head>
<style>
	.table-hover tbody tr{
		cursor :pointer;
	}
	 body{
		  min-height: 600px;
		  background: #fff;
	
	 }

</style>
<script>

	$(document).ready(function(){

		var table = $(".well table").DataTable();

		init(table,{
			del:{url:"${root}/concat/back/delete"},
			view:{has:true,url:"${root}/concat/back/view"}
		});
		
		
	});
</script>
<body>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="btn-toolbar">
				  <div class="btn-group">
				  </div>
				</div>
				<div class="well">
				    <table class="table table-striped table-hover">
				      <thead>
				        <tr>
				          <th>id</th>
				          <th>序号</th>
				          <th>姓名</th>
				          <th>邮箱</th>
				          <th>电话</th>
				          <th>日期</th>
				          <th>操作</th>
				        </tr>
				      </thead>
				      <tbody>
				      <c:forEach items="${emailList }" var="var" varStatus="status">
				        <tr>
				          <td>${var.id }</td>
				          <td>${status.index + 1}</td>
				          <td>${var.username}</td>
				          <td>${var.email }</td>
				          <td>${var.phone }</td>
				          <td>${var.createddate }</td>
				          <td>
				              <a href="${root }/concat/back/update/${var.id}"><i class="icon-pencil"></i></a>
				              <a href="#operator" role="button" data-toggle="modal"><i class="icon-remove"></i></a>
				          </td>
				        </tr>
				       </c:forEach>
				      </tbody>
				    </table>
				</div>
				
				
				<div class="modal small hide fade" id="operator" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				    <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				        <h3 id="myModalLabel">删除记录</h3>
				    </div>
				    <div class="modal-body">
				        <p class="error-text"><i class="icon-warning-sign modal-icon"></i>确定要删除该条记录？</p>
				    </div>
				    <div class="modal-footer">
				        <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
				        <button class="btn btn-danger del-sub" data-dismiss="modal">删除</button>
				    </div>
				</div>

			</div>
		</div>

</body>
</html>
