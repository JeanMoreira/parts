class PartsController::PartService
	attr_accessor :part #Atalho para criar metodos de leitura e variavel de instancia
	attr_accessor :parts #atalho para criar metodos e leitura e variavel de instancia, lista de partes.
	
		#Criar o obj part e insere no banco.
    def self.create(params_part)
		@part = Part.new(params_part)
		if @part.valid?
			@part.save!
		end 
		@part       
	end
	

	#Busca uma part a parti da categoria passada por parametor.
	#parametro - Category.
	def self.get_part_by_category(params_category)
		@parts = Part.where("category_id = ?", params_category)
	end

	def self.get_part_by_car(params_car)
		@parts = Part.where("car_id = ?", params_car)
	end

	#Busca uma part a parti da categoria e car passada por parametor.
	#parametro - Category.
	def self.get_part_by_car_category(params_car, params_category)
		@parts = Part.where("car_id = ? and category_id = ?", params_car, params_category)
	end

end

