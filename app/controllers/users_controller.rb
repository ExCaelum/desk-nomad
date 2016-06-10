class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash.now[:error] = "Invalid Entry"
      render :new
    end
  end

  def show
    @user = current_user
    if current_admin?
        redirect_to admin_dashboard_path
    else
      current_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end
