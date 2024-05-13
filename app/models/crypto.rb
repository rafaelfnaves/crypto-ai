# frozen_string_literal: true

# ActiveRecord => ORM (Object-Relational Mapping) para Ruby.
require 'sinatra/activerecord'

class Crypto < ActiveRecord::Base
  has_many :wallet_cryptos
  has_many :wallets, through: :wallet_cryptos
end
