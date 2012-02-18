module EtabliocmsCore
  class ApplicationController < ActionController::Base

    before_filter :setup_breadcrumbs, :setup_locale

    def setup_breadcrumbs
      @breadcrumbs ||= []
    end

    def setup_locale
      I18n.locale = I18n.default_locale
      I18n.locale = params[:locale] if params[:locale].present?
    end

    def after_sign_in_path_for(resource_or_scope)
      admin_path
    end
  end
end
