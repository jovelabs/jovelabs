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
  module Support

    module Exceptions
      class CouldNotFind < StandardError; end
    end

    def logger
      $logger ||= ZTK::Logger.new(STDOUT)
    end

    def find_file(*args)
      pwd = Dir.pwd.split(File::SEPARATOR)
      (pwd.length - 1).downto(0) do |i|
        candidate = File.join(pwd[0..i], args)
        File.exists?(candidate) and return File.expand_path(candidate)
      end

      raise Exceptions::CouldNotFind, "Could not locate '#{File.join(args)}'!"
    end

  end
end
