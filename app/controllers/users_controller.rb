# frozen_string_literal: true

require './app/utils/handle_errors'
require './app/models/user'
require 'jwt'
require 'dotenv'
Dotenv.load

class UsersController
  extend HandleErrors # É um módulo que contém métodos para tratamento de erros [not_found, unauthorized]

  # Método para autenticar um usuário com email e senha
  def self.login(email, password)
    user = User.find_by(email: email)
    return not_found unless user

    if user.password == password
      { success: true, status: 200, response: { message: 'Usuário autenticado com sucesso', token: generate_token(user.id) } }
    else
      unauthorized
    end
  end

  # gera um token JWT com o id do usuário
  def self.generate_token(user_id)
    payload = { user_id: }
    JWT.encode(payload, ENV['SECRET_KEY'], 'HS256')
  end
end
