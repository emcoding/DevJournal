/**
 * Created by maud on 03-9-16.
 */

$(document).on('turbolinks:load', function() {

    //open links on new tab
    $( 'a[href^="http"]' ).attr( 'target','_blank' );

    //click within card area to edit snippet
    $('.snippet-card').on('click', function(event) {
        if ( !$(event.target).is('#snippet_content'|| 'input') ) {

            window.location = this.getAttribute("data-snippet-url");
        }
    });

});



