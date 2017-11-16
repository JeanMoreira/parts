class AdsController < BackofficeController
    before_action :set_ad, only: [:edit, :update]
    def index
        @ads = Ad.all
    end

    # GET /ad/1
    # GET /ad/1.json
    def show
    end

    # GET /ad/new
    def new
        @ad = Ad.new
    end

    # GET /ad/1/edit
    def edit
    end


    #busca as partes que existem dentro da company part.
	def get_part_by_company_part
        @parts = PartsController::PartService.get_part_by_company_part(params[:param_part])
        if !@parts.nil?
            respond_to do |format|
                format.json{ render json: @parts}
            end    
        else
            #não foi encontrado as informacoes
        end
	end
  
     #busca as partes que existem dentro da company part.
	def get_company_by_company_part
        @parts = CompaniesController::CompanyService.get_company_by_company_part(params[:param_part])
        if !@parts.nil?
            respond_to do |format|
                format.json{ render json: @parts}
            end    
        else
            #não foi encontrado as informacoes
        end
	end



    def update
       @ad.update(params) 
    end

    def create
    #acesso a um servico onde estara as regras de negocio do sistema.
        @ad = AdsController::AdService.create(params)
        respond_to do |format|  
        unless @ad.errors.any? 
            format.html { redirect_to ads_path, notice: 'Ad was successfully created.' }
            format.json { render :show, status: :created, location: @ad }
        else
            format.html { render :new }
            format.json { render json: @ad.errors, status: :unprocessable_entity }
        end
        end 
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    def set_params
        params.require(:ad).permit(:description, :member_id, :price, :title, :company_part_id)
    end
end
