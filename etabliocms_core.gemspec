$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "etabliocms_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "etabliocms_core"
  gem.version     = EtabliocmsCore::VERSION
  gem.authors     = ["papricek"]
  gem.email       = ["patrikjira@gmail.com"]
  gem.homepage    = "https://github.com/papricek/etabliocms_core"
  gem.summary     = "Small CMS"
  gem.description = "Small CMS"

  gem.files = Dir["{app,config,db,lib,public,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  gem.test_files = Dir["test/**/*"]

  gem.add_dependency "rails", "~> 3.2.1"
  gem.add_dependency "jquery-rails"
  gem.add_dependency "jquery-ui-rails"
  gem.add_dependency "devise", "~> 2.0.4"
  gem.add_dependency "configatron"
  gem.add_dependency "RedCloth", '4.2.9'
  gem.add_dependency "paper_trail"
  gem.add_dependency "acts_as_sluggy"
  gem.add_dependency "extended_nested_set"
  gem.add_dependency "textile_extension_pack"

  gem.add_development_dependency "sqlite3"
end
