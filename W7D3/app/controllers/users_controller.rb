class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))

    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = [@user.errors.full_messages]
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
