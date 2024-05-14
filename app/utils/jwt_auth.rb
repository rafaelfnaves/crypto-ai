require 'jwt'
require 'json'
require 'dotenv'
Dotenv.load

# Middleware para autenticação JWT
class JwtAuth
  def initialize(app)
    @app = app
  end

  def call(env)
    # Ignorar a autenticação JWT para a rota de login
    return @app.call(env) if env['PATH_INFO'] == '/login'

    # Verificar se a requisição contém um token JWT nos cabeçalhos de autorização
    if env['HTTP_AUTHORIZATION'] && env['HTTP_AUTHORIZATION'].start_with?('Bearer ')
      token = env['HTTP_AUTHORIZATION'].split(' ')[1]
      begin
        payload = JWT.decode(token, ENV['SECRET_KEY'], true, algorithm: 'HS256').first
        env['jwt.payload'] = payload # Adiciona o payload decodificado ao ambiente da requisição
      rescue JWT::DecodeError
        return [401, { 'Content-Type' => 'application/json' }, [{ error: 'Token inválido' }.to_json]]
      end
    else
      # Se não houver token JWT presente e não for a rota de login, retorna um erro 401
      return [401, { 'Content-Type' => 'application/json' }, [{ error: 'Token JWT não fornecido' }.to_json]]
    end

    @app.call(env)
  end
end
