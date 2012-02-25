module ActiveRecord
  module Acts
    module Sluggy
      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def has_slug(options = {})
          configuration = { :attribute => "title", :to_param => "slug", :to_url => "parameterize" }
          configuration.update(options) if options.is_a?(Hash)

          before_save :update_slug
          to_param = case configuration[:to_param]
          when :id_slug
            "id.to_s + '-' + slug"
          else
            configuration[:to_param]
          end
            class_eval <<-EOV
            def to_param
              #{to_param}
            end

            def update_slug
              self.slug = self.#{configuration[:attribute]}.#{configuration[:to_url]}
            end
            EOV
          end
        end
      end
    end
  end
