class Site::Profile::PartsController < Site::ProfileController
    before_action :set_part, only: [:edit, :update, :destroy]
    
      # GET /parts
      # GET /parts.json
      def index
        puts("-------------")
        puts(current_member)
        @parts = get_part_by_member(current_member)
        @categories = Category.all
      end
    
      # GET /parts/1
      # GET /parts/1.json
      def show
      end
    
      # GET /parts/new
      def new
        @part = Part.new
      end
    
      # GET /parts/1/edit
      def edit
      end
    
      # POST /parts
      # POST /parts.json
      def create
        @part = Part.new(part_params)
        
        respond_to do |format|
          if @part.save
            format.html { redirect_to site_profile_parts_path, notice: 'Part was successfully created.' }
            format.json { render :show, status: :created, location: @part }
          else
            format.html { render :new }
            format.json { render json: @part.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /parts/1
      # PATCH/PUT /parts/1.json
      def update
        respond_to do |format|
          if @part.update(part_params)
            format.html { redirect_to site_profile_parts_path, notice: 'Part was successfully updated.' }
            format.json { render :show, status: :ok, location: @part }
          else
            format.html { render :edit }
            format.json { render json: @part.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /parts/1
      # DELETE /parts/1.json
      def destroy
        @part.destroy
        respond_to do |format|
          format.html { redirect_to site_profile_parts_path, notice: 'Part was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_part
          @part = Part.find(params[:id])
        end
    
        # Never trust parameters from the scary internet, only allow the white list through.
        def part_params
          #apos a verificacao ele vai ignorar o car_id
          params.require(:part).permit(:car_id, :description, :category_id,:picture)
        end
    
        #Verificar se o id do car_id esta em branco e informa 
        def car_id_blank?
          params[:part][:car_id].blank?
        end

        def get_part_by_member(current_member)
          puts("Entrou aqui")
          @parts = Part.joins(company_part: [{company: :company_member}]).where("Company_members.member_id = ?", current_member)
          if @parts.nil?
            puts("Entrou aqui2")
            @parts = Array.new
          else
            puts("Entrou aqui3")
            @parts
          end
          
        end
end
