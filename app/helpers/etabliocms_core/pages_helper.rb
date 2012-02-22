module EtabliocmsCore::PagesHelper

  def render_tree(nodes = [])
    html = ""
    nodes.select { |node| node.visible }.each do |node|
      html << "<li class='#{'no-divider' if node == nodes.last && node.level == 0 }'>"
      html << page_link(node)
      html << render_tree(node.children) if node.children.present? && actual?(node)
      html << "</li>"
    end
    content_tag(:ul, html.html_safe)
  end

  def page_link(node)
    link_to(node.title, node.url.present? ? node.url : page_path(node),
            :class => node_class(node),
            :style => "padding-left: #{node.level*10 + 15}px").html_safe
  end

  def actual?(node)
    if node.url.present?
      (node.url =~ /zeptejte-se/ && params[:controller] == 'questions') || false
    else
      @page.present? ? @page.self_and_ancestors.include?(node) : false
    end

  end

  def node_class(node)
    actual?(node) ? 'active' : 'inactive'
  end

end
