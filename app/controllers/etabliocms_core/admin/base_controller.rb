module EtabliocmsCore
  module Admin
    class BaseController < ::ApplicationController

      before_filter :authenticate_etabliocms_core_user!

      layout "admin"

      helper "etabliocms_core/admin/table_tree"

    end
  end
end
