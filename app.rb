require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

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
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass params[:stylesheet].to_sym
end
