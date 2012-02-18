var Shared = function() {

    return {
        initFlashClose : function() {
            $("#flash .flash-close").click(function(e) {
                e.preventDefault();
                $(this).closest("p").fadeOut();
            });
        }

    }
}();