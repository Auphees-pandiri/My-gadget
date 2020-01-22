jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});

$(document).on('turbolinks:load', function(){
    $( "#Subscribed-items" ).on( "click", function( event ) {
	    event.preventDefault();
	    $('#sub-items').fadeToggle(1000);
	});
	$( "#friend-items" ).on( "click", function( event ) {
	    event.preventDefault();
	    $('#friend-section').fadeToggle(1000);
	});
})

