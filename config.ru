if ENV['RACK_ENV'] == 'production'
  require 'vendor/rack/lib/rack'
  require 'vendor/sinatra/lib/sinatra'
  logfile = "log/sinatra.log"
else
  require 'rack'
  require 'sinatra'
  logfile = "sinatra.log"
end
ENV['GEM_HOME'] = "#{ENV['HOME']}/.gems"
require 'rubygems'
Gem.clear_paths

disable :run
set :raise_errors, true
set :environment, (ENV['RACK_ENV'] || :development).to_sym
set :app_file, 'app.rb'

log = File.new(logfile, "a")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app'
run Sinatra::Application
