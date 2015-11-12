class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]

  def new
   @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && UserMailer.account_activation(@user).deliver_now
	    flash[:success] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
   @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name,
				:email,
				:password,
				:password_confirmation)
  end
end
