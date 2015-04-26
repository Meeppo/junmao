<%@include file="../../comm/comm.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root }/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${root}/resources/css/uploadstyle.css">
<script type="text/javascript" src="${root }/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${root }/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${root }/resources/js/upload/vendor/jquery.ui.widget.js"></script>

<script type="text/javascript" src="${root }/resources/js/upload/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${root }/resources/js/upload/jquery.fileupload.js"></script>
<script src="${root }/resources/js/upload/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="${root }/resources/js/upload/jquery.fileupload-image.js"></script>
<!-- The File Upload audio preview plugin -->
<script src="${root }/resources/js/upload/jquery.fileupload-audio.js"></script>
<!-- The File Upload video preview plugin -->
<script src="${root }/resources/js/upload/jquery.fileupload-video.js"></script>
<!-- The File Upload validation plugin -->
<script src="${root }/resources/js/upload/jquery.fileupload-validate.js"></script>
<!-- The File Upload user interface plugin -->
<script src="${root }/resources/js/upload/jquery.fileupload-ui.js"></script>
</head>
<style>
	
	<style>
	body{
		font-size:12px;	
	}
	.dropdown-menu{
		cursor: pointer;
	}
	
</style>
<body>
<div class="container-fluid">
    <div class="yunfile-toolbar">
        <button id="addFile" class="fileinput-button btn btn-primary">
            <i class="glyphicon glyphicon-plus"></i>
            <span>上传图片</span>
            <input id="fileupload" type=file  multiple name="files" />
        </button>
      
        <div class="pull-right browser-type">
            <a  data-target="#yunfile-list-view" class="active">
            	<i class="glyphicon glyphicon-th-large"></i>
            </a>
            <a  data-target="#yunfile-thumbnail">
            	<i class="glyphicon glyphicon-list"></i>
             </a>
        </div>
        
    </div>
    <div class="clearfix"></div>
    <div class="yunfile-view">
        <div class="yunfile-crumbs">
            <span class="pull-left">全部文件</span>
            <span class="pull-right">共${fn:length(sources)}个文件</span>
        </div>
        <div class="clearfix"></div>
        <div id="yunfile-list-view" class="yunfile-content" >
            <div class="well yunfile-list-toolbar">
            	<ul>
                	<li class="col-md-7" style="padding-left: 10px;">
                		<div class="checkbox-area">
                			<div class="yunfile-checkbox chk-global"></div>
                		</div>
                		<span class="unselected">文件名</span>
                		<div class="selected">
	                		<span data-info="selected-info"></span>
	                		<a class="yunfile-download btn btn-default btn-sm">
	                    		<i class="glyphicon glyphicon-save"></i>
	                           	 下载
	                        </a>
	                        <a class="yunfile-delete btn btn-default btn-sm">
	                            <i class="glyphicon glyphicon-trash"></i>
	                       	        删除
	                        </a>
                        </div>
                	</li>
                    <li class="unselected col-md-2">
                    	<span>大小</span>
                    </li>
                     <li class="unselected col-md-3 text-center">
                       	<span> 创建日期</span>
                    </li>
                </ul>
            </div>
            <div class="yunfile-list-content">
            <c:forEach items="${sources }" var="var" >	
            	<div class="yunfile-item" data-id="${var.id }">
                	<div  class="item-td col-md-7">
                    	<span class="checkbox-area">
                    		<span class="yunfile-checkbox"></span>
                        </span> 
                        <span data-property="name" >${var.name }</span> 
                        <div class="item-rename-bar" style="display: none;">
                        	<input type="text" class="rename-input bar" value="${var.name }"/>
                        	<a class="text-success bar rename-ok"><i class="glyphicon glyphicon-ok"></i></a>
                        	<a class="text-danger bar rename-cancel"><i class="glyphicon glyphicon-remove"></i></a>
                        </div> 
                         <div class="item-bar pull-right" >  
	                        <div><a class="item-download" href="${var.url }"><i class="glyphicon glyphicon-download-alt"></i></a></div>
	                        <div class="dropdown">
	                        	<a class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-download"></i></a>
	                            <ul class="dropdown-menu">
	                            	<li><a class="item-rename" >重命名</a></li>
	                                <li><a class="item-copylink" data-url="${var.url }">复制链接</a></li>
	                               
	                            </ul>
	                        </div>
						</div> 
                    </div>
                    <div  class="item-td col-md-2" data-property="size">${fn:substringBefore(var.size/1024,".") }KB</div>
                    <div style="text-align:center;" class="item-td col-md-3">${var.createddate }</div>
                </div>
             </c:forEach>   
      
            </div>
           
    	</div>
		<div id="yunfile-thumbnail" class="yunfile-content" style="display:none;">
            <div class="well yunfile-list-toolbar">
            <ul>
                <li class="col-md-7" style="padding-left: 10px;">
                		<div class="checkbox-area">
                			<div class="yunfile-checkbox chk-global"></div>
                		</div>
                		<div class="selected">
	                		<span data-info="selected-info"></span>
	                		<a class="yunfile-download btn btn-default btn-sm">
	                    		<i class="glyphicon glyphicon-save"></i>
	                           	 下载
	                        </a>
	                        <a class="yunfile-delete btn btn-default btn-sm">
	                            <i class="glyphicon glyphicon-trash"></i>
	                       	        删除
	                        </a>
                        </div>
                </li>
            </ul>
            </div>
            <div class="yunfile-list-content">
            <c:forEach items="${sources }" var="var" >
            	<div class="yunfile-item" data-id="${var.id }">
                	
                    <span class="checkbox-area">
                    	<span class="yunfile-checkbox"></span>
                    </span> 
                    <div class="item-img">   
                    	<img src="${var.url}"/>
                    </div>
                	<div class="img-bar">
                        <a class="item-copylink" data-url="${var.url }"><span class="glyphicon glyphicon-paperclip"></span></a>
                        <a href="/JunMao/yun/download?id=${var.id }"><span class="glyphicon glyphicon-download"></span></a>
                    </div>
                </div>
             </c:forEach>
              
            </div>
        </div>
        
         <!-- upload panel -->
		 <div class="panel panel-primary" id="uploadPanel" style="display: none;">
		    <div class="panel-heading">
		      <span class="close" >X</span>
		      <h4 class="panel-title">
		        		 上传文件
		          
		      </h4>
		      
		    </div>
		    <div id="uploadPanelBody" class="panel-collapse collapse in">
		      <ul class="list-group">
		      	
		      </ul>
		    </div>
		  </div>
		
		</div>
		<!-- download form -->
		<form method="post"  class="hidden" id="yunForm">
			<input type="text" name="id" />
		</form>
		
		<!-- copy link modal-->
		<div class="modal fade" id="copyLinkModal" data-backdrop="static" tabindex="-1" aria-hidden="true" >
			<div class="modal-dialog" style="z-index: 9999;">
				<div class="modal-content">
					<div class="modal-header">
						<button class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							浏览器不支持复制，请手动复制
						</h4>
					</div>
					<div class="modal-body"></div>
				</div>
			</div>
		</div>
		
