Rails.application.routes.draw do

  devise_for :"etabliocms_core/users"

  devise_scope :"etabliocms_core/user" do
    get "login" => "devise/sessions#new"
    delete "logout" => "devise/sessions#destroy"
  end

  match "/admin", :to => "admin/static#index"
  match "/admin/textile_parser", :to => "admin/static#textile_parser", :as => "textile_parser"

  namespace :admin do
    resources :users
  end

end
