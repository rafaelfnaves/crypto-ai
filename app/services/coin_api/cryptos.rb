# frozen_string_literal: true

require 'faraday'
require 'dotenv'
Dotenv.load

module CoinApi
  class Cryptos
    def call
      response = fetch_cryptos
      handle_response(response)
    rescue Faraday::Error => e
      handle_faraday_error(e)
    rescue JSON::ParserError => e
      handle_json_error(e)
    end

    private

    # Configura o client Faraday para fazer a requisição à API
    def client
      @client ||= Faraday.new(url: 'https://rest.coinapi.io') do |faraday|
        faraday.headers = { 'X-CoinAPI-Key' => ENV['COIN_API_KEY'] }
        faraday.request(:url_encoded)
        faraday.response(:logger)
        faraday.adapter(Faraday.default_adapter)
      end
    end

    # Busca as cryptos na rota /v1/assets da API CoinAPI
    def fetch_cryptos
      client.get('/v1/assets')
    end

    def handle_response(response)
      # transforma a resposta em um hash
      body = JSON.parse(response.body)
      # seleciona apenas as cryptos
      cryptos = body.select { |crypto| crypto['type_is_crypto'] == 1 }
      # retorna um hash com as cryptos
      { success: true, cryptos: }
    end

    # Retorna erro caso a resposta não seja 200
    def handle_faraday_error(error)
      { success: false, error: "Connection error: #{error}" }
    end

    # Retorna error caso a resposta não seja um JSON válido
    def handle_json_error(error)
      { success: false, error: "Invalid JSON format: #{error}" }
    end
  end
end
