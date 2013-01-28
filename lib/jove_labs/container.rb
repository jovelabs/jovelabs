module JoveLabs

  class Container < ZTK::DSL::Base
    belongs_to :environment, :class_name => "JoveLabs::Environment"
    belongs_to :network, :class_name => "JoveLabs::Network"

    attribute :hostname
    attribute :ip
    attribute :mac
    attribute :distro
    attribute :arch
    attribute :persist
  end

end
