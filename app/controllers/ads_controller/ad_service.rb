class AdsController::AdService
	attr_accessor :ad #Atalho para criar metodos de leitura  e variavel  de instancia.

	#criar ad
	def self.create(params_ad)
		part_param = params_ad[:company_part][:part_id]
		company_param = params_ad[:company_part][:company_id]
		companyPart =  CompaniesController::CompanyService.get_company_part_by_part_company( part_param, company_param )
		
		@ad = Ad.new
		@ad.description = params_ad[:ad][:description]
		@ad.price_cents = params_ad[:ad][:price]
		@ad.title = params_ad[:ad][:title]
		@ad.company_part_id = companyPart[:id]
		if @ad.valid?
			@ad.save!
		end		
		@ad
	end
	
	def self.update(params_ad)
		part_param = params_ad[:company_part][:part_id]
		company_param = params_ad[:company_part][:company_id]
		companyPart =  CompaniesController::CompanyService.get_company_part_by_part_company( part_param, company_param )
		
		@ad = Ad.new
		@ad.id = params_ad[:ad][:id]
		@ad.description = params_ad[:ad][:description]
		@ad.price_cents = params_ad[:ad][:price]
		@ad.title = params_ad[:ad][:title]
		@ad.company_part_id = companyPart[:id]
		if @ad.valid?
			@ad.update(@ad)
		end		
		@ad
	end




end	