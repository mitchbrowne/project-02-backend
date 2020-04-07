class AdsController < ApplicationController
  # before_action :logged_in?, only: [:index]
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  # GET /ads/new
  def new
    @ad = Ad.new
    @companies = Company.all
  end

  # POST /ads
  # POST /ads.json
  def create
    @ad = Ad.new(ad_params)
    # Must attach current user to ad, including their company id
    # @ad.user_id << @current_user
    # @ad.company_id << @current_user.company
    @ad.save
  end

  # GET /ads
  # GET /ads.json
  def index
    @ads = Ad.all
  end

  # GET /ads/1
  # GET /ads/1.json
  def show
  end

  # GET /ads/1/edit
  def edit
    @companies = Company.all
  end

  # PATCH/PUT /ads/1
  # PATCH/PUT /ads/1.json
  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
        format.json { render :show, status: :ok, location: @ad }
      else
        format.html { render :edit }
        format.json { render json: @ad.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_path, notice: 'Ad was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
  def set_ad
    @ad = Ad.find(params[:id])
  end

  def ad_params
    params.require(:ad).permit(:name, :ad_type, :image, :company_id)
  end
end
