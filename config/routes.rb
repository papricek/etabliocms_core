Rails.application.routes.draw do

  devise_for :"etabliocms_core/users", :path => ""

  match "/admin", :to => "admin/static#index"
  match "/admin/textile_parser", :to => "admin/static#textile_parser", :as => "textile_parser"

  namespace :admin do
    resources :users
  end

end
