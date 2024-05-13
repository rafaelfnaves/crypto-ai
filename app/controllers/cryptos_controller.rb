# frozen_string_literal: true

require './app/models/crypto'
require './app/utils/handle_errors'
require './app/utils/prompt_ai'
require './app/services/open_ai'
require 'json'

class CryptosController
  extend HandleErrors # É um módulo que contém métodos para tratamento de erros [not_found, bad_request]
  extend PromptAi # É um módulo que contém métodos para retornar as mensagens de início e fim do prompt

  # Método que retorna uma lista de todas as criptomoedas
  def self.index
    cryptos = Crypto.all
    { success: true, status: 200, response: { cryptos: } }
  end

  # Método que retorna informações sobre uma criptomoeda específica a partir de um prompt de IA
  def self.info_data(symbol)
    crypto = Crypto.find_by(symbol: symbol)
    return not_found unless crypto

    # Chama o serviço OpenAiService para retornar uma mensagem com informações sobre a criptomoeda.
    message = OpenAiService.new.call("#{start_prompt}. Sobre a criptomoeda #{crypto.name} - #{crypto.symbol}, atualmente cotada em #{crypto.price} dolares. #{finish_prompt}")
    { success: true, status: 200, response: { crypto_data: JSON.parse(message) } }
  end
end
