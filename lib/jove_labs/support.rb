module JoveLabs
  module Support

    def logger
      $logger ||= ZTK::Logger.new(STDOUT)
    end

  end
end
