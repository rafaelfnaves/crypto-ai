# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
Dotenv.load

require './app/controllers/users_controller'

post '/login' do
  res = UsersController.login(params[:email], params[:password])
  if res[:success]
    status res[:response][:status]
    res[:response].to_json
  else
    status res[:response][:status]
    res[:response].to_json
  end
end
