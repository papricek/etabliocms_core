Rails.application.routes.draw do

  devise_for :"etabliocms_core/users", :path => ""

  match "/admin", :to => "etabliocms_core/admin/static#index"
  match "/admin/textile_parser", :to => "etabliocms_core/admin/static#textile_parser", :as => "textile_parser"
  match "/admin/textile_help", :to => "etabliocms_core/admin/static#textile_help", :as => "admin_textile_help"

  scope :module => "etabliocms_core" do
    namespace :admin do
      resources :users
    end
  end

end
