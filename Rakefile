require 'bundler'
require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:test)

task :default do
    puts "Rake default task"
end

desc "Running unit tests"
task :test do
    `rspec`
end

desc "Runs bundle install"
task :install do
    system %Q(bundle install)
end
