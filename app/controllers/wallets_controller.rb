# frozen_string_literal: true

require './app/utils/handle_errors'
require './app/models/user'
require './app/models/wallet'
require './app/models/crypto'
require './app/models/wallet_crypto'

class WalletsController
  extend HandleErrors # É um módulo que contém métodos para tratamento de erros [not_found, bad_request]

  def self.create(user_id, payload)
    user = User.find(user_id)
    return not_found unless user

    wallet = Wallet.create(user:)

    payload['cryptos'].each do |data|
      return bad_request if data == nil

      crypto = Crypto.find_by(symbol: data)
      return not_found if crypto == nil

      WalletCrypto.create(wallet:, crypto:)
    end

    { success: true, status: 201, response: { message: 'Carteira criada com sucesso' } }
  end

  def self.show(user_id)
    user = User.find(user_id)
    return not_found unless user

    wallet = Wallet.find_by(user:)
    return not_found unless wallet

    cryptos = wallet.wallet_cryptos.map do |wallet_crypto|
      { crypto: wallet_crypto.crypto.name }
    end

    { success: true, status: 200, response: { wallet_cryptos: cryptos } }
  end
end
