# frozen_string_literal: true

# bcrypt => Ligação ruby ao algoritmo de hashing de senha do OpenBSD.
# Permitindo que você armazene facilmente um hash seguro das senhas de seus usuários.
require 'bcrypt'

class User < ActiveRecord::Base
  # Relacionamento de um para um com a tabela wallets
  has_one :wallet

  # Validações de presença e unicidade do email e presença da senha
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  # Define o campo password utilizando bcrypt
  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
