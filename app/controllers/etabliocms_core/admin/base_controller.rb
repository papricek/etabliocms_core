module EtabliocmsCore
  module Admin
    class BaseController < ::ApplicationController

      before_filter :authenticate_user!

      layout "admin"

      helper "admin/table_tree"

      def set_locale
        I18n.locale = I18n.default_locale
      end
    end
  end
end
