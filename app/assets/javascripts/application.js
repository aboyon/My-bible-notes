$().ready(function(){
	
	if ($('.search-verse')) {
		$('.verse-to-search').keydown(function(e){
			if (e.which == 13) {
				$('.search-verse').trigger('click');
				e.preventDefault();
			}
		});
		$('.search-verse').click(function(e){

			$.post('/verse/search.json',{ criteria: $('.verse-to-search').val() }, function(r){
				alert(r);
			},'json');
		});
	}

});