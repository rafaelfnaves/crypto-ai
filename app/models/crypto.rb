# frozen_string_literal: true

class Crypto < ActiveRecord::Base
  has_many :wallet_cryptos
  has_many :wallets, through: :wallet_cryptos
end
