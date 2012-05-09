module EtabliocmsCore
  module Admin
    module NestedFieldsHelper

      def link_to_add_fields(name, f, association, target, options = {})
        new_object = f.object.class.reflect_on_association(association).klass.new
        fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
          render(association.to_s.singularize + "_fields", :builder => builder)
        end
        link_to_function(name,
                         "Admin.addFields('#{target}', '#{escape_javascript(fields)}', '#{association}')",
                         options).html_safe
      end

      def link_to_remove_fields(name, f)
        f.hidden_field(:_destroy) + link_to_function(name, "Admin.hideAndDestroyFields(this)", :class => "link-to-destroy-fields")
      end

    end
  end
end
