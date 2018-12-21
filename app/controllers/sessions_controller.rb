class SessionsController < ApplicationController

  before_action :check_exisiting_session, only: :new

  def new; end

  def destroy
    cookies.clear
    reset_session
    redirect_to login_path, info: 'Logged out successfull.'
  end

  private def check_exisiting_session
    if cookies.signed[:user_token].present?
      redirect_to home_path, info: 'Already Logged in.'
    end
  end

end
