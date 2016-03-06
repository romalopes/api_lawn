require 'sinatra'
require 'json'

get '/' do
  "Hello World #{params[:name]}".strip
end