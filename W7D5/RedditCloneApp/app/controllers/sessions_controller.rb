class SessionsController < ApplicationController
  before_action :require_login, except: %i[new create]
  before_action :redirect_to_root, only: %i[new create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login(@user)
      redirect_to root_url
    else
      flash[:errors] = ['Invalid username or password']
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
