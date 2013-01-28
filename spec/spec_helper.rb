################################################################################
#
#      Author: Zachary Patten <zachary@jovelabs.net>
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

require 'jovelabs'
require 'tempfile'

################################################################################

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end if ENV["COVERAGE"]

ENV['LOG_LEVEL'] = "DEBUG"

WAIT_SMALL = 3

$logger = ZTK::Logger.new(File.join("/tmp", "test.log"))

$logger.info { "=" * 80 }
$logger.info { "STARTING JOVELABS v#{JoveLabs::VERSION} TEST RUN @ #{Time.now.utc}" }
$logger.info { "=" * 80 }

################################################################################
