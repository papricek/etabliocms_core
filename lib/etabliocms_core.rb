require "active_support/dependencies"

module EtabliocmsCore

  mattr_accessor :modules
  mattr_accessor :stylesheets
  mattr_accessor :javascripts

  def self.setup
    yield self
  end

end

require "etabliocms_core/engine"
require "devise"
