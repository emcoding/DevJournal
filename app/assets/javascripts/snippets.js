/**
 * Created by maud on 03-9-16.
 */

$(document).on('click', '.snippet-card-clickable', function(event) {
    window.location = this.getAttribute("data-snippet-url");
});

$(document).on('click', '.snippet-card a', function(event) {
    event.stopPropagation();
});

$(document).on('turbolinks:load', function() {
    $( 'a[href^="http"]' ).attr( 'target','_blank' );
});



