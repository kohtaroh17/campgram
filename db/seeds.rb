# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
campers = Camper.create!(
  [
  {email:'ko@ko',password:'ko0107',camper_name:'taro',admin:'true'},
  {email:'ya@ya',password:'ko0107',camper_name:'kohsaku'},
  ]
  )