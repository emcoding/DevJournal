#/**
# * Created by maud on 10-8-16.
#// */

$(document).on "turbolinks:load", ->
    anchors.options = {
        placement: 'right'
    }
    anchors.add('#snip-title h6')