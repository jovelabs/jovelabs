module JoveLabs

  class Nexus < ZTK::DSL::Base
    has_many :environments, :class_name => "JoveLabs::Environment"

    attribute :name
  end

end
