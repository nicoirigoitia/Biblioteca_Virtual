# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:'biblio@biblio', password:123456, role:'bibliotecario')
User.create(email:'estudiante1@gmail', password:123456, role:'estudiante')
User.create(email:'estudiante2@gmail', password:123456, role:'estudiante')

Book.create(title: 'me lo sabia en python', author: 'juan', isbn: '123', published_at: 1000/10/1)
Book.create(title: 'python para todos', author: 'juan', isbn: '123', published_at: 1000/10/1)
Book.create(title: 'maldito devise', author: 'juan', isbn: '123', published_at: 1000/10/1)
