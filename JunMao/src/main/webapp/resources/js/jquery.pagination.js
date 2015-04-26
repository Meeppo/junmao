;(function($){
	
	$.fn.extend({
		pagination : function(setting){
			
			var opts = $.extend({},$.fn.pagination.defaults,setting);
			//当前页
			var currentPage = Math.ceil(opts.offset/opts.pageSize) +1;
			
			//总页数
			var totalPage = Math.ceil(opts.total/opts.pageSize);
		
			//创建首页按钮
			$(this).append("<li><a href='"+ $.fn.pagination._getUrl(0,opts) +"'>首页</a></li>");
		
			//创建上一页按钮
			if(currentPage == 1){
				$(this).append("<li class='disabled'><a>上一页</a></li>");
			}else{
				$(this).append("<li><a href='"+ $.fn.pagination._getUrl(opts.offset-opts.pageSize,opts) +"'>上一页</a></li>");
			}
			
			//创建页码按钮
			if(totalPage < 5){
				for(var i = 0;i < totalPage;i++){
					$(this).append("<li><a href='"+ $.fn.pagination._getUrl(i*opts.pageSize,opts) +"'>" + (i +1) + "</a></li>");
				}
			}else{
				if(currentPage > 5){
					$(this).append("<li><a>...</a></li>");
					var end = currentPage + 2;
					if(end > totalPage){
						end = totalPage;
					}
					for(var i = currentPage - 3;i< end;i++){
						$(this).append("<li><a href='"+ $.fn.pagination._getUrl(i*opts.pageSize,opts) +"'>" + (i +1) + "</a></li>");
					}
					if((totalPage - currentPage) > 3){
						$(this).append("<li><a>...</a></li>");
					}
				}else{
					for(var i = 0;i < 6;i++){
						$(this).append("<li><a href='"+ $.fn.pagination._getUrl(i*opts.pageSize,opts) +"'>" + (i +1) + "</a></li>");
					}
					$(this).append("<li><a>...</a></li>");
				}
			}
			//标记当前页
			$(this).find("a").each(function(index,element){
				if($(this).text()== currentPage){
					$(this).parent().addClass("active");
				}
			});
			//创建下一页按钮
			if(currentPage == totalPage){
				$(this).append("<li class='disabled'><a>下一页</a></li>");
			}else{
				$(this).append("<li><a href='"+ $.fn.pagination._getUrl(opts.offset+opts.pageSize,opts) +"'>下一页</a></li>");
			}
			//创建末页
			$(this).append("<li><a href='"+ $.fn.pagination._getUrl(opts.pageSize * (totalPage -1),opts) +"'>末页</a></li>");
		}});
	
	$.extend($.fn.pagination,{
		_getUrl:function(offset,opts){
			if(opts.url.indexOf("?") != -1){
				return opts.url + "&pageSize="+ opts.pageSize +"&pageOffset=" + offset;
			}else{
				return opts.url + "?pageOffset=" + offset + "&pageSize="+ opts.pageSize; 
			}
		}
		
	});
	$.fn.pagination.defaults = {
			url:null,
			offset:null,
			total:null,
			pageSize:10
	};
	
	
})(jQuery);
