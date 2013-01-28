require "ztk"
require "ztk/dsl"

ActiveSupport::Inflector.inflections do |inflect|
  inflect.uncountable 'nexus'
end

require "jove_labs/support"
require "jove_labs/version"

module JoveLabs
  extend(JoveLabs::Support)

  class Error < StandardError; end

  autoload :Nexus, "jove_labs/nexus"

  autoload :Environment, "jove_labs/environment"

  autoload :Container, "jove_labs/container"
  autoload :Network, "jove_labs/network"

  autoload :Provider, "jove_labs/provider"
  autoload :Providers, "jove_labs/providers"
end
