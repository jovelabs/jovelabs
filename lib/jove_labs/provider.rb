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
  class ProviderError < Error; end

  class Provider
    attr_accessor :stdout, :stderr, :stdin, :logger

    PROXY_METHODS = %w(create destroy up halt reload status id state username ip port alive? dead? exists?)

################################################################################

    def initialize(provider, stdout=STDOUT, stderr=STDERR, stdin=STDIN, logger=$logger)
      @stdout, @stderr, @stdin, @logger = stdout, stderr, stdin, logger
      @stdout.sync = true if @stdout.respond_to?(:sync=)

      @provider = case provider
      when :aws then
        Providers::AWS.new(@stdout, @stderr, @stdin, @logger)
      when :vagrant then
        Providers::Vagrant.new(@stdout, @stderr, @stdin, @logger)
      end
    end

################################################################################

    def status
      if exists?

        headers = [:provider, :id, :state, :username, :"ip address", :port]
        results = ZTK::Report.new.list([nil], headers) do |noop|

          OpenStruct.new(
            :provider => @provider.class,
            :id => self.id,
            :state => self.state,
            :username => self.username,
            :"ip address" => self.ip,
            :port => self.port
          )
        end
      else
        raise ProviderError, "No test labs exists!"
      end

    rescue Exception => e
      Jovelabs.logger.fatal { e.message }
      Jovelabs.logger.fatal { e.backtrace.join("\n") }
      raise ProviderError, e.message
    end

################################################################################

    def method_missing(method_name, *method_args)
      if PROXY_METHODS.include?(method_name.to_s)
        result = @provider.send(method_name.to_sym, *method_args)
        splat = [method_name, *method_args].flatten.compact
        Jovelabs.logger.debug { "Provider: #{splat.inspect}=#{result.inspect}" }
        result
      else
        super(method_name, *method_args)
      end
    end

################################################################################

  end

end

################################################################################
