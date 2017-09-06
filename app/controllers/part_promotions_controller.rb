class PartPromotionsController < ApplicationController
  before_action :set_part_promotion, only: [:show, :edit, :update, :destroy]

  # GET /part_promotions
  # GET /part_promotions.json
  def index
    @part_promotions = PartPromotion.all
  end

  # GET /part_promotions/1
  # GET /part_promotions/1.json
  def show
  end

  # GET /part_promotions/new
  def new
    @part_promotion = PartPromotion.new
  end

  # GET /part_promotions/1/edit
  def edit
  end

  # POST /part_promotions
  # POST /part_promotions.json
  def create
    @part_promotion = PartPromotion.new(part_promotion_params)

    respond_to do |format|
      if @part_promotion.save
        format.html { redirect_to @part_promotion, notice: 'Part promotion was successfully created.' }
        format.json { render :show, status: :created, location: @part_promotion }
      else
        format.html { render :new }
        format.json { render json: @part_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_promotions/1
  # PATCH/PUT /part_promotions/1.json
  def update
    respond_to do |format|
      if @part_promotion.update(part_promotion_params)
        format.html { redirect_to @part_promotion, notice: 'Part promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_promotion }
      else
        format.html { render :edit }
        format.json { render json: @part_promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_promotions/1
  # DELETE /part_promotions/1.json
  def destroy
    @part_promotion.destroy
    respond_to do |format|
      format.html { redirect_to part_promotions_url, notice: 'Part promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_promotion
      @part_promotion = PartPromotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_promotion_params
      params.require(:part_promotion).permit(:needed_buy, :price_cents, :stock_quantity, :company_part_id)
    end
end
