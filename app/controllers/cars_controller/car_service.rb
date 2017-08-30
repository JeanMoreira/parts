class CarsController::CarService
	attr_accessor :car #Atalho para criar metodos de leitura  e variavel  de instancia.

	#criar carro
	def self.create(params_car)
		@car = Car.new(params_car)
		if @car.valid?
			@car.save!
		end		
		@car
	end
	
end	