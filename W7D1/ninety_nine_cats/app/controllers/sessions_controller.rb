class SessionsController < ApplicationController
  before_action :prevent_new, except: :destroy

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
    )

    if user
      login_user!(user)
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
