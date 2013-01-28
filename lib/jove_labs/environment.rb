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

module JoveLabs

  class Environment < ZTK::DSL::Base
    belongs_to :nexus, :class_name => "JoveLabs::Nexus"
    has_many :containers, :class_name => "JoveLabs::Container"
    has_many :networks, :class_name => "JoveLabs::Network"

    attribute :name
    attribute :provider

################################################################################

    def method_missing(method_name, *method_args)
      if Provider::PROXY_METHODS.include?(method_name.to_s)
        result = @provider.send(method_name.to_sym, *method_args)
        splat = [method_name, *method_args].flatten.compact
        Jovelabs.logger.debug { "TestLab: #{splat.inspect}=#{result.inspect}" }
        result
      else
        super(method_name, *method_args)
      end
    end

################################################################################

  end

end
