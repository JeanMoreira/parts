class PartsController::PartService
    attr_accessor :part #Atalho para criar metodos de leitura e variavel de instancia
   
    def self.create(params_part)
		@part = Part.new(params_part)
		if @part.valid?
			@part.save!
		end 
		@part       
    end

end

