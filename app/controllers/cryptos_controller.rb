# frozen_string_literal: true

require './app/models/crypto'

class CryptosController
  def self.index
    cryptos = Crypto.first(100)
    { success: true, response: { cryptos:, status: 200 } }
  end
end
