class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserNotifier.send_signup_email(@user).deliver
      session[:user_id] = @user.id
      redirect_to "/dashboard"
    else
      flash.now[:error] = "#{@user.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def show
    @user = current_user
    if current_admin?
        redirect_to admin_dashboard_path
    elsif current_user
    else
      render file: "/public/404"
    end
  end

    def edit
      @user = current_user
    end

    def update
      if current_user.update(user_params)
        flash.now[:success] = "Successfully updated account with new information"
        redirect_to dashboard_path
      else
        @user = current_user
        flash.now[:error] = "Update was not made"
        render :edit
      end
    end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end
