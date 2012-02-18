//= require jquery
//= require jquery_ujs
//= require_tree ../../../vendor/assets/javascripts/
//= require ../../../vendor/assets/javascripts/markitup/jquery.markitup.pack
//= require ../../../vendor/assets/javascripts/markitup/sets/textile/set
//= require_self
//= require shared

var Admin = function() {

    return {
        initPopUp : function() {
            $('a[data-popup=true]').click(function(e) {
                e.preventDefault();
                window.open($(this).attr('href'));
            })
        }
    }
}();
