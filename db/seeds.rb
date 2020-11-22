# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:'juan@pepe', password:123456)
User.create(email:'raul@pepe', password:123456)
User.create(email:'rolo@pepe', password:123456)
User.create(email:'coco@pepe', password:123456)
User.create(email:'admin@admin', password:'admins', role:'admin')

Book.create(title: 'lala', author: 'juan', isbn: '123', published_at: 1000/10/1)
Book.create(title: 'lala', author: 'juan', isbn: '123', published_at: 1000/10/1)
Book.create(title: 'lala', author: 'juan', isbn: '123', published_at: 1000/10/1)
Book.create(title: 'lala', author: 'juan', isbn: '123', published_at: 1000/10/1)