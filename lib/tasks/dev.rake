namespace :dev do
  
#######################################Rake SETUP. #####################################################
  desc "Setup Development"
  task setup: :environment do
    puts "Executando o setup para desenvolvimento..."
    
    puts "APAGANDO BD... #{%x(rake db:drop)}"

    puts "CRIANDO BD... #{%x(rake db:create)}"

    puts %x(rake db:migrate)
    puts %x(rake dev:generate_cars)
    puts %x(rake dev:generate_categories)
    puts %x(rake dev:generate_parts)
    puts %x(rake dev:generate_adm)
    puts %x(rake dev:generate_company)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_companyParts)
    puts %x(rake dev:generate_ads)
    

    puts "Setup completado com sucesso!"
  end

  
  #######################################Rake task para cadastro dos carros no sistema. #####################################################
  desc "Criar de carros"
  task generate_cars: :environment do
    puts '################### INICIO CADASATRO DOS CARROS ####################'
    cars = ['Land Rover',
            'Volkwagen',
            'hyundai']
    
    cars.each do |car|
      Car.find_or_create_by(maker: car, model: car, year: Date.today, year_make: Date.today)
      

    end
    puts '##################### FIM CADASTRO DOS CARROS #######################'
  end

 #######################################Rake task para cadastro dos categories. #####################################################
 desc "Criar de CATEGORY"
 task generate_categories: :environment do
  puts '################### INICIO CADASATRO DAS CATEGORIAS ####################'
  categories = ['Motor',
                'Parte Traseira',
                'Parte interior']
  categories.each do |category|
    Category.find_or_create_by(description: category)
    
  end
  puts '##################### FIM CADASTRO DOS CATEGORIAS #######################'
 end

#######################################Rake task para cadastro das pecas. #####################################################
desc "Criar de PARTS"
task generate_parts: :environment do
  puts '################### INICIO CADASATRO DAS PARTS ####################'
  cars = Car.all
  categories = Category.all
  
  parts = ['Vela',
           'Radio',
           'Farol de milha']
  cars.each do |car|
    categories.each do |category|
      parts.each do |part|
        Part.find_or_create_by(car: car, category: category, description: part)
        
      end
    end
  end
  puts '##################### FIM CADASTRO DOS PARTS #######################'
end

#######################################Rake task para cadastro do administrador. #####################################################
desc "Criar de adm"
task generate_adm: :environment do
  puts '################### INICIO CADASATRO DO ADMINISTRADOR ####################'
  Admin.create!(name: 'admin', email: 'admin@admin.com', password: '123456', password_confirmation: '123456', role: 0)
  puts '##################### FIM CADASTRO DO ADMINISTRADOR #######################'
end
#######################################Rake task para cadastro do MEMBER. #####################################################
desc "Cria Membros Fake"
task generate_members: :environment do
  puts '################### INICIO CADASATRO DO MEMBROS ####################'  

  100.times do
    member = Member.new(
      email: Faker::Internet.email,
      password: "123456",
      password_confirmation: "123456"
    )
   
    member.save!
  end

  puts '################### FIM CADASATRO DO MEMBROS ####################'  
end

#######################################Rake task para cadastro do company. #####################################################
desc "Criar de Empresa"
task generate_company: :environment do
  puts '################### INICIO CADASATRO DO EMPRESA ####################'
  10.times do |_i|
    company_name = Faker::Company.name
    company_cnpj = Faker::CNPJ.pretty
    company = "#{company_name} - #{company_cnpj}"
    #puts "Cadastrando empresa #{company}"
    Company.create(name: company_name, cnpj: company_cnpj)
    
  end
  puts '##################### FIM CADASTRO DO EMPRESA #######################'
end

#######################################Rake task para cadastro do mebro. #####################################################
desc "Criar de CompanyPartes"
task generate_companyParts: :environment do
  puts '################### INICIO CADASATRO DO COMPANY PARTS ####################'  
  30.times do
    CompanyPart.create!(
      part: Part.first,
      company: Company.first
    )
  end
  puts '##################### FIM CADASTRO DO COMPANY PARTS #######################'
end



#######################################Rake task para cadastro dos Anuncios. #####################################################
  desc "Cadastrar os anuncios"
  task generate_ads: :environment do

    puts '################### INICIO CADASATRO DO AUNCIOS ####################'  
    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: "Tudo bom para esse produto, para uma nova coleção e novos teste para um novo mundo.",        
        member: Member.first,
        company_part: CompanyPart.first,
        price: "#{Random.rand(500)}, #{Random.rand(99)}"
      )
    end
    puts '##################### FIM CADASTRO DO AUNCIOS #######################'
  end

end
