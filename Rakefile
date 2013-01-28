################################################################################
#
#      Author: Zachary Patten <zachary@jovelabs.net>
#   Copyright: Copyright (c) Jove Labs
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

require 'bundler/gem_tasks'
require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'

################################################################################

require 'cucumber'
require 'cucumber/rake/task'

spec = eval(File.read('jovelabs.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end
CUKE_RESULTS = 'results.html'
CLEAN << CUKE_RESULTS
desc 'Run features'
Cucumber::Rake::Task.new(:features) do |t|
  opts = "features --format html -o #{CUKE_RESULTS} --format progress -x"
  opts += " --tags #{ENV['TAGS']}" if ENV['TAGS']
  t.cucumber_opts =  opts
  t.fork = false
end

desc 'Run features tagged as work-in-progress (@wip)'
Cucumber::Rake::Task.new('features:wip') do |t|
  tag_opts = ' --tags ~@pending'
  tag_opts = ' --tags @wip'
  t.cucumber_opts = "features --format html -o #{CUKE_RESULTS} --format pretty -x -s#{tag_opts}"
  t.fork = false
end

task :cucumber => :features
task 'cucumber:wip' => 'features:wip'
task :wip => 'features:wip'
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb']
end

################################################################################

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

################################################################################

desc "Run RSpec with code coverage"
task :coverage do
  `rake spec COVERAGE=true`
  case RUBY_PLATFORM
  when /darwin/
    `open coverage/index.html`
  when /linux/
    `google-chrome coverage/index.html`
  end
end

################################################################################

require 'yard'
require 'yard/rake/yardoc_task'

GEM_NAME = File.basename(Dir.pwd)
DOC_PATH = File.expand_path(File.join("..", "/", "#{GEM_NAME}.doc"))

namespace :doc do
  YARD::Rake::YardocTask.new(:pages) do |t|

    # t.files = ['lib/**/*.rb']
    t.options = ['--verbose', '-o', DOC_PATH]
  end

  namespace :pages do

    desc 'Generate and publish YARD Documentation to GitHub pages'
    task :publish => ['doc:pages'] do
      describe = %x(git describe).chomp.strip
      Dir.chdir(DOC_PATH) do
        puts(%x{git add -Av})
        puts(%x{git commit -m"Generated YARD Documentation for #{GEM_NAME.upcase} #{describe}"})
        puts(%x{git push origin gh-pages})
      end
    end

  end

end
desc 'Alias to doc:yard'
task 'doc' => 'doc:yard'

################################################################################

task :default => [:test]
task :test => [:features,:spec]
# task :default => :spec
# task :test => :spec

################################################################################
