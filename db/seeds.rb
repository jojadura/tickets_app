# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Role.find_or_create_by(:name=>"Administrador")
    puts "Se creo Role Administrador"
    Role.find_or_create_by(:name=>"Director de Área")
    puts "Se creo Role  Director de Area"
    Role.find_or_create_by(:name=>"Usuario")
    puts "Se creo Role Usuario"
   