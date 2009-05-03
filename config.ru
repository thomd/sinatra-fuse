require 'rubygems'
require 'rake'
require 'sinatra'
require 'app.rb'

set :run, false
set :raise_errors, true
set :environment, :production
set :app_file, 'app.rb'

log = File.new("sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

run Sinatra::Application
