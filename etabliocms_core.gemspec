$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "etabliocms_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "etabliocms_core"
  s.version     = EtabliocmsCore::VERSION
  s.authors     = ["papricek"]
  s.email       = ["patrikjira@gmail.com"]
  s.homepage    = "https://github.com/papricek/etabliocms_core"
  s.summary     = "Small CMS"
  s.description = "Small CMS"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.1"
  s.add_dependency "devise", "~> 2.0.4"
  s.add_dependency "configatron"

  s.add_development_dependency "sqlite3"
end
