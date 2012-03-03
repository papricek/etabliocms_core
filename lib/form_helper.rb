module ActionView
  module Helpers
    module FormOptionsHelper

      DEFAULT_TEXTAREA_WIDTH = 550
      DEFAULT_TEXTAREA_HEIGHT = 200

      def boolean_yes_no_select(object_name, method, options = {}, html_options = {})
        choices = [
          ['Ano', true],
          ['Ne', false],
        ]
        InstanceTag.new(object_name, method, self, options.delete(:object)).to_select_tag(choices, options, html_options)
      end

      def textile_text_area(object_name, method, options = {})
        html = InstanceTag.new(object_name, method, self, options.delete(:object)).to_text_area_tag(options)
        id = options[:id] || "#{object_name}_#{method}"
        html << javascript_tag do
          %Q(
                  $(function() {
                      $('##{id}').markItUp(mySettings);
                  });
              )
        end
        html
      end
    end

    class FormBuilder
      def boolean_yes_no_select(method, options = {}, html_options = {})
        @template.boolean_yes_no_select(@object_name, method, objectify_options(options), @default_options.merge(html_options))
      end

      def textile_text_area(method, options = {}, html_options = {})
        @template.textile_text_area(@object_name, method, objectify_options(options))
      end
    end
  end
end
