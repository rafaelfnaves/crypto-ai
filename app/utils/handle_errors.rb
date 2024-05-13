# frozen_string_literal: true

module HandleErrors
  def not_found
    { success: false, status: 404, response: { message: 'Nenhum registro encontrado' } }
  end

  def bad_request
    { success: false, status: 400, response: { message: 'Bad Request' } }
  end

  def unauthorized
    { success: false, status: 401, response: { message: 'Unauthorized' } }
  end
end
