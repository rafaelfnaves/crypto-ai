require 'jwt'
require 'json'
require 'dotenv'
Dotenv.load

# Middleware para autenticação JWT
class JwtAuth
  def initialize(app, options = {})
    @app = app
    @exclude = options[:exclude] || []
  end

  def call(env)
    # Verificar se a requisição contém um token JWT nos cabeçalhos de autorização
    if !@exclude.include?(env['PATH_INFO']) && env['HTTP_AUTHORIZATION'] && env['HTTP_AUTHORIZATION'].start_with?('Bearer ')
      token = env['HTTP_AUTHORIZATION'].split(' ')[1]
      begin
        payload = JWT.decode(token, ENV['SECRET_KEY'], true, algorithm: 'HS256').first
        env['jwt.payload'] = payload # Adiciona o payload decodificado ao ambiente da requisição
      rescue JWT::DecodeError
        return [401, { 'Content-Type' => 'application/json' }, [{ error: 'Token inválido' }.to_json]]
      end
    end

    @app.call(env)
  end
end
