class ApplicationController < ActionController::Base

  http_basic_authenticate_with name: Rails.application.credentials.user_name, password: Rails.application.credentials.app_password

end
