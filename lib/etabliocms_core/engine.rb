require 'devise'
require 'configatron'
require 'redcloth'
require 'jquery-rails'
require 'jquery-ui-rails'
require 'acts_as_sluggy'
require 'extended_nested_set'
require 'textile_extension_pack'
require 'paper_trail'
require 'lorem'

module EtabliocmsCore

  class Engine < ::Rails::Engine

    initializer "etabliocms_core.initialize" do |app|
      EtabliocmsCore.setup do |config|
        config.modules ||= []
        config.stylesheets ||= []
        config.javascripts ||= []
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
