require "active_support/dependencies"

module EtabliocmsCore

  mattr_accessor :modules

  def self.setup
    yield self
  end

end

require "etabliocms_core/engine"
require "devise"

