require 'rubygems'
require 'sinatra'

configure do
  Title = "sinatra fuse"
  set :sass, :style => :expanded
end


helpers do

end


get '/' do
  haml :index
end

get '/app.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass :app
end
