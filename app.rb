require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './certificate.rb'

configure do
	enable :sessions
	enable :method_override
end

get '/' do
  erb :index
end

get '/verify/:hash' do
  @cert = Certificate.find_by_identifier(params[:hash])
  if @cert
    erb :valid
  else
    erb :invalid
  end
end
