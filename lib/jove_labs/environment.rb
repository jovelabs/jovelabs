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
