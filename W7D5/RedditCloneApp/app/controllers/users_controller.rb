class UsersController < ApplicationController
  before_action :require_login, except: %i[new create]
  before_action :redirect_to_root, only: %i[new create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
    else
      flash[:errors] = @user.errors.full_messages
    end

    redirect_to root_url
  end

  def edit
    @user = User.find(params[:id])

    if current_user.id == @user.id
      render :edit
    else
      flash[:errors] = ['Must be logged into account to edit user']
    end
  end

  def update
    @user = User.find(params[:id])

    if current_user.id == @user.id
      if @user == User.update
        redirect_to user_url(@user)
      else
        flash[:errors] = @user.errors.full_messages
        redirect_to edit_user_url(@user)
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
