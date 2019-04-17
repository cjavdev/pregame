class UsersController< ApplicationController
  skip_before_action :require_login!

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:token] = @user.reset_session_token!
      redirect_to "/ideas"
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
