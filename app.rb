require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'json'
 
def json_get(route, options={}, &block)
  get(route, options) do 
    block.call.to_json
  end
end
 
configure do
  Title = "sinatra fuse"
  set :sass, :style => :expanded
end

before do
  content_type 'text/html', :charset => 'utf-8'
end

helpers do
  # Helpers
end


get '/' do
  haml :index
end

get '/:stylesheet.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass params[:stylesheet].to_sym
end

json_get '/json' do
  {"bar" => "baz", "foo" => "bar"}
end
