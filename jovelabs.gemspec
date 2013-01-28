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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jove_labs/version'

Gem::Specification.new do |gem|
  gem.name          = "jovelabs"
  gem.version       = JoveLabs::VERSION
  gem.authors       = ["Zachary Patten"]
  gem.email         = ["zachary@jovelabs.com"]
  gem.description   = %q{Jove Labs}
  gem.summary       = %q{Jove Labs}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("gli", ">= 0")
  gem.add_dependency("ztk", ">= 0")

  gem.add_development_dependency("pry", ">= 0")
  gem.add_development_dependency("rake", ">= 0")
  gem.add_development_dependency("cucumber", ">= 0")
  gem.add_development_dependency("rspec", ">= 0")
  gem.add_development_dependency("simplecov", ">= 0")
  gem.add_development_dependency("aruba", ">= 0")
  gem.add_development_dependency("yard", ">= 0")
  gem.add_development_dependency("redcarpet", ">= 0")
end
