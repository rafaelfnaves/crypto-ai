# frozen_string_literal: true

# ActiveRecord => ORM (Object-Relational Mapping) para Ruby.
require 'sinatra/activerecord'

# Tabela intermediaria entre Wallet e Crypto
class WalletCrypto < ActiveRecord::Base
  # Relacionamento N:N entre cryptos e wallets
  belongs_to :wallet
  belongs_to :crypto
end
