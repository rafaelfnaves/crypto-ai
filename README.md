# Projeto Crypto-AI

Este projeto é uma aplicação web desenvolvida em Ruby. O objetivo do projeto é criar uma API, para cotação e análises de criptomoedas utilizando a API do ChatGPT.

## Requisitos

- Ruby 3.2.1
- OPENAI_KEY [chave de api da Openai](https://www.openai.com/)
- COIN_API_KEY [chave de api da Coin API](https://www.coinapi.io/)
- Sqlite

## Instalação

1. Clone o repositório:

```bash
git clone https://github.com/rafaelfnaves/crypto-ai.git
```

2. Instale as dependências:

```bash
bundle install
```

## Uso

1. Crie o _database_:

```bash
bundle exec rake db:create
```

2. Execute as _migrations_:

```bash
bundle exec rake db:migrate
```

3. Crie o arquivo `.env` e adicione as seguintes variáveis de ambiente:

```
COIN_API_KEY= # insira a chave de api gerada
OPENAI_KEY= # insira a chave de api gerada
SECRET_KEY= # gere um secret key para autenticação JWT na API
```

4. Execute o comando `ruby db/seed.rb` para criar um usuário teste e popular a tabela **cryptos**.

5. Inicie o servidor:

```bash
ruby app.rb
```

6. Acesse a aplicação através de:

```
http://localhost:4567
```

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir uma issue ou enviar um pull request.
