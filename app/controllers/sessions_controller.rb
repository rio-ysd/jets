class SessionsController < ApplicationController
  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :set_user, only: [:create]
  
  def new
    if current_user.present?
      redirect_to mypage_users_path
    end
  end

  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to mypage_users_path
    else
      render template: "sessions/new"
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private

    def set_user
      @user = User.find_by!(email: session_params[:email])
    rescue
      render template: "sessions/new"
    end

    # 許可するパラメータ
    def session_params
      params.require(:sessions).permit(:email, :password)
    end

end