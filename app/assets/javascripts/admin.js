var Admin = function() {

    return {
             initPopUp : function(){
                 $('a[data-popup=true]').click(function(e){
                    e.preventDefault();
                    window.open($(this).attr('href'));
                 })
             }
    }
}();