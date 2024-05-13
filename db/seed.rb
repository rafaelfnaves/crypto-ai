require './app/models/user'
user = User.create(name: 'rafael teste', email: 'email@teste.com', password: '123456')
p user
