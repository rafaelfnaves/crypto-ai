# frozen_string_literal: true

# ActiveRecord => ORM (Object-Relational Mapping) para Ruby.
require 'sinatra/activerecord'

class Wallet < ActiveRecord::Base
  belongs_to :user
  has_many :wallet_cryptos
  has_many :cryptos, through: :wallet_cryptos
end
