# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times{Book.create(author: 'John Powell', title: 'Lord of the Rings', description: 'Lord of the Rings description')} 
10.times{Book.create(author: 'Tony Macron', title: 'Star Wars', description: 'Star Wars description')}
