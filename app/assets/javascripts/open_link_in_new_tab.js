/**
 * Created by maud on 03-9-16.
 */

$(document).on('turbolinks:load', function() {
    $( 'a[href^="http"]' ).attr( 'target','_blank' );
});
