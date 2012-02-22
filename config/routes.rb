Rails.application.routes.draw do

  devise_for :"etabliocms_core/users", :path_names => {:sign_in => "login",
                                                       :sign_out => "logout",
                                                       :registration => "register",
                                                       :password => "forgot-password"}

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end

  match "/admin", :to => "admin/static#index"
  match "/admin/textile_parser", :to => "admin/static#textile_parser", :as => "textile_parser"

  namespace :admin do
    resources :users
  end

end
