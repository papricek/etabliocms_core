class ApplicationController < ActionController::Base
  protect_from_forgery

    #TODO: place this somewhere to ApplicationController.class_eval in etabliogem
  def after_sign_in_path_for(resource_or_scope)
    admin_path
  end
end
