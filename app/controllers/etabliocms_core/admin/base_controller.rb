module EtabliocmsCore
  module Admin
    class BaseController < ::ApplicationController

      before_filter :authenticate_etabliocms_core_user!

      layout "admin"

      helper "etabliocms_core/admin/table_tree"
      helper "etabliocms_core/admin/nested_fields"

    end
  end
end
