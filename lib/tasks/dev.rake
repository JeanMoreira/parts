namespace :dev do
  desc "Cadastrar os anuncios"
  task generate_ads: :environment do

  	puts "Cadastrando ANÚNCIOS..."

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: "Tudo bom para esse produto, para uma nova coleção e novos teste para um novo mundo.",
        member: Member.first,
        part: Part.first,
        price: "#{Random.rand(500)}, #{Random.rand(99)}"
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: "Tudo bom para esse produto, para uma nova coleção e novos teste para um novo mundo.",        
        member: Member.first,
        part: Part.first,
        price: "#{Random.rand(500)}, #{Random.rand(99)}"
        

      )
    end

    puts "ANÚNCIOS cadastrados com sucesso!"
  end

end
