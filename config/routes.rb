Rails.application.routes.draw do

  devise_for :users, :path_names => {:sign_in => "login",
                                     :sign_out => "logout",
                                     :registration => "register",
                                     :password => "forgot-password"}

  match "/admin", :to => "admin/static#index"
  match "/admin/textile_parser", :to => "admin/static#textile_parser", :as => "textile_parser"

  namespace :admin do
    resources :users
  end


  root :to => redirect("/" + Rails.application.config.i18n.default_locale.to_s)

  scope ":locale" do
    match "/" => "pages#index"
  end

end
