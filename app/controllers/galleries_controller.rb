class GalleriesController < ApplicationController
  # before_action :logged_in?, only: [:index]
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /galleries/new
  def new
    @gallery = Gallery.new
    @ads = Ad.all
    @users = User.all
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)
    # Must attach current user to gallery
    # @gallery.user_id << @current_user

    @gallery.ads = []
    unless params[:gallery][:ad_ids].nil?
      params[:gallery][:ad_ids].each do |ad_id|
        @gallery.ads << Ad.find(ad_id) unless ad_id.empty?
      end
    end

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
    @companies = Company.all
    @users = User.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
  end

  # GET /galleries/1/edit
  def edit
    @ads = Ad.all
    @users = User.all
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    @ads = Ad.all

    @gallery.ads = []
    unless params[:gallery][:ad_ids].nil?
      params[:gallery][:ad_ids].each do |ad_id|
        @gallery.ads << Ad.find(ad_id) unless ad_id.empty?
      end
    end

    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_path, notice: 'Gallery was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
  def set_gallery
    @gallery = Gallery.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name, :category, :user_id, :ad_ids)
  end
end
