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
