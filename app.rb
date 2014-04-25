require 'sinatra'
require 'sinatra/activerecord'
require './certificate.rb'

get '/' do
  "Hello, World"
end

get '/verify/:hash' do
  @cert = Certificate.find_by_identifier(params[:hash])
  if @cert
    erb :valid
  else
    erb :invalid
  end
end
