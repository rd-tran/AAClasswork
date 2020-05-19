class UsersController < ApplicationController
  before_action :prevent_new
  
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(user)
      redirect_to cats_url
    else
      render @user.errors.full_messages, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
