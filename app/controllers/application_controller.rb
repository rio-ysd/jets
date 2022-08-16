class ApplicationController < Jets::Controller::Base
  before_action :require_sign_in!
  helper_method :signed_in?, :current_user
  protect_from_forgery with: :exception

  def current_user
    remember_token = session[:user_remember_token]
    if remember_token.blank?
      return nil
    end
    User.find_by(remember_token: remember_token)
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    session[:user_remember_token] = remember_token
    user.update!(remember_token: remember_token)
  end

  def sign_out
    session[:user_remember_token] = nil
  end

  def signed_in?
    current_user.present?
  end

  def require_sign_in!
    redirect_to login_path unless signed_in?
  end
end