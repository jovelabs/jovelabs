################################################################################
#
#      Author: Zachary Patten <zachary@jovelabs.com>
#   Copyright: Copyright (c) 2012-2013 Jove Labs
#     License: Apache License, Version 2.0
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
################################################################################
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
