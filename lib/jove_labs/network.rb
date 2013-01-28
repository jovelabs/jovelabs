module JoveLabs

  class Network < ZTK::DSL::Base
    belongs_to :environment, :class_name => "JoveLabs::Environment"
    has_many :containers, :class_name => "JoveLabs::Container"

    attribute :name
    attribute :gateway
    attribute :netmask
  end

end
