require 'rubygems'
require 'vendor/rack/lib/rack'
require 'vendor/sinatra/lib/sinatra'

set :run, false
set :raise_errors, true
set :environment, :production
set :app_file, 'app.rb'
set :views, File.dirname(__FILE__) + "/views"

log = File.new("log/sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'app'
run Sinatra::Application
