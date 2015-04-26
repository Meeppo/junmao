;(function($){
	
	$.extend($.fn.dataTable.defaults,{
		
		paging : true,
		ordering : true,
		processing : true,
		searching : true,
		pageLength : 10,
		lengthChange : false,
		info : false,
		columnDefs: [{"name":"id", "visible": false, "targets": 0 }]
	});
	
	
	

	
})(jQuery);

	
	function addDeleteListener(table,source){

		
		$(".del-sub").click(function(){
			
			var id = table.row(".selected").data()[0];
			
			$.ajax({

				url:source.url + "/" + id,
				data:source.data,
				type:source.type,
				dataType:"text",
				success:function(data){
					alert(data)
					if(data == "0"){
						if(source.success){
							source.success();
						}
						table.row(".selected").remove().draw(false);
					}
					
				}
			});
			
			
			
		});
	}
	
	
	function addUpdateListener(){
		
		
	}
	
	//to view with dbclick
	function toView(table,view){
		
		if(view.has){

			var id = table.row(".selected").data()[0];
			window.location.href = view.url + "/" + id;
		}

	}
	
	function init(table,options){
		
		var defaults = {
			
			update : {
				has : true,
				url : "",
				success : null
			},
			view :{
				has : false,
				url : "",
				success : null
			},
			del :{
				has : true,
				url :"",
				data : {},
				type : "get",
				success : null
			}
		};
		
		var opts = $.extend(true,{},defaults,options);
		
		//select row
		$(table.table().body()).on("click","tr",function(event){
			if($(this).hasClass("selected")){
				$(this).removeClass("selected");
			}else{
				table.$("tr.selected").removeClass("selected");
				$(this).addClass("selected");
			}
			if(event.target.nodeName.toUpperCase() == "TD"){
				toView(table,opts.view);
			}
			
		});
		
		//add delete listener
		if(opts.del.has){
			addDeleteListener(table,opts.del)
		}
		//add update listener
		if(opts.update.has){
			addUpdateListener(table,opts.update);
		}
		
	
		
		
		
		
		
		
		
	}