module EtabliocmsCore
  class BaseController < ::ApplicationController

    before_filter :authenticate_etabliocms_core_user!

    layout "admin"

    helper "admin/table_tree"

  end
end
