require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/rectangle'

get '/' do
  @description = "This application will determine whether a rectangle is a square or not."
  erb(:input)
end

get '/output' do
  @length = params.fetch("length")
  @width = params.fetch("width")
  rectangle = Rectangle.new(@length, @width)
  rectangle.square? ? @string_to_display = "This is a square" : @string_to_display = "This is not a square"
  erb(:output)
end
