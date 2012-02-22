module EtabliocmsCore

  class Engine < Rails::Engine

    initializer "etabliocms_core.load_myapp_instance_data" do |app|
      EtabliocmsCore.setup do |config|
        config.app_root = app.root
      end
    end

    initializer "etabliocms_core.load_static_assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    initializer 'etabliocms_core.controller' do |app|
      ActiveSupport.on_load(:action_controller) do
        include EtabliocmsCore::ApplicationControllerExtension
      end
    end

  end

end
