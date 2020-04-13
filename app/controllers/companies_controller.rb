class CompaniesController < ApplicationController
  # before_action :logged_in?, only: [:index]
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies/new
  def new
    @company = Company.new
    @users = User.all
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    # Must attach current user to company
    # @company.user_id << @current_user
    # @company.users = []
    # unless params[:user][:user_ids].nil?
    #   params[:user][:user_ids].each do |user_id|
    #     @company.users << User.find(user_id) unless user_id.empty?
    #   end
    # end

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
    if @companies
      render json: {
          companies: @companies
      }
    else
      render json: {
        status: 500,
        errors: ['No companies']
      }
    end
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @companies = Company.all
  end

  # GET /companies/1/edit
  def edit
    @users = User.all
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    @company.users = []
    unless params[:user][:user_ids].nil?
      params[:user][:user_ids].each do |user_id|
        @company.users << User.find(user_id) unless user_id.empty?
      end
    end

    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_path, notice: 'Company was successfully destroyed' }
      format.json { head :no_content }
    end
  end

  private
  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :description, :image, :user_ids)
  end
end
