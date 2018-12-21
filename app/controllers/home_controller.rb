class HomeController < ApplicationController

  before_action :set_user

  def index
  end

  private def set_user
    @current_user = User.find_by(token: cookies.signed[:user_token])
    unless @current_user
      redirect_to login_path, info: "You need to Log-In to continue."
    end
  end

end
