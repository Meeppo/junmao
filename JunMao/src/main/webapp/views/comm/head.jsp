<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header_bg"><!-- start header -->
	<div class="container">
		<div class="row header">
		<nav class="navbar navbar-default" role="navigation">
		 
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <a class="navbar-brand" href="index.html"><img src="../resources/source/images/logo.jpg" alt="" class="img-responsive"/> </a>
		    </div>
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="nav-content">
		      <ul class="menu nav navbar-nav navbar-left ">
		        <li class="${index? 'active':''}"><a href="${root}/nav/index">首页</a></li>
		        <li class="${current_page eq '产品介绍'?'active':''}"><a href="${root }/nav/products">产品介绍</a></li>
		        <li class="${current_page eq '关于我们'?'active':''}"><a href="${root }/nav/about">关于我们</a></li>
		        <li class="${current_page eq '联系我们'?'active':''}"><a href="${root }/nav/concat">联系我们</a></li>
		      </ul>

             <form class="navbar-form navbar-right" role="search">
		      
                	<div class="input-group my_search">
                    	<input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">
                    	<button type="submit" class="btn btn-default">
                        	<span class="glyphicon glyphicon-search"></span>
                        </button>
                    	</span>
                    </div>
                
		      </form>
            </div>
		 
		</nav>
		</div>
		<c:if test="${not index}">
			<ol class="breadcrumb">
				  <li><a href="${root }/nav/index">首页</a></li>
				  <li class="active">${current_page }</li>
				</ol>
		</c:if>
		<c:if test="${index}">
		<div class="row slider text-center">
				<div class="col-md-8">
					<div class="col-md-10 slider_text">
						<h2></h2>
						<h3></h3>
					</div>
				</div>
				<div class="col-md-4">
					<div class="slider_img">
						<img src="../resources/source/images/pic1.png" alt="" class="img-responsive"/>
					</div>
				</div>
		</div>
		</c:if>
	</div>
</div>