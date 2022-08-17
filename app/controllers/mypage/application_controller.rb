class Mypage::ApplicationController < ApplicationController
  before_action :require_sign_in!
  def require_sign_in!
    redirect_to login_path unless signed_in?
  end
end
