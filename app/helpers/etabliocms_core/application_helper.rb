module EtabliocmsCore

  module ApplicationHelper

    include OutputHelper
    include PagesHelper

    def add_breadcrumb(title, url = nil)
      @breadcrumbs << OpenStruct.new(:title => title, :url => url)
    end

    def set_title_and_breadcrumb(title, breadcrumb_text = nil, url = nil)
      set_title title
      breadcrumb_text ||= title
      add_breadcrumb breadcrumb_text, url
    end

    def set_title(page_title)
      content_for(:title) { page_title }
    end

    def set_description(page_description)
      content_for(:description) { page_description }
    end

    def body_class
      qualified_controller_name = controller.controller_path.gsub('/', '-')
      "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"
    end

    def render_sidebar?
      return false if params[:action] == 'index' && params[:controller] == 'pages'
      return false if params[:action] == 'search' && params[:controller] == 'pages'
      return false if params[:controller] == 'devise/sessions'
      true
    end

    def other_locale
      case I18n.locale.to_s
        when 'cs'
          'en'
        when 'en'
          'cs'
        else
          'cs'
      end
    end

  end
end