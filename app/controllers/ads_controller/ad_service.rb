class AdsController::CarService
	attr_accessor :ad #Atalho para criar metodos de leitura  e variavel  de instancia.

	#criar ad
	def self.create(params_ad)
		@ad = Ad.new(params_ad)
		if @ad.valid?
			@ad.save!
		end		
		@ad
	end
	
end	