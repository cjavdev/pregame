class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_login!

  def require_login!
    redirect_to "/session/new" if !current_user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end
end
