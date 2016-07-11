# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Role.find_or_create_by(:name=>"Administrador")
    puts "Se creo Role Administrador"
    Role.find_or_create_by(:name=>"Director")
    puts "Se creo Role  Director de Area"
    Role.find_or_create_by(:name=>"Usuario")
    puts "Se creo Role Usuario"
    User.create!({
    	:email=>'admin@gmmail.com',
    	:password=> 'changeme',
        :sign_in_count=>0,
    	:encrypted_password=> User.new(:password => 'changeme').encrypted_password,
    	:name=> 'Administrador',
    	:role_id => Role.admin.id,
    	:created_at=> Time.now.strftime("%Y-%m-%d"),
        :updated_at=> Time.now.strftime("%Y-%m-%d"),
         })
    puts "se creo el usuario ADMINISTRADOR" 
    puts ">>>>>>>>>>   USER:  admin@gmail.com"
    puts ">>>>>>>>>PASSWORD:  changeme"

    State.find_or_create_by(:name=>"Abierto",:color=>"#e31919")
     puts "Se creo State Abierto"
    
    State.find_or_create_by(:name=>"Pendiente",:color=>"#f9f822")
     puts "Se creo State Pendiente"
    
    State.find_or_create_by(:name=>"Pre-finalizado",:color=>"#1148cc")
     puts "Se creo State Pre-finalizado"
    
    State.find_or_create_by(:name=>"Finalizado",:color=>"#20c807")
     puts "Se creo State Finalizado"