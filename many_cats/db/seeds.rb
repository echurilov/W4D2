# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all
cat1 = Cat.create!({name: 'kitty', sex: 'F', color: 'Black', birth_date: '9/11/2018', description: 'awesome cat'})
cat2 = Cat.create!({name: 'jumper', sex: 'M', color: 'Orange', birth_date: '2020-07-15', description: 'future cat'})
cat3 = Cat.create!({name: 'george', sex: 'M', color: 'Tabby', birth_date: '1994-07-05', description: 'boring cat'})