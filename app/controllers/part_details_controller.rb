class PartDetailsController < ApplicationController
  before_action :set_part_detail, only: [:show, :edit, :update, :destroy]

  # GET /part_details
  # GET /part_details.json
  def index
    @part_details = PartDetail.all
  end

  # GET /part_details/1
  # GET /part_details/1.json
  def show
  end

  # GET /part_details/new
  def new
    @part_detail = PartDetail.new
  end

  # GET /part_details/1/edit
  def edit
  end

  # POST /part_details
  # POST /part_details.json
  def create
    @part_detail = PartDetail.new(part_detail_params)

    respond_to do |format|
      if @part_detail.save
        format.html { redirect_to @part_detail, notice: 'Part detail was successfully created.' }
        format.json { render :show, status: :created, location: @part_detail }
      else
        format.html { render :new }
        format.json { render json: @part_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_details/1
  # PATCH/PUT /part_details/1.json
  def update
    respond_to do |format|
      if @part_detail.update(part_detail_params)
        format.html { redirect_to @part_detail, notice: 'Part detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_detail }
      else
        format.html { render :edit }
        format.json { render json: @part_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_details/1
  # DELETE /part_details/1.json
  def destroy
    @part_detail.destroy
    respond_to do |format|
      format.html { redirect_to part_details_url, notice: 'Part detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_detail
      @part_detail = PartDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_detail_params
      params.require(:part_detail).permit(:price_cents, :negotiabel, :quantity, :company_part_id)
    end
end
