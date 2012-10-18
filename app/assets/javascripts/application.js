$().ready(function(){
	
	if ($('.search-verse')) {
		$('.verse-to-search').keydown(function(e){
			if (e.which == 13) {
				$('.search-verse').trigger('click');
				e.preventDefault();
				e.stopPropagation();
			}
		});
		$('.search-verse').click(function(e){
			$(this).html('searching...').attr({disabled: true});
			$.post('/verse/search.json',{ 
				criteria: $('.verse-to-search').val() ,
				authenticity_token: $('input[name="authenticity_token"]').val(),
				version: $('button.active')[0].innerHTML
			}, function(r){
				$('.search-verse').html('Search!').attr({disabled: false});
				if (r.error) {
					$('.passage_holder').html('Couldn\'t connect with es.biblesearch.org')
							.addClass('error');
						$('.verse-to-search').val('');
				} else {
					if (typeof r.result[0].passages[0].passage == 'undefined') {
						$('.passage_holder').html('Sorry, but cannot find the verse you\'ve entered')
							.addClass('error');
						$('.verse-to-search').val('');
					} else {
						$('#note_verse').val(r.result[0].passages[0].passage[0].text_preview);
						$('.passage_holder').html(r.result[0].passages[0].passage[0].text_preview);
						$('.hidden').css({visibility:'visible'}).show();
						$('input[type="submit"]').attr({disabled: false});
					}
				}
			},'json');
		});
		$('.btn-group').button()
	}

	$('.dropdown-toggle').dropdown()

});