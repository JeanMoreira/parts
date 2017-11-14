class CompaniesController::CompanyService	
    include ActiveModel::Model    
    attr_accessor :company
    attr_accessor :companyMember

    #salva a empresa e vincula o companinha com o membro
    def self.create_company_and_join_companyMember(params_company, id_member)
        # trasaciton para defender a integridade do save dos dados
        ActiveRecord::Base.transaction do 
            @company = Company.new(params_company)
            if @company.valid? 
                @company.save! # salva a companhia
                puts "Foi salvo com sucesso #{@company}"
                @companyMember = CompanyMember.new(company_id: @company, member_id: id_member)# istancia a companyMember
                if @companyMember.valid?
                    @companyMember.save! #salvar a companyMeber,fazendo o join do member com a company
                else
                    @companyMember        
                    puts "Foi salvo com sucesso #{@company}"
                end    
            end    
        end   
        @company 
    end
    
    
   
end