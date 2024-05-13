# frozen_string_literal: true

require './app/models/crypto'

class CryptosController
  def self.index
    cryptos = Crypto.first(100)
    { success: true, status: 200, response: { cryptos: } }
  end
end
