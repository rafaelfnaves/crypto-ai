# frozen_string_literal: true

require './app/utils/handle_errors'
require './app/models/user'

class UsersController
  extend HandleErrors # É um módulo que contém métodos para tratamento de erros [not_found, unauthorized]

  def self.login(email, password)
    user = User.find_by(email: email)
    return not_found unless user

    if user.password == password
      { success: true, status: 200, response: { message: 'Usuário autenticado com sucesso' } }
    else
      unauthorized
    end
  end
end
