# frozen_string_literal: true

# ActiveRecord => ORM (Object-Relational Mapping) para Ruby.
require 'sinatra/activerecord'

# Tabela intermediaria entre Wallet e Crypto
class WalletCrypto < ActiveRecord::Base
  belongs_to :wallet
  belongs_to :crypto
end
