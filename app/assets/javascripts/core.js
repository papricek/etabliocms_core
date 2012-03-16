var Admin = function() {

    return {
        initPopUp : function() {
            $('a[data-popup=true]').click(function(e) {
                e.preventDefault();
                window.open($(this).attr('href'));
            })
        },

        hideAndDestroyFields : function(self) {
            var $self = $(self);
            $self.closest(".field   ").hide().
                find("input[type=hidden]").val("1");
        },

        addFields : function(selector, content, association) {
            var object_id = new Date().getTime().toString().substring(5);
            var regexp = new RegExp("new_" + association, "g");
            content = content.replace(regexp, object_id);

            content = $(content);
            content.find("input[data-kind=position]").val(object_id);
            $('label', content).each(function(i) {
                var id = 'id-' + new Date().getTime() + i;
                $(this).attr('for', id).next().find('select:enabled, input:enabled').attr('id', id);
                $(this).next('input, textarea, select').attr('id', id);
            });

            $(selector).append(content);
        }
    }
}();