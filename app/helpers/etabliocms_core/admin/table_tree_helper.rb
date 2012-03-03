module EtabliocmsCore
  module Admin
    module TableTreeHelper

      def render_table_tree(items = [])
        stack = []
        html = ""
        items.each do |node|
          if stack.empty?
            html << item_html(node, stack)
            stack.push(node)
            next
          end
          if stack.last.lft < node.lft && node.lft < stack.last.rgt
            if node.leaf?
              html << item_html(node, stack)
            else
              html << item_html(node, stack)
              stack.push(node)
            end
            if node.rgt + 1 == stack.last.rgt
              stack.pop
            end
          else
            stack.pop
            redo
          end
        end
        html.html_safe
      end

      def item_html(item, stack)
        html = [
            link_to(item.title, edit_path(item), :style => "padding-left:#{stack.size*10}px"),
            content_tag(:span, I18n.l(item.created_at, :format => :short), :class => "centered"),
            content_tag(:span, item.locale, :class => 'centered'),
            actions_links(item, stack.last)
        ].inject("") { |line, cell_content| line + content_tag(:td, cell_content) }
        content_tag(:tr, html.html_safe)
      end

      def actions_links(item, parent)
        links = [
            link_to(I18n.t('admin.edit'), edit_path(item),
                    :class => "icon icon-edit",
                    :title => I18n.t('admin.edit')),
            link_to(I18n.t('admin.destroy'), destroy_path(item),
                    :method => :delete,
                    :confirm => t("#{item.class.to_s.demodulize.underscore}.destroy_confirmation"),
                    :class => 'icon icon-destroy', :title => I18n.t('admin.destroy'))
        ]
        unless item.is_first_of_siblings?(parent)
          links << link_to(I18n.t('hierarchy.up'), move_path(item, "move_higher"),
                           :method => :put,
                           :class => "icon icon-up",
                           :title => I18n.t('hierarchy.up'))
          links << link_to(I18n.t('hierarchy.top'), move_path(item, "move_to_top"),
                           :method => :put,
                           :class => "icon icon-up-up",
                           :title => I18n.t('hierarchy.top'))
        end

        unless item.is_last_of_siblings?(parent)
          links << link_to(I18n.t('hierarchy.down'), move_path(item, "move_lower"),
                           :method => :put,
                           :class => "icon icon-down",
                           :title => I18n.t('hierarchy.down'))
          links << link_to(I18n.t('hierarchy.bottom'), move_path(item, "move_to_bottom"),
                           :method => :put,
                           :class => "icon icon-down-down",
                           :title => I18n.t('hierarchy.bottom'))
        end
        links.join("").html_safe
      end

      def edit_path(item)
        send "edit_admin_#{item.class.to_s.demodulize.underscore}_path", item.id
      end

      def destroy_path(item)
        send "admin_#{item.class.to_s.demodulize.underscore}_path", item.id
      end

      def move_path(item, method)
        send "move_admin_#{item.class.to_s.demodulize.underscore}_path", {:id => item.id, :method => method}
      end

    end
  end
end
