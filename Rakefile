require "rubygems"
require "rake"
require "app"

task :default => "test"

desc "run tests (default)"
task :test do
  require 'rake/runtest'
  Rake.run_tests '**/*_test.rb'  
end
