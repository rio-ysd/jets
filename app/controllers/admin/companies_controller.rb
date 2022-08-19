class Admin::CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :delete]
  
    # GET /companies
    def index
      @companies = Company.all
    end
  
    # GET /companies/1
    def show
    end
  
    # GET /companies/new
    def new
      @company = Company.new
    end
  
    # GET /companies/1/edit
    def edit
    end
  
    # POST /companies
    def create
      @company = Company.new(company_params)
      @user = @company.users.new
      @user.company_id = @company.id
      @user.email = params['company']['users']['email']
      @user.name = params['company']['users']['user']
      password = SecureRandom.alphanumeric()
      @user.password = password
      puts "+++++++++++++++++++++++++++++++++++++++++++++"
      puts "ここにパスワードを通知する処理を書く"
      puts password
      puts "+++++++++++++++++++++++++++++++++++++++++++++"
      unless @user.valid? && @company.valid?
        render :new
      end
      if @company.save
        redirect_to admin_company_path(@company)
      else
        render :new
      end
    end

    # PUT /companies/1
    def update
      if @company.update(company_params)
        redirect_to compaadmin_company_pathny_path(@company)
      else
        render :edit
      end
    end
  
    # DELETE /companies/1
    def delete
      @company.destroy
      redirect_to admin_company_path
    end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end
  
    def company_params
      params.require(:company).permit(:name, users_attributes: [:name, :email])
    end
  end