</div>



<script>
	$(".browser-type a").click(function(e){
			$(".browser-type a").each(function(index){
				if(e.currentTarget == this){
					$(this).addClass("active");
				}else{
					$(this).removeClass("active");
				}
			});
			
			var target = $(this).attr("data-target");
			$(".yunfile-content").each(function(index, element) {
                if("#" + $(element).attr("id") ==  target){
					$(element).show();
					
				}else{
					$(element).hide();	
					
				}
            });
	});


	//download
	$(".yunfile-download").click(function(){
		var items = $(this).parents(".yunfile-content").find("[data-id][data-checked=checked]");
		var ids = [];
		items.each(function(index,element){
			ids.push($(element).attr("data-id"));
		});
		$("#yunForm").attr("action","/JunMao/yun/download")
		$("#yunForm input").val(ids);
		$("#yunForm").submit();
	});
	//delete
	$(".yunfile-delete").click(function(){
		var items = $(this).parents(".yunfile-content").find("[data-id][data-checked=checked]");
		var ids = [];
		items.each(function(index,element){
			ids.push($(element).attr("data-id"));
		});
		$.post("/JunMao/yun/delete",{"id":ids.toString()},function(data){
			if(data == "0"){
				$("[data-checked=checked]").remove();
			}else{
				alert("删除失败");
			}
		},"text"); 

		
	});
	
	//copy link
	$(".yunfile-view").on("click",".item-copylink",function(){

		var src = $(this).attr("data-url");
		 if (window.clipboardData){
	            window.clipboardData.setData("Text", src)
	     } 
	     else {
				$("#copyLinkModal .modal-body").text(src);
				$("#copyLinkModal").modal("show");
		 }
	});
	//rename
	$(".yunfile-view").on("click",".item-rename",function(){

		$(this).parents(".yunfile-item").find(".item-rename-bar").css("display","inline-block");
		$(this).parents(".yunfile-item").find("[data-property=name]").css("display","none");
		$(this).parents(".yunfile-item").find(".item-rename-bar input").focus();
	});
	$(".yunfile-view").on("click",".rename-cancel",function(){

		$(this).parent().css("display","none");
		$(this).parent().prev().css("display","inline-block");
	});
	$(".yunfile-view").on("click",".rename-ok",function(){
		var item = $(this).parents(".yunfile-item");
		var id = item.attr("data-id");
		var old = item.find("[data-property=name]").text();
		var newname = $(this).prev("input").val();
		if(old != newname){
			$.post("/JunMao/yun/rename",{id:id,newName:newname},function(data){
				if(data == "0"){
					item.find("[data-property=name]").text(newname);
					alert("修改成功");
				}else{
					alert("修改失败");
				}
			},"text");
		}
	});
	
	$(".yunfile-view").on("click",".yunfile-checkbox",function(e,data){
		
		
		if($(this).hasClass("chk-global")){
			$(this).toggleClass("checked");	
			
			//checked all or no checked
			if($(this).hasClass("checked")){
				$(".yunfile-view .yunfile-checkbox").addClass("checked");
				$(".yunfile-view .yunfile-item").attr("data-checked","checked");
			}else{
				$(".yunfile-view .yunfile-checkbox").removeClass("checked");
				$(".yunfile-view .yunfile-item").removeAttr("data-checked","checked");
			}

		}else{

			var dataId = $(this).parents(".yunfile-item").attr("data-id");

			var _this = $("[data-id="+ dataId +"]");
			
			_this.find(".yunfile-checkbox").each(function(index,element){
		
				$(this).toggleClass("checked");	
				var item = $(this).parents(".yunfile-item");

				if(item.attr("data-checked") === undefined){
					item.attr("data-checked","checked");
				}else{
					item.removeAttr("data-checked");	
				}
		
				//check or not check global check button
				var content =  $(this).parents(".yunfile-content");
				var selectCount = content.children(".yunfile-list-content").find(".yunfile-checkbox.checked").size();
		
				var allCount = content.children(".yunfile-list-content").find(".yunfile-checkbox").size()
				if(selectCount == allCount){
					content.find(".yunfile-checkbox.chk-global").addClass("checked");
				}else{
					content.find(".yunfile-checkbox.chk-global").removeClass("checked");	
				}	
			
			});

		}
		//show or hide toolbar
		if($(".yunfile-list-content").find(".yunfile-checkbox.checked").size() != 0){
			$(".yunfile-list-toolbar ul .selected").css("display","inline-block");
			$(".yunfile-list-toolbar ul .unselected").css("display","none");
			//show select info
			var content =  $(this).parents(".yunfile-content");
			var selectCount = content.children(".yunfile-list-content").find(".yunfile-checkbox.checked").size();
		
			$(".yunfile-view").find("[data-info=selected-info]").text("共选中"+(selectCount)+"个文件");
		}else{
			$(".yunfile-list-toolbar ul .unselected").css("display","inline-block");
			$(".yunfile-list-toolbar ul .selected").css("display","none");

		}
	});
	

	//列表事件
	$("#yunfile-list-view").on("mouseover mouseout",".yunfile-item",function(e){
		if(e.type == "mouseover"){
			$(this).addClass("active").find(".item-bar").css("display","block");
		}else if(e.type == "mouseout"){
			$(this).removeClass("active").find(".item-bar").css("display","none");
		}
	});
	//缩略图展示
	$("#yunfile-thumbnail").on("mouseover mouseout",".yunfile-item",function(e){
			if(e.type == "mouseover"){
				$(this).children(".img-bar").css("display","block");
			}else if(e.type == "mouseout"){
				$(this).children(".img-bar").css("display","none");
			}
		});
	

 	$('#fileupload').fileupload({
		dropZone:$(".yunfile-content"),
		url:"/JunMao/yun/upload",
		maxFileSize: 5000000,
        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
		autoUpload:false,
		progress: function (e, data) {
	        var rate = parseInt(data.loaded / data.total * 100, 10);
	      	data.context.progress.rate(rate+"%");
	    },
	     add: function (e, data) {

		     data.context = function(){
				var com = $("<li class='list-group-item'></li>");
				var row = $('<div class="row"></div>').appendTo(com);
				//draw upload file name
				com.name = $('<div class="col-md-2"></div>').appendTo(row).text(data.files[0].name);
				com.size = $('<div class="col-xs-offset-1 col-md-1"></div>').appendTo(row).text(parseInt(data.files[0].size/1024) + "kb");
				//draw upload progress bar
				var progressCom = $('<div class="col-md-5 "></div>').appendTo(row);
				com.progress = $('<div class="progress progress-striped" style="display: none;"></div>').appendTo(progressCom);
				com.progress.bar = $('<div class="progress-bar progress-bar-success" style="width: 0%;">0%</div>').appendTo(com.progress);
				com.progress.rate = function(width){
					if(width == undefined){
						return com.progress.bar.css("width");
					}else{
						com.progress.bar.css("width",width);
						com.progress.bar.text(width);
					}
				}
				//draw upload button
				com.btnCom = $('<div class="col-md-3"></div>').appendTo(row);
				com.submit = $('<button class="btn btn-primary btn-sm submit">上传</button>').appendTo(com.btnCom);
				com.cancel = $('<button class="btn btn-warning btn-sm cancel" style="display:none;">取消</button>').appendTo(com.btnCom);
				//realease resource
				com.finalize = function(){
					com.submit.remove();
					com.cancel.remove();
				};
				return com;
    		 }();

    		 data.context.appendTo("#uploadPanelBody .list-group");   
			 data.context.submit.click(function(e){
				
				data.context.progress.css("display","block"); 
				data.context.cancel.show();
				var jqhr = data.submit();
				data.context.cancel.click(function(e){
					jqhr.abort();
				});
			 });

			 $("#uploadPanel").show();
        }, 
        done: function (e, data) {
            data.context.finalize();
            data.context.btnCom.addClass("text-success").text("上传成功");

            $.each(data.result,function(index ,file){

				//draw file content list
				var item = $('<div class="yunfile-item" data-id="'+ file.id +'">'+
		                   '<span class="checkbox-area">'+
	                    	'<span class="yunfile-checkbox"></span>'+
	                    '</span> '+
	                    '<div class="item-img">   '+
	                    	'<img src="'+ file.url +'"/>'+
	                    '</div>'+
	                	'<div class="img-bar">'+
	                     ' <a class="item-copylink" data-url="'+ file.url +'"><span class="glyphicon glyphicon-paperclip"></span></a>'+
                        '<a href="/JunMao/yun/download?id='+ file.id +'"><span class="glyphicon glyphicon-download"></span></a>'+
	                   ' </div>'+
	               ' </div>');
				$("#yunfile-thumbnail .yunfile-list-content").append(item);	

				var listItem = $('<div class="yunfile-item" data-id="'+ file.id +'">'+
						'<div  class="item-td col-md-7">'+
            	'<span class="checkbox-area">'+
            		'<span class="yunfile-checkbox"></span>'+
                '</span> '+
               ' <span data-property="name" >'+ file.name +'</span> '+
               ' <div class="item-rename-bar" style="display: none;">'+
                	'<input type="text" class="rename-input bar" value="'+ file.name +'"/>'+
                	'<a class="text-success bar rename-ok"><i class="glyphicon glyphicon-ok"></i></a>'+
                	'<a class="text-danger bar rename-cancel"><i class="glyphicon glyphicon-remove"></i></a>'+
               ' </div> '+
                 '<div class="item-bar pull-right" >  '+
                    '<div><a class="item-download" href="'+ file.url +'"><i class="glyphicon glyphicon-download-alt"></i></a></div>'+
                   ' <div class="dropdown">'+
                    	'<a class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-download"></i></a>'+
                       ' <ul class="dropdown-menu">'+
                        	'<li><a class="item-rename" >重命名</a></li>'+
                           ' <li><a class="item-copylink" data-url="'+ file.url +'">复制链接</a></li>'+
                       ' </ul></div></div></div>'+
                    '<div  class="item-td col-md-2" data-property="size">'+ parseInt(file.size/1024) +'KB</div>'+
                    '<div style="text-align:center;" class="item-td col-md-3">'+ file.createddate +'</div>'+
                '</div>');
				$("#yunfile-list-view .yunfile-list-content").append(listItem);
				
            });
        },
        fail:function(e ,data){
        	data.context.cancel.hide();
        	data.context.cancel.unbind("click");
        	data.context.btnCom.addClass("text-danger").append("上传失败");
        },
        always:function(e ,data){
			
        }
	});

 	 
	$(document).bind('drop dragover', function(e) {
		e.preventDefault();
	});

	/**
	*	upload panel slide toggle	
	*/
	$("#uploadPanel .panel-title").click(function(){
		$("#uploadPanelBody").slideToggle("fast");	
	});
	/**
	*	bind upload panel close event
	*/
	$("#uploadPanel").on("click",".close",function(){
		$("#uploadPanel").hide();
	});
</script>


</body>
</html>