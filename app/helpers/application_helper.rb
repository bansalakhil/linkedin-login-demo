module ApplicationHelper

  def user_logged_in?
    cookies.signed[:user_token].present?
  end

end
