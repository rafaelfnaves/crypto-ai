require './app/models/user'
require './app/models/crypto'
require './app/services/coin_api/cryptos.rb'

# create user
#
user = User.create(name: 'rafael teste', email: 'email@teste.com', password: '123456')
p user


# create cryptos
#
response = CoinApi::Cryptos.new.call

# return if response[:success] == false

response[:cryptos].each do |crypto|
  Crypto.create!(
    name: crypto['name'],
    symbol: crypto['asset_id'],
    price: crypto['price_usd'],
    id_icon: crypto['id_icon'],
    volume_1hrs: crypto['volume_1hrs_usd'],
    volume_1day: crypto['volume_1day_usd'],
    volume_1mth: crypto['volume_1mth_usd']
  )
end
