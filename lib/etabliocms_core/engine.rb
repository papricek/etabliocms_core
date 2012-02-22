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

  end

end
