# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cadastra os carros
puts "CADASATRO DOS CARROS ..."
cars = ["Land Rover", 
		"Volkwagen",
		"hyundai"]

cars.each do |car|
	Car.find_or_create_by(maker: car, model:car, year:Date.today, year_make: Date.today)
end	
puts "FIM CADASTRO DOS CARROS"

# Cadastra as categorias.
puts "CADASATRO DAS CATEGORIAS ..."
categories = ["Motor", 
		"Parte Traseira",
		"Parte interior"]
categories.each do |category|
	Category.find_or_create_by(description:category)
end	
puts "FIM CADASTRO DOS CATEGORIAS"


#Cadastro das pecas
puts "CADASATRO DAS PECAS ..."
cars = Car.all
categories = Category.all

parts = ["Vela", 
		"Radio",
		"Farol de milha"]
cars.each do |car|
	categories.each do |category|
		parts.each do |part|
			Part.find_or_create_by(car:car,category:category,description:part)
		end 	
		
	end 	
end	

# Cadastra os carros
puts "CADASATRO O ADMINISTRADOR PADRAO ..."
	Admin.create!(name:"admin",email:"admin@admin.com", password: "123456", password_confirmation:"123456", role: 0)
puts "FIM CADASTRO DO ADMINISTRADOR PADRAO"

puts "FIM CADASTRO"

