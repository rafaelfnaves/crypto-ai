# frozen_string_literal: true

# ActiveRecord => ORM (Object-Relational Mapping) para Ruby.
require 'sinatra/activerecord'

class Wallet < ActiveRecord::Base
  # Relacionamento de um para um com a tabela users
  belongs_to :user
  # Relacionamento N:N entre cryptos e wallets
  has_many :wallet_cryptos
  has_many :cryptos, through: :wallet_cryptos
end
