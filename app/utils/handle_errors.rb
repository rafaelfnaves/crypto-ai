# frozen_string_literal: true

module HandleErrors
  def not_found
    { success: false, response: { message: 'Nenhum registro encontrado', status: 404 } }
  end

  def bad_request
    { success: false, response: { message: 'Bad Request', status: 400 } }
  end

  def unauthorized
    { success: false, response: { message: 'Unauthorized', status: 401 } }
  end
end
