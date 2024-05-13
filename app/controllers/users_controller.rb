# frozen_string_literal: true

require './app/utils/handle_errors'
require './app/models/user'

class UsersController
  extend HandleErrors

  def self.login(email, password)
    user = User.find_by(email: email)
    return not_found unless user

    if user.password == password
      { success: true, response: { message: 'Usuário autenticado com sucesso', status: 200 } }
    else
      unauthorized
    end
  end
end
