class Mypage::UsersController < Mypage::ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :set_user, only: %i[show edit update delete]
  
  
  # GET /users
  def index
    @users = User.where(company_id: current_user.company_id)
  end

  # GET /users/1
  def show
    # TODO: Userテーブルにroleカラムを追加後に、管理者だけ同一company_idのユーザーを全て閲覧できるように修正する
    if @user.company_id != current_user.company_id
      redirect_to mypage_users_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # TODO: Userテーブルにroleカラムを追加後に、管理者だけ同一company_idのユーザーを全て閲覧できるように修正する
    if @user.company_id != current_user.company_id
      redirect_to mypage_users_path
    end    
  end

  # POST /users
  def create
    @user = current_user.company.users.new(user_params)
    if @user.save
      redirect_to mypage_user_path(@user)
    else
      render :new
    end
  end

  # PUT /users/1
  def update
   if user_params[:password].present?
     if @user.authenticate(user_params[:old_password])
       @user.update(password: user_params[:password])
       redirect_to mypage_user_path(@user)
     else
       render :edit
     end
   else
     user_params.delete('old_password')
     @user.update(user_params)
     redirect_to mypage_user_path(@user)
   end
 end

  # DELETE /users/1
  def delete
    # TODO: Userテーブルにroleカラムを追加後に、管理者だけ同一company_idのユーザーを全て閲覧できるように修正する
    if @user.company_id != current_user.company_id
      redirect_to mypage_users_path
    end
 
    @user.destroy
    redirect_to users_path
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      @user_params ||= params.require(:user).permit(%i[name email old_password password password_confirmation])
    end
end
  