class Site::Profile::AdsController < Site::ProfileController
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

    def update
       @ad.update(params) 
    end

    def create
    #acesso a um servico onde estara as regras de negocio do sistema.
        @ad = AdService.create(ad_params)
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
        params.require(:ad).permit(:description, :member_id, :part_id, :price_cents)
    end
end
