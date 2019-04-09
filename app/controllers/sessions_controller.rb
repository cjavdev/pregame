class SessionsController < ApplicationController
  skip_before_action :require_login!

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    if !@user.nil? && @user.is_password?(user_params[:password])
      session[:token] = @user.reset_session_token!
      redirect_to ideas_path
    else
      @user = User.new(email: user_params[:email])
      flash.now[:errors] = ["Hmm didn't find a user with that combo."]
      render :new
    end
  end

  def destroy
    session[:token] = nil
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
