class OauthController < ApplicationController

  def callback
    begin
      saved_user = save_or_update_user(request.env['omniauth.auth'])
      if saved_user
        set_session(request.env['omniauth.auth'])
        redirect_to home_path
      end
    rescue => error
      set_flash_and_redirect
    end
  end

  def failure
    set_flash_and_redirect
  end

  private def set_flash_and_redirect
    flash[:alert] = "There was an error while trying to authenticate your account."
    redirect_to login_path
  end

  private def save_or_update_user(auth_hash)
    user_service = UserService.new(auth_hash)
    user_service.create_user
  end

  private def set_session(auth_hash)
    cookies.signed[:user_token] = auth_hash[:uid]
  end

end
