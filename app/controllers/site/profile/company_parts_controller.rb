class Site::Profile::CompanyPartsController < Site::ProfileController
    before_action :set_ad, only: [:edit]
    
    def index
        @companyParts = CompanyPart.all
    end

    def edit
    end



    private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @cp = CompanyPart.find(params[:id])
    end

    def set_params
        params.require(:ad).permit(:company_id, :part_id)
    end
end
