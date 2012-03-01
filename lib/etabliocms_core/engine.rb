require 'devise'
require 'configatron'
require 'redcloth'
require 'jquery-rails'

module EtabliocmsCore

  class Engine < ::Rails::Engine

    initializer "etabliocms_core.initialize" do |app|
      EtabliocmsCore.setup do |config|
        config.modules ||= []
        config.modules << :core
      end
    end

    initializer "etabliocms_core.configure_app" do |app|
      app.config.i18n.default_locale = :cs
      Rails.application.config.assets.precompile += %w( admin-core.js admin-core.css )
    end

    initializer "etabliocms_core.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    initializer 'etabliocms_core.application_controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        include EtabliocmsCore::ApplicationControllerExtension
      end
    end

  end

end
