class ApplicationController < ActionController::Base

  http_basic_authenticate_with name: ENV['user_name'], password: ENV['app_password']

end
