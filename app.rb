# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv'
require 'pry'
require 'json'
Dotenv.load

require './app/controllers/users_controller'
require './app/controllers/cryptos_controller'
require './app/controllers/wallets_controller'

post '/login' do
  content_type :json

  res = UsersController.login(params[:email], params[:password])
  if res[:success]
    status res[:status]
    res[:response].to_json
  else
    status res[:status]
    res[:response].to_json
  end
end

get '/cryptos' do
  content_type :json

  res = CryptosController.index
  if res[:success]
    status res[:status]
    res[:response].to_json
  else
    status res[:status]
    res[:response].to_json
  end
end

post '/users/:id/wallet' do
  content_type :json

  user_id = params[:id]

  # {"cryptos"=>["BTC", "ETH"]}
  payload = JSON.parse(request.body.read)

  return status 400 unless user_id && payload.key?('cryptos')

  res = WalletsController.create(user_id, payload)
  if res[:success]
    status res[:status]
    res[:response].to_json
  else
    status res[:status]
    res[:response].to_json
  end
end

get '/users/:id/wallet' do
  content_type :json

  user_id = params[:id]
  error 400 unless user_id

  res = WalletsController.show(user_id)
  if res[:success]
    status res[:status]
    res[:response].to_json
  else
    status res[:status]
    res[:response].to_json
  end
end
