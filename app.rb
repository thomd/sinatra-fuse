require 'rubygems'
require 'sinatra'

configure do
  Title = "sinatra fuse"
  set :sass, :style => :expanded
end

before do
  # Before Filter
end

helpers do
  # Helpers
end


get '/' do
  haml :index
end

get '/:stylesheet.css' do
  header 'Content-Type' => 'text/css; charset=utf-8'
  sass params[:stylesheet].to_sym
end
